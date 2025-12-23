DELIMITER $$

-- Calculating the total price of order items
DROP TRIGGER IF EXISTS after_order_item_insert_total_price;
CREATE TRIGGER after_order_item_insert_total_price
AFTER INSERT ON order_item
FOR EACH ROW
BEGIN
	UPDATE orders
    SET total_price = (
		SELECT SUM(quantity * price)
        FROM order_item
        WHERE order_id = NEW.order_id
    )
    WHERE id = NEW.order_id;
END $$

-- Decrease product stock after an order item is added
DROP TRIGGER IF EXISTS after_order_item_insert_stock;
CREATE TRIGGER after_order_item_insert_stock
AFTER INSERT ON order_item
FOR EACH ROW
BEGIN
	UPDATE products
    SET stock = stock - NEW.quantity
    WHERE id = NEW.product_id;
END $$

-- Prevent inserting order items when product stock is insufficient
DROP TRIGGER IF EXISTS before_order_item_insert_check_stock;
CREATE TRIGGER before_order_item_insert_check_stock
BEFORE INSERT ON order_item
FOR EACH ROW
BEGIN
	DECLARE check_stock INT;
    
    SELECT stock
    INTO check_stock
    FROM products
    WHERE id = NEW.product_id;
    
    IF check_stock < NEW.quantity THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Not enough stock for this product';
	END IF;
END $$

-- Restore product stock and recalculate order total_price after an order item is deleted
DROP TRIGGER IF EXISTS after_order_item_delete_stock;
CREATE TRIGGER after_order_item_delete_stock
AFTER DELETE ON order_item
FOR EACH ROW
BEGIN
	UPDATE products
    SET stock = stock + OLD.quantity
    WHERE id = OLD.product_id;
    
    UPDATE orders
    SET total_price = (
		SELECT IFNULL(SUM(quantity * price),0)
        FROM order_item
        WHERE id = OLD.order_id
    )
    WHERE id = OLD.order_id;
END $$
DELIMITER ;