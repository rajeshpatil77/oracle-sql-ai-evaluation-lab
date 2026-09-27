-- Case 1: Invalid GROUP BY
SELECT c.customer_name,
       SUM(ol.ordered_quantity * ol.unit_price) total_value
  FROM demo_customers c
  JOIN demo_orders o ON o.customer_id = c.customer_id
  JOIN demo_order_lines ol ON ol.order_id = o.order_id
 GROUP BY c.customer_name;

-- Case 2: Join Multiplication
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

-- Case 3: Latest Row per Customer
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

-- Case 4: NULL Comparison
SELECT shipment_id, tracking_number
  FROM demo_shipments
 WHERE ship_date IS NULL;

-- Case 5: NOT IN and NULL
SELECT customer_id, customer_name
  FROM demo_customers
 WHERE customer_id <> 2;

-- Case 6: Nondeterministic ROW_NUMBER
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

-- Case 7: SUM(DISTINCT ...) Misuse
SELECT o.order_number, q.total_qty
  FROM demo_orders o
  JOIN (
        SELECT order_id, SUM(ordered_quantity) total_qty
          FROM demo_order_lines
         GROUP BY order_id
       ) q ON q.order_id = o.order_id;

-- Case 8: Correlated Aggregate Performance
SELECT o.order_number, q.total_qty
  FROM demo_orders o
  JOIN (
        SELECT order_id, SUM(ordered_quantity) total_qty
          FROM demo_order_lines
         GROUP BY order_id
       ) q ON q.order_id = o.order_id;

-- Case 9: Function on Indexed Date
SELECT order_id, order_number
  FROM demo_orders
 WHERE order_date >= DATE '2026-02-10'
   AND order_date <  DATE '2026-02-11';

-- Case 10: Incomplete Business Logic
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
