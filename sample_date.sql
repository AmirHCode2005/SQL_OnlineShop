-- ===== Insert Customers =====
INSERT INTO customers(name,email,password)
VALUES
('AmirHossin','amirhossin6825@gmail.com','********'),
('Ali','ali103050@gmail.com','124578AA'),
('Hesam','H1278aa@gmail.com','Hesam12:)');
-- =============================

-- ===== Insert Categories =====
INSERT INTO categories(name)
VALUES
('Electronics'),
('Books'),
('Computer accessories');
-- =============================

-- ===== Insert Products =====
INSERT INTO products(name,description,price,stock,category_id)
VALUES
('Laptop','CPU : Core I7 , GPU : RX580 , RAM : 16G',65000000,10,1),
('i Phone 16',NULL,100000000,5,1),
('SQL Book',NULL,100000,20,2),
('Xbox controller',NULL,800000,15,3);
-- ===========================

-- ===== Insert Orders And OrderItem With Procedure =====
CALL create_order_with_item(
1,
'[
	{"product_id":1,"quantity":1,"price":65000000},
    {"product_id":3,"quantity":5,"price":100000}
]'
);
CALL create_order_with_item(
3,
'[
	{"product_id":4,"quantity":5,"price":800000},
    {"product_id":3,"quantity":5,"price":100000}
]'
);
-- ======================================================

-- ===== Insert Reviews (Optional) =====
INSERT INTO reviews(user_id,product_id,rating,comment)
VALUES
(1,1,5,'This product was really great, highly recommended.'),
(3,4,1,'I bought five of these, all of them were broken. Please follow up.');
-- =====================================

-- ===== Insert Payment =====
INSERT INTO payment(order_id,payment_method,amount)
VALUES
(1,'paid',65000000),
(2,'paid',100000);
-- ==========================