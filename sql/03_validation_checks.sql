PROMPT Expected latest order for customer 1 = SO-1002
SELECT customer_id, order_number, order_date
  FROM (
        SELECT customer_id, order_number, order_date, order_id,
               ROW_NUMBER() OVER (
                   PARTITION BY customer_id
                   ORDER BY order_date DESC, order_id DESC
               ) rn
          FROM demo_orders
       )
 WHERE customer_id = 1
   AND rn = 1;

PROMPT Expected total ordered quantity for SO-1001 = 3
SELECT o.order_number, SUM(ol.ordered_quantity) total_qty
  FROM demo_orders o
  JOIN demo_order_lines ol ON ol.order_id = o.order_id
 WHERE o.order_id = 1001
 GROUP BY o.order_number;
