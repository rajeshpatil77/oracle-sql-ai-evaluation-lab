# Case 2 - Join Multiplication

## Prompt
Return total ordered quantity and shipment count by order.

## AI Candidate Answer
```sql
SELECT o.order_number,
       SUM(ol.ordered_quantity) total_qty,
       COUNT(s.shipment_id) shipment_count
  FROM demo_orders o
  JOIN demo_order_lines ol ON ol.order_id = o.order_id
  JOIN demo_shipments s ON s.order_id = o.order_id
 GROUP BY o.order_number;
```

## Evaluation
Multiple lines combined with multiple shipments multiply rows and overstate both aggregates.

## Reference Solution
```sql
SELECT o.order_number,
       q.total_qty,
       s.shipment_count
  FROM demo_orders o
  JOIN (
        SELECT order_id, SUM(ordered_quantity) total_qty
          FROM demo_order_lines
         GROUP BY order_id
       ) q ON q.order_id = o.order_id
  JOIN (
        SELECT order_id, COUNT(*) shipment_count
          FROM demo_shipments
         GROUP BY order_id
       ) s ON s.order_id = o.order_id;
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
Reason about data grain before aggregating across one-to-many relationships.

## Validation Approach
Run the synthetic schema and sample data, then compare the candidate output with the reference result and expected business rule.

---
All examples use synthetic data and fictional business scenarios.
