# Case 1 - Invalid GROUP BY

## Prompt
Return each customer name and total order-line value.

## AI Candidate Answer
```sql
SELECT c.customer_name,
       SUM(ol.ordered_quantity * ol.unit_price) total_value,
       o.status
  FROM demo_customers c
  JOIN demo_orders o ON o.customer_id = c.customer_id
  JOIN demo_order_lines ol ON ol.order_id = o.order_id
 GROUP BY c.customer_name;
```

## Evaluation
`o.status` is selected but is neither aggregated nor included in the GROUP BY. Oracle raises ORA-00979.

## Reference Solution
```sql
SELECT c.customer_name,
       SUM(ol.ordered_quantity * ol.unit_price) total_value
  FROM demo_customers c
  JOIN demo_orders o ON o.customer_id = c.customer_id
  JOIN demo_order_lines ol ON ol.order_id = o.order_id
 GROUP BY c.customer_name;
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
Every nonaggregated selected expression must be represented correctly in the GROUP BY.

## Validation Approach
Run the synthetic schema and sample data, then compare the candidate output with the reference result and expected business rule.

---
All examples use synthetic data and fictional business scenarios.
