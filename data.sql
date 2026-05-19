-- Insert Customers
INSERT INTO customers VALUES
(1,  'Ali Ahmed',     'ali@email.com',     'Karachi',   '2023-01-15'),
(2,  'Sara Khan',     'sara@email.com',    'Lahore',    '2023-02-20'),
(3,  'Ahmed Raza',    'ahmed@email.com',   'Peshawar',  '2023-03-10'),
(4,  'Fatima Malik',  'fatima@email.com',  'Karachi',   '2023-04-05'),
(5,  'Usman Ali',     'usman@email.com',   'Islamabad', '2023-05-12'),
(6,  'Zara Sheikh',   'zara@email.com',    'Lahore',    '2023-06-18'),
(7,  'Bilal Hassan',  'bilal@email.com',   'Karachi',   '2023-07-22'),
(8,  'Nadia Hussain', 'nadia@email.com',   'Lahore',    '2023-08-30'),
(9,  'Omar Farooq',   'omar@email.com',    'Karachi',   '2023-09-14'),
(10, 'Hina Baig',     'hina@email.com',    'Islamabad', '2023-10-25');

-- Insert Products
INSERT INTO products VALUES
(1,  'Laptop',        'Electronics',  85000.00,  50),
(2,  'Mouse',         'Electronics',   1500.00, 200),
(3,  'Keyboard',      'Electronics',   3500.00, 150),
(4,  'Monitor',       'Electronics',  35000.00,  75),
(5,  'Headphones',    'Electronics',   8000.00, 100),
(6,  'Office Chair',  'Furniture',    25000.00,  30),
(7,  'Standing Desk', 'Furniture',    45000.00,  20),
(8,  'Notebook',      'Stationery',     200.00, 500),
(9,  'Pen Set',       'Stationery',     500.00, 400),
(10, 'Webcam',        'Electronics',   7500.00,  80);

-- Insert Orders
INSERT INTO orders VALUES
(1,  1, '2024-01-05', 'Completed'),
(2,  2, '2024-01-10', 'Completed'),
(3,  3, '2024-01-15', 'Pending'),
(4,  4, '2024-01-20', 'Completed'),
(5,  5, '2024-02-01', 'Cancelled'),
(6,  6, '2024-02-10', 'Completed'),
(7,  7, '2024-02-15', 'Pending'),
(8,  8, '2024-02-20', 'Completed'),
(9,  9, '2024-03-01', 'Completed'),
(10, 10,'2024-03-10', 'Pending'),
(11, 1, '2024-03-15', 'Completed'),
(12, 2, '2024-03-20', 'Completed');

-- Insert Order Items
INSERT INTO order_items VALUES
(1,  1,  1, 1, 85000.00),
(2,  1,  2, 2,  1500.00),
(3,  2,  3, 1,  3500.00),
(4,  2,  5, 1,  8000.00),
(5,  3,  4, 1, 35000.00),
(6,  4,  6, 2, 25000.00),
(7,  5,  7, 1, 45000.00),
(8,  6,  1, 1, 85000.00),
(9,  6,  10,1,  7500.00),
(10, 7,  2, 3,  1500.00),
(11, 8,  3, 2,  3500.00),
(12, 8,  8, 5,   200.00),
(13, 9,  4, 1, 35000.00),
(14, 9,  9, 3,   500.00),
(15, 10, 5, 2,  8000.00),
(16, 11, 1, 1, 85000.00),
(17, 11, 3, 1,  3500.00),
(18, 12, 6, 1, 25000.00);