# Case 8 - Correlated Aggregate Performance

## Prompt
Return each order and its total ordered quantity.

## AI Candidate Answer
```sql
SELECT o.order_number,
       (SELECT SUM(ol.ordered_quantity)
          FROM demo_order_lines ol
         WHERE ol.order_id = o.order_id) total_qty
  FROM demo_orders o;
```

## Evaluation
The result can be correct, but repeated correlated aggregation may scale poorly on large datasets.

## Reference Solution
```sql
SELECT o.order_number, q.total_qty
  FROM demo_orders o
  JOIN (
        SELECT order_id, SUM(ordered_quantity) total_qty
          FROM demo_order_lines
         GROUP BY order_id
       ) q ON q.order_id = o.order_id;
```

## Evaluation Rubric
| Dimension | Rating |
|---|---|
| Syntax correctness | Pass / Fail |
| Logical correctness | Pass / Fail |
| Oracle compatibility | Pass / Fail |
| Edge-case handling | Good / Partial / Missing |
| Performance / scalability | Good / Acceptable / Poor |
| Explanation quality | Strong / Moderate / Weak |

## Lesson Learned
AI evaluation should distinguish correctness from enterprise scalability.

## Validation Approach
Run the synthetic schema and sample data, then compare the candidate output with the reference result and expected business rule.

---
All examples use synthetic data and fictional business scenarios.
