# Case 9 - Function on Indexed Date

## Prompt
Return orders placed on 10-Feb-2026.

## AI Candidate Answer
```sql
SELECT order_id, order_number
  FROM demo_orders
 WHERE TO_CHAR(order_date, 'YYYY-MM-DD') = '2026-02-10';
```

## Evaluation
Applying a function to an indexed date column can inhibit efficient range access.

## Reference Solution
```sql
SELECT order_id, order_number
  FROM demo_orders
 WHERE order_date >= DATE '2026-02-10'
   AND order_date <  DATE '2026-02-11';
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
Production-quality evaluation includes access-path and scalability considerations.

## Validation Approach
Run the synthetic schema and sample data, then compare the candidate output with the reference result and expected business rule.

---
All examples use synthetic data and fictional business scenarios.
