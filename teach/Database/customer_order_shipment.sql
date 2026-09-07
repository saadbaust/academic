-- ============================================================
--  Sample Schema: Customers, Orders, Shipments
--  PostgreSQL
--  Note: "order" is a reserved word, so the table is named "orders".
--
--  Deliberate edge cases (to make joins clear):
--    * Customers with NO orders  -> Lamia (12), Quazi (17), Tania (20)
--    * Orders with NO shipment   -> every Processing / Cancelled order
--    * Customers with MANY orders -> one-to-many behaviour
--    * Multiple customers per city -> self join clusters
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
    ('Lamia Sultana',   'Dhaka',      'lamia@mail.com',    '2025-02-14'),  -- 12 (no orders)
    ('Mahin Reza',      'Chattogram', 'mahin@mail.com',    '2025-02-18'),  -- 13
    ('Nadia Haque',     'Dhaka',      'nadia@mail.com',    '2025-02-22'),  -- 14
    ('Omar Faruk',      'Rajshahi',   'omar@mail.com',     '2025-02-26'),  -- 15
    ('Priya Das',       'Khulna',     'priya@mail.com',    '2025-03-01'),  -- 16
    ('Quazi Nabil',     'Sylhet',     'quazi@mail.com',    '2025-03-04'),  -- 17 (no orders)
    ('Rumana Kabir',    'Dhaka',      'rumana@mail.com',   '2025-03-08'),  -- 18
    ('Sabbir Alam',     'Chattogram', 'sabbir@mail.com',   '2025-03-12'),  -- 19
    ('Tania Ferdous',   'Rangpur',    'tania@mail.com',    '2025-03-15'); -- 20 (no orders)

-- ------------------------------------------------------------
-- 2. ORDERS  (customer_id -> customers.customer_id)
--    Processing / Cancelled orders never get a shipment.
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
    ( 1, '2025-03-15',  300.00, 'Processing'),  -- 3  (no shipment)
    ( 2, '2025-01-15',  800.00, 'Shipped'),     -- 4
    ( 2, '2025-03-01', 1100.00, 'Delivered'),   -- 5
    ( 3, '2025-01-20', 2300.75, 'Delivered'),   -- 6
    ( 3, '2025-03-03',   75.50, 'Processing'),  -- 7  (no shipment)
    ( 4, '2025-02-01',  150.00, 'Cancelled'),   -- 8  (no shipment)
    ( 5, '2025-02-05',  999.99, 'Shipped'),     -- 9
    ( 6, '2025-01-22',  560.00, 'Delivered'),   -- 10
    ( 6, '2025-02-28',  240.00, 'Shipped'),     -- 11
    ( 7, '2025-02-15', 1750.00, 'Delivered'),   -- 12
    ( 8, '2025-02-18',  300.25, 'Processing'),  -- 13 (no shipment)
    ( 9, '2025-02-20',  540.00, 'Shipped'),     -- 14
    ( 9, '2025-03-10',  680.00, 'Delivered'),   -- 15
    (10, '2025-03-05', 2000.00, 'Shipped'),     -- 16
    (11, '2025-03-08',  430.00, 'Delivered'),   -- 17
    (13, '2025-03-12',  910.00, 'Delivered'),   -- 18
    (14, '2025-01-30',  125.00, 'Cancelled'),   -- 19 (no shipment)
    (14, '2025-03-18',  765.40, 'Shipped'),     -- 20
    (15, '2025-02-22',  350.00, 'Delivered'),   -- 21
    (16, '2025-02-25', 1450.00, 'Delivered'),   -- 22
    (18, '2025-01-28',  220.00, 'Processing'),  -- 23 (no shipment)
    (18, '2025-03-20',  980.00, 'Shipped'),     -- 24
    (19, '2025-02-08',  640.00, 'Delivered'),   -- 25
    ( 3, '2025-03-25',  500.00, 'Shipped'),     -- 26
    (16, '2025-03-22',  150.75, 'Processing'),  -- 27 (no shipment)
    (19, '2025-03-28', 1320.00, 'Delivered');  -- 28

-- ------------------------------------------------------------
-- 3. SHIPMENTS  (order_id -> orders.order_id)
--    Only Shipped / Delivered orders have a shipment row.
--    Delivered order -> shipment 'Delivered'; Shipped order -> 'In Transit'.
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
    ( 4, '2025-01-16', 'Steadfast', 'TRK100003', 'In Transit'),  -- 3
    ( 5, '2025-03-02', 'Sundarban', 'TRK100004', 'Delivered'),   -- 4
    ( 6, '2025-01-21', 'DHL',       'TRK100005', 'Delivered'),   -- 5
    ( 9, '2025-02-06', 'RedX',      'TRK100006', 'In Transit'),  -- 6
    (10, '2025-01-23', 'Pathao',    'TRK100007', 'Delivered'),   -- 7
    (11, '2025-03-01', 'Steadfast', 'TRK100008', 'In Transit'),  -- 8
    (12, '2025-02-16', 'Sundarban', 'TRK100009', 'Delivered'),   -- 9
    (14, '2025-02-21', 'DHL',       'TRK100010', 'In Transit'),  -- 10
    (15, '2025-03-11', 'RedX',      'TRK100011', 'Delivered'),   -- 11
    (16, '2025-03-06', 'Pathao',    'TRK100012', 'In Transit'),  -- 12
    (17, '2025-03-09', 'Steadfast', 'TRK100013', 'Delivered'),   -- 13
    (18, '2025-03-13', 'Sundarban', 'TRK100014', 'Delivered'),   -- 14
    (20, '2025-03-19', 'DHL',       'TRK100015', 'In Transit'),  -- 15
    (21, '2025-02-23', 'RedX',      'TRK100016', 'Delivered'),   -- 16
    (22, '2025-02-26', 'Pathao',    'TRK100017', 'Delivered'),   -- 17
    (24, '2025-03-21', 'Steadfast', 'TRK100018', 'In Transit'),  -- 18
    (25, '2025-02-09', 'Sundarban', 'TRK100019', 'Delivered'),   -- 19
    (26, '2025-03-26', 'DHL',       'TRK100020', 'In Transit'),  -- 20
    (28, '2025-03-29', 'RedX',      'TRK100021', 'Delivered'); -- 21

-- ------------------------------------------------------------
-- Quick verification
-- ------------------------------------------------------------
-- SELECT COUNT(*) FROM customers;  -- 20
-- SELECT COUNT(*) FROM orders;     -- 28
-- SELECT COUNT(*) FROM shipments;  -- 21
