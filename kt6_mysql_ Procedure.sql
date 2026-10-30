--  DELIMITER $$ 
-- create  procedure  Product_in_customer_order_Insert
--  (p_Customer_order_id Int, p_Product_id Int, p_Product_amount Int)
--  
--  
--  	begin
--  		insert into Products_in_customer_order
--  (Customer_order_id, Product_id, Product_amount)
--  		values (p_Customer_order_id, p_Product_id, p_Product_amount);
--  	end;
--  $$; DELIMITER $

--  DELIMITER $$ create  procedure  Product_in_customer_order_Update (p_ID_Product_in_customer_order int, p_Customer_order_id Int, p_Product_id Int, p_Product_amount Int)
--  
--  
--  	begin
--  		update Products_in_customer_order set
--  		Customer_order_id = p_Customer_order_id,
--  		Product_id = p_Product_id,
--  		Product_amount = p_Product_amount			where
--  				ID_Product_in_customer_order = p_ID_Product_in_customer_order;
--  	end;
--  $$; DELIMITER $

--  DELIMITER $$ create  procedure  Product_in_customer_order_Delete (p_ID_Product_in_customer_order int)
--  
--  
--  	begin
--  		delete from Products_in_customer_order
--  			where
--  				ID_Product_in_customer_order = p_ID_Product_in_customer_order;
--  	end;
--  $$; DELIMITER $

--  DELIMITER $$ create  procedure  Product_size_Insert (p_Product_id Int, p_Size_id Int)
--  
--  
--  	begin
--  		insert into Product_size
--  (Product_id, Size_id)
--  		values (p_Product_id, p_Size_id);
--  	end;
--  $$; DELIMITER $

--  DELIMITER $$ create  procedure  Product_size_Update (p_ID_Product_size Int, p_Product_id Int, p_Size_id Int)
--  
--  
--  	begin
--  		update Product_size set
--  		Product_id = p_Product_id,
--  		Size_id = p_Size_id			where
--  				ID_Product_size = p_ID_Product_size;
--  	end;
--  $$; DELIMITER $

--  DELIMITER $$ create  procedure  Product_size_Delete (p_ID_Product_size int)
--  
--  
--  	begin
--  		delete from Product_size
--  			where
--  				ID_Product_size = p_ID_Product_size;
--  	end;
--  $$; DELIMITER $

--  DELIMITER $$ create  procedure  Composition_product_Insert (p_Composition_id Int, p_Product_id Int, p_Percents Int)
--  
--  
--  	begin
--  		insert into Composition_product
--  (Composition_id, Product_id, Percents)
--  		values (p_Composition_id, p_Product_id, p_Percents);
--  	end;
--  $$; DELIMITER $

--  DELIMITER $$ create  procedure  Composition_product_Update (p_ID_Composition_product Int, p_Composition_id Int, p_Product_id Int, p_Percents Int)
--  
--  
--  	begin
--  		update Composition_product set

--  	Composition_id = p_Composition_id,
--  	Product_id = p_Product_id,
--  	Percents = p_Percents			where
--  				ID_Composition_product = p_ID_Composition_product;
--  	end;
--  $$; DELIMITER $

--  DELIMITER $$ create  procedure  Composition_product_Delete (p_ID_Composition_product int)
--  
--  
--  	begin
--  		delete from Composition_product
--  			where
--  				ID_Composition_product = p_ID_Composition_product;
--  	end;
--  $$; DELIMITER $

--  DELIMITER $$ create  procedure  Product_in_shop_Insert (p_Shop_id Int, p_Product_id Int, p_Product_amount Int)
--  
--  
--  	begin
--  		insert into Product_in_shop
--  (Shop_id, Product_id, Product_amount)
--  		values (p_Shop_id, p_Product_id, p_Product_amount);
--  	end;
--  $$; DELIMITER $

--  DELIMITER $$ create  procedure  Product_in_shop_Update (p_ID_Product_in_shop int, p_Shop_id Int, p_Product_id Int, p_Product_amount Int)
--  
--  
--  	begin
--  		update Product_in_shop set

