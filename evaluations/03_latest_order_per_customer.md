# Case 3 - Latest Row per Customer

## Prompt
Return the most recent order for each customer.

## AI Candidate Answer
```sql
SELECT customer_id,
       MAX(order_date) latest_order_date,
       MAX(order_number) order_number
  FROM demo_orders
 GROUP BY customer_id;
```

## Evaluation
`MAX(order_number)` is independent of `MAX(order_date)` and may come from a different row.

## Reference Solution
```sql
SELECT customer_id, order_number, order_date
  FROM (
        SELECT customer_id,
               order_number,
               order_date,
               order_id,
               ROW_NUMBER() OVER (
                   PARTITION BY customer_id
                   ORDER BY order_date DESC, order_id DESC
               ) rn
          FROM demo_orders
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
Use row-ranking logic when the requirement is to return the row associated with the maximum date.

## Validation Approach
Run the synthetic schema and sample data, then compare the candidate output with the reference result and expected business rule.

---
All examples use synthetic data and fictional business scenarios.
