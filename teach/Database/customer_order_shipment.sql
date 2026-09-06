-- ============================================================
--  Sample Schema: Customers, Orders, Shipments
--  PostgreSQL
--  Note: "order" is a reserved word, so the table is named "orders".
-- ============================================================

DROP TABLE IF EXISTS shipments, orders, customers CASCADE;

-- ------------------------------------------------------------
-- 1. CUSTOMERS
-- ------------------------------------------------------------
CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    name        VARCHAR(60) NOT NULL,
    city        VARCHAR(40),
    email       VARCHAR(80),
    signup_date DATE
);

INSERT INTO customers (name, city, email, signup_date) VALUES
    ('Ayesha Rahman',   'Dhaka',      'ayesha@mail.com',   '2024-11-02'),  -- 1
    ('Bashir Uddin',    'Chattogram', 'bashir@mail.com',   '2024-11-10'),  -- 2
    ('Chandni Akter',   'Rajshahi',   'chandni@mail.com',  '2024-12-01'),  -- 3
    ('Dipto Roy',       'Khulna',     'dipto@mail.com',    '2024-12-15'),  -- 4
    ('Emon Hossain',    'Sylhet',     'emon@mail.com',     '2025-01-03'),  -- 5
    ('Farhana Islam',   'Dhaka',      'farhana@mail.com',  '2025-01-08'),  -- 6
    ('Galib Chowdhury', 'Barishal',   'galib@mail.com',    '2025-01-12'),  -- 7
    ('Hasan Mahmud',    'Rangpur',    'hasan@mail.com',    '2025-01-20'),  -- 8
    ('Imran Kabir',     'Dhaka',      'imran@mail.com',    '2025-02-01'),  -- 9
    ('Jarin Tasnim',    'Chattogram', 'jarin@mail.com',    '2025-02-05'),  -- 10
    ('Kamal Ahmed',     'Saidpur',    'kamal@mail.com',    '2025-02-10'),  -- 11
    ('Lamia Sultana',   'Dhaka',      'lamia@mail.com',    '2025-02-14'); -- 12 (no orders on purpose)

-- ------------------------------------------------------------
-- 2. ORDERS  (customer_id -> customers.customer_id)
-- ------------------------------------------------------------
CREATE TABLE orders (
    order_id    SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customers(customer_id),
    order_date  DATE NOT NULL,
    amount      NUMERIC(10,2) NOT NULL,
    status      VARCHAR(20)   -- Processing / Shipped / Delivered / Cancelled
);

INSERT INTO orders (customer_id, order_date, amount, status) VALUES
    ( 1, '2025-01-05', 1200.00, 'Delivered'),   -- 1
    ( 1, '2025-02-10',  450.50, 'Delivered'),   -- 2
    ( 2, '2025-01-15',  800.00, 'Shipped'),     -- 3
    ( 3, '2025-01-20', 2300.75, 'Delivered'),   -- 4
    ( 4, '2025-02-01',  150.00, 'Processing'),  -- 5  (no shipment)
    ( 5, '2025-02-05',  999.99, 'Shipped'),     -- 6
    ( 6, '2025-02-12',   60.00, 'Cancelled'),   -- 7  (no shipment)
    ( 7, '2025-02-15', 1750.00, 'Delivered'),   -- 8
    ( 8, '2025-02-18',  300.25, 'Processing'),  -- 9  (no shipment)
    ( 9, '2025-02-20',  540.00, 'Shipped'),     -- 10
    ( 2, '2025-03-01', 1100.00, 'Delivered'),   -- 11
    ( 3, '2025-03-03',   75.50, 'Processing'),  -- 12 (no shipment)
    (10, '2025-03-05', 2000.00, 'Shipped'),     -- 13
    (11, '2025-03-08',  430.00, 'Delivered');  -- 14

-- ------------------------------------------------------------
-- 3. SHIPMENTS  (order_id -> orders.order_id)
--    Only shipped/delivered orders have a shipment row.
-- ------------------------------------------------------------
CREATE TABLE shipments (
    shipment_id  SERIAL PRIMARY KEY,
    order_id     INT REFERENCES orders(order_id),
    shipped_date DATE,
    carrier      VARCHAR(30),
    tracking_no  VARCHAR(20),
    status       VARCHAR(20)   -- In Transit / Delivered
);

INSERT INTO shipments (order_id, shipped_date, carrier, tracking_no, status) VALUES
    ( 1, '2025-01-06', 'RedX',      'TRK100001', 'Delivered'),   -- 1
    ( 2, '2025-02-11', 'Pathao',    'TRK100002', 'Delivered'),   -- 2
    ( 3, '2025-01-16', 'Steadfast', 'TRK100003', 'In Transit'),  -- 3
    ( 4, '2025-01-21', 'Sundarban', 'TRK100004', 'Delivered'),   -- 4
    ( 6, '2025-02-06', 'RedX',      'TRK100005', 'In Transit'),  -- 5
    ( 8, '2025-02-16', 'DHL',       'TRK100006', 'Delivered'),   -- 6
    (10, '2025-02-21', 'Pathao',    'TRK100007', 'In Transit'),  -- 7
    (11, '2025-03-02', 'Steadfast', 'TRK100008', 'Delivered'),   -- 8
    (13, '2025-03-06', 'RedX',      'TRK100009', 'In Transit'),  -- 9
    (14, '2025-03-09', 'Sundarban', 'TRK100010', 'Delivered'); -- 10

-- ------------------------------------------------------------
-- Quick verification
-- ------------------------------------------------------------
-- SELECT COUNT(*) FROM customers;  -- 12
-- SELECT COUNT(*) FROM orders;     -- 14
-- SELECT COUNT(*) FROM shipments;  -- 10