--  		Shop_id = p_Shop_id,
--  		Product_id = p_Product_id,
--  		Product_amount = p_Product_amount			where
--  				ID_Product_in_shop = p_ID_Product_in_shop;
--  	end;
--  $$; DELIMITER $

--  DELIMITER $$ create  procedure  Product_in_shop_Delete (p_ID_Product_in_shop int)
--  
--  
--  	begin
--  		delete from Product_in_shop
--  			where
--  				ID_Product_in_shop = p_ID_Product_in_shop;
--  	end;
--  $$; DELIMITER $

--  DELIMITER $$ create  procedure  Season_product_Insert (p_Product_id Int, p_Season_id Int)
--  
--  
--  	begin
--  		insert into Season_product
--  (Product_id, Season_id)
--  		values (p_Product_id, p_Season_id);
--  	end;
--  $$; DELIMITER $

--  DELIMITER $$ create  procedure  Season_product_Update (p_ID_Season_product int, p_Product_id Int, p_Season_id Int)
--  
--  
--  	begin
--  		update Season_product set

--  		Product_id = p_Product_id,
--  		Season_id = p_Season_id			where
--  				ID_Season_product = p_ID_Season_product;
--  	end;
--  $$; DELIMITER $

--  DELIMITER $$ create  procedure  Season_product_Delete (p_ID_Season_product int)
--  
--  
--  	begin
--  		delete from Season_product
--  			where
--  				ID_Season_product = p_ID_Season_product;
--  	end;
--  $$; DELIMITER $

--  DELIMITER $$ create  procedure  Product_on_display_Insert (p_Sales_floor_in_shop_id Int, p_Product_id Int, p_Display_in_sales_floor Int)
--   
--   
--   	begin
--   		insert into Product_on_display
--   (Sales_floor_in_shop_id, Product_id, Display_in_sales_floor)
--   		values (p_Sales_floor_in_shop_id, p_Product_id, p_Display_in_sales_floor);
--   	end;
--   $$; DELIMITER $

--   DELIMITER $$ create  procedure  Product_on_display_Update (p_ID_Product_on_display int, p_Sales_floor_in_shop_id Int, p_Product_id Int, p_Display_in_sales_floor Int)
--   
--   
--   	begin
--   		update Product_on_display set
--   		Sales_floor_in_shop_id = p_Sales_floor_in_shop_id,
--   		Product_id = p_Product_id,
--   		Display_in_sales_floor = p_Display_in_sales_floor			where
--   				ID_Product_on_display = p_ID_Product_on_display;
--   	end;
--   $$; DELIMITER $

--  DELIMITER $$ create  procedure  Product_on_display_Delete (p_ID_Product_on_display int)
--  
--  
--  	begin
--  		delete from Product_on_display
--  			where
--  				ID_Product_on_display = p_ID_Product_on_display;
--  	end;
--  $$; DELIMITER $

--  DELIMITER $$ create  procedure  Sales_floor_in_shop_Insert (p_Sales_floor_id Int, p_Shop_id Int, p_Sector_in_sales_floor Int)
--  
--  
--  	begin
--  		insert into Sales_floor_in_shop
--  (Sales_floor_id, Shop_id, Sector_in_sales_floor)
--  		values (p_Sales_floor_id, p_Shop_id, p_Sector_in_sales_floor);
--  	end;
--  $$; DELIMITER $

--  DELIMITER $$ create  procedure  Sales_floor_in_shop_Update (p_ID_Sales_floor_in_shop int, p_Sales_floor_id Int, p_Shop_id Int, p_Sector_in_sales_floor Int)
--  
--  
--  	begin
--  		update Sales_floor_in_shop set

--  		Sales_floor_id = p_Sales_floor_id,
--  		Shop_id = p_Shop_id,
--  		Sector_in_sales_floor = p_Sector_in_sales_floor	
--  		where
--  				ID_Sales_floor_in_shop = p_ID_Sales_floor_in_shop;
--  	end;
--  $$; DELIMITER $

