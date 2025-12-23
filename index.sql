-- Index for faster order lookup by user
CREATE INDEX idx_orders_user_id
ON orders(user_id);

-- Index for joining orders with order items
CREATE INDEX idx_order_item_order_id
ON order_item(order_id);

-- Index for joining order items with products
CREATE INDEX idx_order_item_product_id
ON order_item(product_id);

-- Index for filtering orders by status
CREATE INDEX idx_orders_status
ON orders(status);

-- Index for inventory related queries
CREATE INDEX idx_products_stock
ON products(stock);