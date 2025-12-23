DELIMITER $$

DROP PROCEDURE IF EXISTS create_order_with_item;
CREATE PROCEDURE create_order_with_item(
	IN p_user INT,
    IN p_item JSON
)
BEGIN
	DECLARE new_order_id INT;
    DECLARE item_count INT;
    DECLARE i INT DEFAULT 0;
    DECLARE v_product_id INT;
    DECLARE v_quantity INT;
    DECLARE v_price DECIMAL(10,2);
	-- Error Handle
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
		ROLLBACK;
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Order creation failed. Transaction rolled back.';
    END ;
    START TRANSACTION;
    -- Create an order
    INSERT INTO orders (user_id,status)
    VALUES(p_user,'pending');
    
    SET new_order_id = LAST_INSERT_ID();
    -- Number of items
    SET item_count = JSON_LENGTH(p_item);
    -- While on item
    WHILE i < item_count DO
		SET v_product_id = JSON_EXTRACT(p_item , CONCAT('$[', i ,'].product_id'));
        SET v_quantity = JSON_EXTRACT(p_item , CONCAT('$[', i ,'].quantity'));
        SET v_price = JSON_EXTRACT(p_item , CONCAT('$[', i ,'].price'));
        
        INSERT INTO order_item(order_id,product_id,quantity,price)
        VALUES(new_order_id,v_product_id,v_quantity,v_price);
        
        -- Triggers are executed here
		-- stock is reduced here
		-- total_price is updated here
        
        SET i = i + 1;
    END WHILE;
    COMMIT;
    
    SELECT new_order_id AS order_id;
END $$

DELIMITER ;