--  DELIMITER $$ create  procedure  Sales_floor_in_shop_Delete (p_ID_Sales_floor_in_shop int)
--  
--  
--  	begin
--  		delete from Sales_floor_in_shop
--  			where
--  				ID_Sales_floor_in_shop = p_ID_Sales_floor_in_shop;
--  	end;
--  $$; DELIMITER $

--  DELIMITER $$ create  procedure  Product_in_extra_request_Insert (p_Extra_request_id Int, p_Product_id Int, p_Sum Decimal(12, 2))
--  
--  
--  	begin
--  		insert into Product_in_extra_request
--  (Extra_request_id, Product_id, Sum)
--  		values (p_Extra_request_id, p_Product_id, p_Sum);
--  	end;
--  $$; DELIMITER $


--  DELIMITER $$ create  procedure  Product_in_extra_request_Update (p_ID_Product_in_extra_request int, p_Extra_request_id Int, p_Product_id Int, p_Sum Decimal(12, 2))
--  
--  
--  	begin
--  		update Product_in_extra_request set

--  		Extra_request_id = p_Extra_request_id,
--  		Product_id = p_Product_id,
--  		Sum = p_Sum			where
--  				ID_Product_in_extra_request = p_ID_Product_in_extra_request;
--  	end;
--  $$; DELIMITER $

--  DELIMITER $$ create  procedure  Product_in_extra_request_Delete (p_ID_Product_in_extra_request int)
--  
--  
--  	begin
--  		delete from Product_in_extra_request			where
--  				ID_Product_in_extra_request = p_ID_Product_in_extra_request;
--  	end;
--  $$; DELIMITER $










--  grant execute on procedure client_order_update to sukhareva_customer;
--  grant execute on procedure client_order_insert to sukhareva_customer;
--  grant execute on procedure client_order_delete to sukhareva_customer;
--  grant execute on procedure customer_update to sukhareva_customer;
--  grant execute on procedure customer_insert to sukhareva_customer;
--  grant execute on procedure customer_delete to sukhareva_customer;
--  grant execute on procedure product_in_customer_order_update to sukhareva_customer;
--  grant execute on procedure product_in_customer_order_insert to sukhareva_customer;
--  grant execute on procedure product_in_customer_order_delete to sukhareva_customer;

--  grant execute on procedure worker_update to sukhareva_worker;
--  grant execute on procedure request_update to sukhareva_worker;
--  grant execute on procedure request_insert to sukhareva_worker;
--  grant execute on procedure request_delete to sukhareva_worker;
--  grant execute on procedure customer_insert to sukhareva_worker;
--  grant execute on procedure product_update to sukhareva_worker;
--  grant execute on procedure product_insert to sukhareva_worker;
--  grant execute on procedure product_delete to sukhareva_worker;
--  -- grant execute on procedure extra_request_update to sukhareva_worker;
--  grant execute on procedure extra_request_insert to sukhareva_worker;
--  grant execute on procedure extra_request_delete to sukhareva_worker;
--  grant execute on procedure order_update to sukhareva_worker;
--  grant execute on procedure order_insert to sukhareva_worker;
--  grant execute on procedure order_delete to sukhareva_worker;
--  grant execute on procedure order_status_update to sukhareva_worker;
--  grant execute on procedure request_in_order_update to sukhareva_worker;
--  grant execute on procedure request_in_order_insert to sukhareva_worker;
--  grant execute on procedure request_in_order_delete to sukhareva_worker;
--  grant execute on procedure product_in_shop_update to sukhareva_worker;
--  grant execute on procedure product_in_shop_insert to sukhareva_worker;
--  grant execute on procedure product_in_shop_delete to sukhareva_worker;
--  grant execute on procedure product_on_display_update to sukhareva_worker;
--  grant execute on procedure product_on_display_insert to sukhareva_worker;
--  grant execute on procedure product_on_display_delete to sukhareva_worker;
--  grant execute on procedure product_in_extra_request_update to sukhareva_worker;
--  grant execute on procedure product_in_extra_request_insert to sukhareva_worker;
--  grant execute on procedure product_in_extra_request_delete to sukhareva_worker;

