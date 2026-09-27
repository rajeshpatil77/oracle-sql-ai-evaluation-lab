# Case 5 - NOT IN and NULL

## Prompt
Return customers whose id is not in an exclusion list that may contain NULL.

## AI Candidate Answer
```sql
SELECT customer_id, customer_name
  FROM demo_customers
 WHERE customer_id NOT IN (2, NULL);
```

## Evaluation
A NULL inside a NOT IN list makes comparisons UNKNOWN and can eliminate every row.

## Reference Solution
```sql
SELECT customer_id, customer_name
  FROM demo_customers
 WHERE customer_id <> 2;
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
Anti-join logic must explicitly account for NULL.

## Validation Approach
Run the synthetic schema and sample data, then compare the candidate output with the reference result and expected business rule.

---
All examples use synthetic data and fictional business scenarios.
