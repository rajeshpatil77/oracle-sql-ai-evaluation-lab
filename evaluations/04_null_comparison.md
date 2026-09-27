# Case 4 - NULL Comparison

## Prompt
Return shipments that do not yet have a ship date.

## AI Candidate Answer
```sql
SELECT shipment_id, tracking_number
  FROM demo_shipments
 WHERE ship_date = NULL;
```

## Evaluation
`= NULL` never evaluates TRUE in SQL three-valued logic.

## Reference Solution
```sql
SELECT shipment_id, tracking_number
  FROM demo_shipments
 WHERE ship_date IS NULL;
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
NULL requires explicit `IS NULL` / `IS NOT NULL` logic.

## Validation Approach
Run the synthetic schema and sample data, then compare the candidate output with the reference result and expected business rule.

---
All examples use synthetic data and fictional business scenarios.