--  grant execute on procedure product_update to sukhareva_supplier;
--  grant execute on procedure manufacturer_update to sukhareva_supplier;
--  grant execute on procedure manufacturer_insert to sukhareva_supplier;
--  grant execute on procedure product_update to sukhareva_supplier;
--  grant execute on procedure manufacturing_country_update to sukhareva_supplier;
--  grant execute on procedure manufacturing_country_insert to sukhareva_supplier;
--  grant execute on procedure manufacturing_country_delete to sukhareva_supplier;
--  grant execute on procedure season_update to sukhareva_supplier;
--  grant execute on procedure season_insert to sukhareva_supplier;
--  grant execute on procedure season_delete to sukhareva_supplier;
--  grant execute on procedure composition_update to sukhareva_supplier;
--  grant execute on procedure composition_insert to sukhareva_supplier;
--  grant execute on procedure composition_delete to sukhareva_supplier;
--  grant execute on procedure size_update to sukhareva_supplier;
--  grant execute on procedure size_insert to sukhareva_supplier;
--  grant execute on procedure size_delete to sukhareva_supplier;
--  grant execute on procedure supplier_update to sukhareva_supplier;
--  grant execute on procedure order_status_update to sukhareva_supplier;
--  grant execute on procedure order_status_insert to sukhareva_supplier;
--  grant execute on procedure order_status_delete to sukhareva_supplier;
--  grant execute on procedure product_size_update to sukhareva_supplier;
--  grant execute on procedure product_size_insert to sukhareva_supplier;
--  grant execute on procedure product_size_delete to sukhareva_supplier;
--  grant execute on procedure composition_product_update to sukhareva_supplier;
--  grant execute on procedure composition_product_insert to sukhareva_supplier;
--  grant execute on procedure composition_product_delete to sukhareva_supplier;
--  grant execute on procedure season_product_update to sukhareva_supplier;
--  grant execute on procedure season_product_insert to sukhareva_supplier;
--  grant execute on procedure season_product_delete to sukhareva_supplier;

--  grant execute on procedure worker_insert to sukhareva_administrator;
--  grant execute on procedure worker_delete to sukhareva_administrator;
--  grant execute on procedure position_update to sukhareva_administrator;
--  grant execute on procedure position_insert to sukhareva_administrator;
--  grant execute on procedure position_delete to sukhareva_administrator;
--  grant execute on procedure request_update to sukhareva_administrator;
--  grant execute on procedure request_delete to sukhareva_administrator;
--  grant execute on procedure client_order_delete to sukhareva_administrator;
--  grant execute on procedure receipt_update to sukhareva_administrator;
--  grant execute on procedure receipt_insert to sukhareva_administrator;
--  grant execute on procedure receipt_delete to sukhareva_administrator;
--  grant execute on procedure sales_floor_update to sukhareva_administrator;
--  grant execute on procedure sales_floor_insert to sukhareva_administrator;
--  grant execute on procedure sales_floor_delete to sukhareva_administrator;
--  grant execute on procedure shop_update to sukhareva_administrator;
--  grant execute on procedure shop_insert to sukhareva_administrator;
--  grant execute on procedure shop_delete to sukhareva_administrator;
--  grant execute on procedure warehouse_update to sukhareva_administrator;
--  grant execute on procedure warehouse_insert to sukhareva_administrator;
--  grant execute on procedure warehouse_delete to sukhareva_administrator;
--  grant execute on procedure customer_delete to sukhareva_administrator;
--  grant execute on procedure product_update to sukhareva_administrator;
--  grant execute on procedure product_insert to sukhareva_administrator;
--  grant execute on procedure product_delete to sukhareva_administrator;
--  grant execute on procedure extra_request_update to sukhareva_administrator;
--  grant execute on procedure extra_request_insert to sukhareva_administrator;
--  grant execute on procedure extra_request_delete to sukhareva_administrator;
--  grant execute on procedure order_update to sukhareva_administrator;
--  grant execute on procedure order_insert to sukhareva_administrator;
--  grant execute on procedure order_delete to sukhareva_administrator;
--  grant execute on procedure supplier_update to sukhareva_administrator;
--  grant execute on procedure supplier_insert to sukhareva_administrator;
--  grant execute on procedure supplier_delete to sukhareva_administrator;
--  grant execute on procedure order_status_update to sukhareva_administrator;
--  grant execute on procedure request_in_order_update to sukhareva_administrator;
--  grant execute on procedure request_in_order_insert to sukhareva_administrator;
--  grant execute on procedure request_in_order_delete to sukhareva_administrator;
--  grant execute on procedure product_in_shop_update to sukhareva_administrator;
--  grant execute on procedure product_in_shop_insert to sukhareva_administrator;
--  grant execute on procedure product_in_shop_delete to sukhareva_administrator;
--  grant execute on procedure product_on_display_update to sukhareva_administrator;
--  grant execute on procedure product_on_display_insert to sukhareva_administrator;
--  grant execute on procedure product_on_display_delete to sukhareva_administrator;
--  grant execute on procedure sales_floor_in_shop_update to sukhareva_administrator;
--  grant execute on procedure sales_floor_in_shop_insert to sukhareva_administrator;
--  grant execute on procedure sales_floor_in_shop_delete to sukhareva_administrator;
--  grant execute on procedure product_in_extra_request_update to sukhareva_administrator;
--  grant execute on procedure product_in_extra_request_insert to sukhareva_administrator;
--  grant execute on procedure product_in_extra_request_delete to sukhareva_administrator;


