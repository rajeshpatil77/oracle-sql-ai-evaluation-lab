-- Synthetic portfolio schema. No employer or client data is used.

CREATE TABLE demo_customers (
    customer_id NUMBER PRIMARY KEY,
    customer_name VARCHAR2(100) NOT NULL
);

CREATE TABLE demo_items (
    item_id NUMBER PRIMARY KEY,
    item_number VARCHAR2(30) NOT NULL UNIQUE,
    item_description VARCHAR2(200),
    unit_price NUMBER(12,2) NOT NULL
);

CREATE TABLE demo_orders (
    order_id NUMBER PRIMARY KEY,
    order_number VARCHAR2(30) NOT NULL UNIQUE,
    customer_id NUMBER NOT NULL,
    order_date DATE NOT NULL,
    status VARCHAR2(20) NOT NULL,
    CONSTRAINT demo_orders_fk1 FOREIGN KEY (customer_id)
        REFERENCES demo_customers(customer_id)
);

CREATE TABLE demo_order_lines (
    order_line_id NUMBER PRIMARY KEY,
    order_id NUMBER NOT NULL,
    item_id NUMBER NOT NULL,
    ordered_quantity NUMBER NOT NULL,
    unit_price NUMBER(12,2) NOT NULL,
    CONSTRAINT demo_order_lines_fk1 FOREIGN KEY (order_id)
        REFERENCES demo_orders(order_id),
    CONSTRAINT demo_order_lines_fk2 FOREIGN KEY (item_id)
        REFERENCES demo_items(item_id)
);

CREATE TABLE demo_shipments (
    shipment_id NUMBER PRIMARY KEY,
    order_id NUMBER NOT NULL,
    tracking_number VARCHAR2(60),
    ship_date DATE,
    CONSTRAINT demo_shipments_fk1 FOREIGN KEY (order_id)
        REFERENCES demo_orders(order_id)
);

CREATE TABLE demo_inventory (
    item_id NUMBER PRIMARY KEY,
    onhand_quantity NUMBER NOT NULL,
    CONSTRAINT demo_inventory_fk1 FOREIGN KEY (item_id)
        REFERENCES demo_items(item_id)
);

CREATE INDEX demo_orders_n1 ON demo_orders(customer_id, order_date);
CREATE INDEX demo_order_lines_n1 ON demo_order_lines(order_id);
CREATE INDEX demo_shipments_n1 ON demo_shipments(order_id);
