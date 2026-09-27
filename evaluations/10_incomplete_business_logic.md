# Case 10 - Incomplete Business Logic

## Prompt
Return orders that can be fully fulfilled from on-hand inventory.

## AI Candidate Answer
```sql
SELECT DISTINCT o.order_number
  FROM demo_orders o
  JOIN demo_order_lines ol ON ol.order_id = o.order_id
  JOIN demo_inventory inv ON inv.item_id = ol.item_id
 WHERE inv.onhand_quantity >= ol.ordered_quantity;
```

## Evaluation
The query returns an order when any one line is fulfillable instead of requiring every line to be fulfillable.

## Reference Solution
```sql
SELECT o.order_number
  FROM demo_orders o
  JOIN demo_order_lines ol ON ol.order_id = o.order_id
  JOIN demo_inventory inv ON inv.item_id = ol.item_id
 GROUP BY o.order_number
HAVING SUM(
           CASE
             WHEN inv.onhand_quantity >= ol.ordered_quantity THEN 0
             ELSE 1
           END
       ) = 0;
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
Validate the actual business requirement, not just whether the SQL runs.

## Validation Approach
Run the synthetic schema and sample data, then compare the candidate output with the reference result and expected business rule.

---
All examples use synthetic data and fictional business scenarios.
