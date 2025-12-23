-- ===== Order details =====
CREATE OR REPLACE VIEW vw_order_details AS
SELECT 
	o.id AS order_id,
    c.name AS user_name,
    p.name AS product_name,
    oi.quantity,
    oi.price,
    (oi.quantity * oi.price) AS item_total,
    o.total_price,
    o.status,
    o.created_at
FROM orders o
JOIN customers c ON c.id = o.user_id
JOIN order_item oi ON oi.order_id = o.id
JOIN products p ON p.id = oi.product_id;
-- ===== Product sales report =====
CREATE OR REPLACE VIEW vw_product_sales AS
SELECT 
	p.id,
    p.name,
    SUM(oi.quantity) AS total_sold,
    SUM(oi.quantity * oi.price) AS revenue
FROM products p
JOIN order_item oi ON p.id = oi.product_id
GROUP BY p.id , p.name;
-- ===== Inventory =====
CREATE OR REPLACE VIEW vw_inventory_status AS
SELECT 
	id,
    name,
    stock,
    CASE
		WHEN stock = 0 THEN 'out_of_stock'
        WHEN stock < 5 THEN 'low_stock'
        ELSE 'in_stock'
	END AS stock_status
FROM products