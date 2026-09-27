-- Case 1: Invalid GROUP BY
SELECT c.customer_name,
       SUM(ol.ordered_quantity * ol.unit_price) total_value,
       o.status
  FROM demo_customers c
  JOIN demo_orders o ON o.customer_id = c.customer_id
  JOIN demo_order_lines ol ON ol.order_id = o.order_id
 GROUP BY c.customer_name;

-- Case 2: Join Multiplication
SELECT o.order_number,
       SUM(ol.ordered_quantity) total_qty,
       COUNT(s.shipment_id) shipment_count
  FROM demo_orders o
  JOIN demo_order_lines ol ON ol.order_id = o.order_id
  JOIN demo_shipments s ON s.order_id = o.order_id
 GROUP BY o.order_number;

-- Case 3: Latest Row per Customer
SELECT customer_id,
       MAX(order_date) latest_order_date,
       MAX(order_number) order_number
  FROM demo_orders
 GROUP BY customer_id;

-- Case 4: NULL Comparison
SELECT shipment_id, tracking_number
  FROM demo_shipments
 WHERE ship_date = NULL;

-- Case 5: NOT IN and NULL
SELECT customer_id, customer_name
  FROM demo_customers
 WHERE customer_id NOT IN (2, NULL);

-- Case 6: Nondeterministic ROW_NUMBER
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

-- Case 7: SUM(DISTINCT ...) Misuse
SELECT o.order_number,
       SUM(DISTINCT ol.ordered_quantity) total_qty
  FROM demo_orders o
  JOIN demo_order_lines ol ON ol.order_id = o.order_id
  JOIN demo_shipments s ON s.order_id = o.order_id
 GROUP BY o.order_number;

-- Case 8: Correlated Aggregate Performance
SELECT o.order_number,
       (SELECT SUM(ol.ordered_quantity)
          FROM demo_order_lines ol
         WHERE ol.order_id = o.order_id) total_qty
  FROM demo_orders o;

-- Case 9: Function on Indexed Date
SELECT order_id, order_number
  FROM demo_orders
 WHERE TO_CHAR(order_date, 'YYYY-MM-DD') = '2026-02-10';

-- Case 10: Incomplete Business Logic
SELECT DISTINCT o.order_number
  FROM demo_orders o
  JOIN demo_order_lines ol ON ol.order_id = o.order_id
  JOIN demo_inventory inv ON inv.item_id = ol.item_id
 WHERE inv.onhand_quantity >= ol.ordered_quantity;