-- DELIMITER **

-- CREATE PROCEDURE Product_Insert (
--     p_Article_number VARCHAR(10),
--     p_Product_type VARCHAR(36),
--     p_Product_photo TEXT,
--     p_Manufacturing_country_id INT,
--     p_Manufacturer_id INT,
--     p_Product_amount INT,
--     p_Product_price DECIMAL(10, 2)   
-- )
-- BEGIN
--     INSERT INTO Product (
--         Article_number,
--         Product_type,
--         Product_photo,
--         Manufacturing_country_id,
--         Manufacturer_id,
--         Product_amount,
--         Product_price
--     ) VALUES (
--         p_Article_number,
--         p_Product_type,
--         p_Product_photo,
--         p_Manufacturing_country_id,
--         p_Manufacturer_id,
--         p_Product_amount,
--         p_Product_price
--     );
-- END 
-- **
-- DELIMITER *;

-- DELIMITER **

-- CREATE PROCEDURE Product_Update (
--     p_ID_Product INT,
--     p_Article_number VARCHAR(10),
--     p_Product_type VARCHAR(36),
--     p_Product_photo TEXT,
--     p_Manufacturing_country_id INT,
--     p_Manufacturer_id INT,
--     p_Product_amount INT,
--     p_Product_price DECIMAL(10, 2)  
-- )
-- BEGIN
--     UPDATE Product
--     SET
--         Article_number = p_Article_number,
--         Product_type = p_Product_type,
--         Product_photo = p_Product_photo,
--         Manufacturing_country_id = p_Manufacturing_country_id,
--         Manufacturer_id = p_Manufacturer_id,
--         Product_amount = p_Product_amount,
--         Product_price = p_Product_price
--     WHERE
--         ID_Product = p_ID_Product;
-- END 
-- **
-- DELIMITER *;

-- DELIMITER **

-- CREATE PROCEDURE Extra_request_Insert (
--     IN p_Extra_request_number varchar(24), 
--     IN p_Order_id INT
-- )
-- BEGIN
--     INSERT INTO Extra_request (Extra_request_number, Order_id)
--     VALUES (p_Extra_request_number, p_Order_id);
-- END 
-- **

-- CREATE PROCEDURE Extra_request_Update (
--     IN p_ID_Extra_request INT, 
--     IN p_Extra_request_number varchar(24), 
--     IN p_Order_id INT
-- )
-- BEGIN
--     UPDATE Extra_request
--     SET 
--         Extra_request_number = p_Extra_request_number,
--         Order_id = p_Order_id
--     WHERE ID_Extra_request = p_ID_Extra_request;
-- END 
-- **
-- DELIMITER *;



