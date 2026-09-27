# Case 7 - SUM(DISTINCT ...) Misuse

## Prompt
Fix overstated quantities caused by joining order lines to shipments.

## AI Candidate Answer
```sql
SELECT o.order_number,
       SUM(DISTINCT ol.ordered_quantity) total_qty
  FROM demo_orders o
  JOIN demo_order_lines ol ON ol.order_id = o.order_id
  JOIN demo_shipments s ON s.order_id = o.order_id
 GROUP BY o.order_number;
```

## Evaluation
`SUM(DISTINCT ...)` can remove legitimate repeated quantities and does not fix incorrect join grain.

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
DISTINCT is not a substitute for correcting join logic.

## Validation Approach
Run the synthetic schema and sample data, then compare the candidate output with the reference result and expected business rule.

---
All examples use synthetic data and fictional business scenarios.
