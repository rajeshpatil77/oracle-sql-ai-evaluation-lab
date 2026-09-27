INSERT INTO demo_customers VALUES (1, 'NorthStar Retail');
INSERT INTO demo_customers VALUES (2, 'BluePeak Labs');
INSERT INTO demo_customers VALUES (3, 'Summit Supply');

INSERT INTO demo_items VALUES (101, 'ITEM-1001', 'Standard Widget', 10.00);
INSERT INTO demo_items VALUES (102, 'ITEM-1002', 'Assembly Kit', 25.00);
INSERT INTO demo_items VALUES (103, 'ITEM-1003', 'Replacement Module', 8.50);
INSERT INTO demo_items VALUES (104, 'ITEM-1004', 'Accessory Pack', 5.00);

INSERT INTO demo_orders VALUES (1001, 'SO-1001', 1, DATE '2026-01-05', 'SHIPPED');
INSERT INTO demo_orders VALUES (1002, 'SO-1002', 1, DATE '2026-02-10', 'SHIPPED');
INSERT INTO demo_orders VALUES (1003, 'SO-1003', 2, DATE '2026-02-10', 'BOOKED');
INSERT INTO demo_orders VALUES (1004, 'SO-1004', 2, DATE '2026-02-10', 'SHIPPED');
INSERT INTO demo_orders VALUES (1005, 'SO-1005', 3, DATE '2026-03-01', 'BOOKED');

INSERT INTO demo_order_lines VALUES (5001, 1001, 101, 2, 10.00);
INSERT INTO demo_order_lines VALUES (5002, 1001, 102, 1, 25.00);
INSERT INTO demo_order_lines VALUES (5003, 1002, 101, 3, 10.00);
INSERT INTO demo_order_lines VALUES (5004, 1002, 103, 4, 8.50);
INSERT INTO demo_order_lines VALUES (5005, 1003, 104, 2, 5.00);
INSERT INTO demo_order_lines VALUES (5006, 1004, 102, 2, 25.00);
INSERT INTO demo_order_lines VALUES (5007, 1005, 103, 1, 8.50);

INSERT INTO demo_shipments VALUES (9001, 1001, 'TRK-1001-A', DATE '2026-01-06');
INSERT INTO demo_shipments VALUES (9002, 1001, 'TRK-1001-B', DATE '2026-01-07');
INSERT INTO demo_shipments VALUES (9003, 1002, 'TRK-1002-A', DATE '2026-02-11');
INSERT INTO demo_shipments VALUES (9004, 1004, 'TRK-1004-A', DATE '2026-02-11');

INSERT INTO demo_inventory VALUES (101, 100);
INSERT INTO demo_inventory VALUES (102, 30);
INSERT INTO demo_inventory VALUES (103, 0);
INSERT INTO demo_inventory VALUES (104, 12);

COMMIT;
