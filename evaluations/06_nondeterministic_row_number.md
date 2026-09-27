# Case 6 - Nondeterministic ROW_NUMBER

## Prompt
Return exactly one latest order per customer when dates can tie.

## AI Candidate Answer
```sql
SELECT *
  FROM (
        SELECT o.*,
               ROW_NUMBER() OVER (
                   PARTITION BY customer_id
                   ORDER BY order_date DESC
               ) rn
          FROM demo_orders o
       )
 WHERE rn = 1;
```

## Evaluation
The ordering is incomplete when two orders share the same date.

## Reference Solution
```sql
SELECT *
  FROM (
        SELECT o.*,
               ROW_NUMBER() OVER (
                   PARTITION BY customer_id
                   ORDER BY order_date DESC, order_id DESC
               ) rn
          FROM demo_orders o
       )
 WHERE rn = 1;
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
Ranking should be deterministic whenever one row must be selected.

## Validation Approach
Run the synthetic schema and sample data, then compare the candidate output with the reference result and expected business rule.

---
All examples use synthetic data and fictional business scenarios.
