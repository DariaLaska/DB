-- create or replace procedure Worker_Insert (p_worker_surname Varchar(36), 
-- p_worker_name Varchar (36), 
--  p_worker_second_name Varchar(36),
-- p_worker_login Varchar(36),
-- p_worker_password Varchar(36),
-- p_shop_id int,
-- p_position_id int
-- )
-- language plpgsql
-- as $$
-- 	begin
-- 		insert into Worker (worker_surname, worker_name, worker_second_name, worker_login, worker_password, shop_id, position_id )
-- 		Values (p_worker_surname, p_worker_name, p_worker_second_name, p_worker_login, p_worker_password, p_shop_id, p_position_id );
-- 	end;
-- $$;

-- create or replace procedure Worker_Update (
-- p_id_worker int, 
-- p_worker_surname Varchar(36), 
-- p_worker_name Varchar (36), 
-- p_worker_second_name Varchar(36),
-- p_worker_login Varchar(36),
-- p_worker_password Varchar(36),
-- p_shop_id int,
-- p_position_id int)

-- language plpgsql
-- as $$
-- 	begin
-- 		update Worker set
-- 			worker_surname = p_worker_surname,
-- 			worker_name = p_worker_name,
-- 			worker_second_name = p_worker_second_name,
-- 			worker_login = p_worker_login,
-- 			worker_password = p_worker_password,
-- 			shop_id = p_shop_id,
-- 			position_id = p_position_id

-- 		where
-- 					id_worker = p_id_worker;
-- 	end;
-- $$;

-- create or replace procedure Worker_Delete (p_id_worker int)
-- language plpgsql
-- as $$
-- 	begin
-- 		delete from Worker
-- 			where
-- 				id_worker = p_id_worker;
-- 	end;
-- $$;


-- create or replace procedure Position_Insert (p_Position_name Varchar(36))
-- language plpgsql
-- as $$
-- 	begin
-- 		insert into Position (Position_name)
-- 		values (p_Position_name);
-- 	end;
-- $$;

-- create or replace procedure Position_Update (p_ID_Position int, p_Position_name Varchar(36))
-- language plpgsql
-- as $$
-- 	begin
-- 		update Position set
-- 		Position_name  = p_Position_name
-- 			where
-- 				ID_Position = p_ID_Position;
-- 	end;
-- $$;

-- create or replace procedure Position_Delete (p_ID_Position int)
-- language plpgsql
-- as $$
-- 	begin
-- 		delete from Position
-- 			where
-- 				ID_Position = p_ID_Position;
-- 	end;
-- $$;


-- create or replace procedure Request_Insert (p_Request_number Varchar(12), p_Request_date Date, p_Worker_id Int)
-- language plpgsql
-- as $$
-- 	begin
-- 		insert into Request (Request_number, Request_date, Worker_id)
-- 		values (p_Request_number, p_Request_date, p_Worker_id);
-- 	end;
-- $$;

-- create or replace procedure Request_Update (p_ID_Request Int, p_Request_number Varchar(12), p_Request_date Date, p_Worker_id Int)
-- language plpgsql
-- as $$
-- 	begin
-- 		update Request set
-- 			Request_number = p_Request_number,
-- 			Request_date = p_Request_date,
-- 			Worker_id = p_Worker_id

-- 			where
-- 				ID_Request = p_ID_Request;
-- 	end;
-- $$;

-- create or replace procedure Request_Delete (p_ID_Request int)
-- language plpgsql
-- as $$
-- 	begin
-- 		delete from Request
-- 			where
-- 				ID_Request = p_ID_Request;
-- 	end;
-- $$;


-- create or replace procedure Client_order_Insert(
-- p_Client_order_number Varchar(16), 
-- p_Customer_id Int, 
-- p_Client_order_date Date, 
-- p_Client_order_time Time,
--  p_Client_order_sum Decimal(10,2), 
-- p_Worker_id Int)
-- language plpgsql
-- as $$
-- 	begin
-- 		insert into Client_order(Client_order_number, Customer_id, Client_order_date, Client_order_time, Client_order_sum, Worker_id)
-- 		values (p_Client_order_number, p_Customer_id, p_Client_order_date, p_Client_order_time, p_Client_order_sum, p_Worker_id);
-- 	end;
-- $$;

-- create or replace procedure Client_order_Update (
-- p_ID_Client_order Int,
-- p_Client_order_number Varchar(16), 
-- p_Customer_id Int, 
-- p_Client_order_date Date, 
-- p_Client_order_time Time,
--  p_Client_order_sum Decimal(10,2), 
-- p_Worker_id Int)
-- language plpgsql
-- as $$
-- 	begin
-- 		update Client_order set
-- 		
-- 		Client_order_number = p_Client_order_number,
-- 		Customer_id = p_Customer_id,
-- 		Client_order_date = p_Client_order_date,
-- 		Client_order_time = p_Client_order_time,
-- 		Client_order_sum = p_Client_order_sum,
-- 		Worker_id = p_Worker_id
-- 			where
-- 				ID_Client_order = p_ID_Client_order;
-- 	end;
-- $$;


-- create or replace procedure Client_order_Delete (p_ID_Client_order Int)
-- language plpgsql
-- as $$
-- 	begin
-- 		delete from Client_order
-- 			where
-- 				Client_order_id = p_Client_order_id;
-- 	end;
-- $$;


-- create or replace procedure Sales_floor_Insert (p_Sales_floor_name Varchar(36))
-- language plpgsql
-- as $$
-- 	begin
-- 		insert into Sales_floor (Sales_floor_name)
-- 		values (p_Sales_floor_name);
-- 	end;
-- $$;

-- create or replace procedure Sales_floor_Update (p_ID_Sales_floor Int, p_Sales_floor_name Varchar(36))
-- language plpgsql
-- as $$
-- 	begin
-- 		update Sales_floor set
-- 		Sales_floor_name = p_Sales_floor_name
-- 			where
-- 				ID_Sales_floor = p_ID_Sales_floor;
-- 	end;
-- $$;

-- create or replace procedure Sales_floor_Delete (p_ID_Sales_floor Int)
-- language plpgsql
-- as $$
-- 	begin
-- 		delete from Sales_floor
-- 			where
-- 				ID_Sales_floor = p_ID_Sales_floor;
-- 	end;
-- $$;

-- create or replace procedure Shop_Insert (p_Shop_name Varchar(36), p_Shop_address Varchar(150))
-- language plpgsql
-- as $$
-- 	begin
-- 		insert into Shop (Shop_name, Shop_address)
-- 		values (p_Shop_name, p_Shop_address);
-- 	end;
-- $$;

-- create or replace procedure Shop_Update (p_ID_Shop Int, p_Shop_name Varchar(36), p_Shop_address Varchar(150))
-- language plpgsql
-- as $$
-- 	begin
-- 		update Shop set
-- 			Shop_name = p_Shop_name,
-- 			Shop_address = p_Shop_address
-- 		where
-- 			ID_Shop = p_ID_Shop;
-- 	end;
-- $$;


-- create or replace procedure Shop_Delete (p_ID_Shop Int)
-- language plpgsql
-- as $$
-- 	begin
-- 		delete from Shop					where 
-- 				ID_Shop = p_ID_Shop;
-- 	end;
-- $$;

-- create or replace procedure Warehouse_Insert (p_Warehouse_number Varchar(4), p_Warehouse_address Varchar(150), p_Shop_id Int)
-- language plpgsql
-- as $$
-- 	begin
-- 		insert into Warehouse (Warehouse_number, Warehouse_address, Shop_id)
-- 		values (p_Warehouse_number, p_Warehouse_address, p_Shop_id);
-- 	end;
-- $$;


-- create or replace procedure Warehouse_Update (p_ID_Warehouse Int, p_Warehouse_number Varchar(4), p_Warehouse_address Varchar(150), p_Shop_id Int)
-- language plpgsql
-- as $$
-- 	begin
-- 		update Warehouse set
-- 		Warehouse_number = p_Warehouse_number,
-- 		Warehouse_address = p_Warehouse_address,
-- 		Shop_id = p_Shop_id

-- 			where 
-- 				ID_Warehouse = p_ID_Warehouse;
-- 	end;
-- $$;

-- create or replace procedure Warehouse_Delete (p_ID_Warehouse int)
-- language plpgsql
-- as $$
-- 	begin
-- 		delete from Warehouse
-- 			where
-- 				ID_Warehouse = p_ID_Warehouse;
-- 	end;
-- $$;

-- create or replace procedure Customer_Insert (p_Customer_surname Varchar(36), 
-- p_Customer_name Varchar(36), 
-- p_Customer_last_name Varchar(36), 
-- p_Passport_series Varchar(5), 
-- p_Passport_number Varchar(6), 
-- p_Issue_data Date, 
-- p_Customer_phone_number Varchar(16), 
-- p_Credit_card_info Varchar(19), 
-- p_Cusomer_email Varchar(36),
-- p_Customer_login Varchar(36),
-- p_Customer_password Varchar(36)
-- )
-- language plpgsql
-- as $$
-- 	begin
-- 		insert into Customer(Customer_surname, Customer_name, Customer_last_name, Passport_series, Passport_number, Issue_data, Customer_phone_number, Credit_card_info, Cusomer_email, Customer_login, Customer_password)
-- 		values (p_Customer_surname, p_Customer_name, p_Customer_last_name, p_Passport_series, p_Passport_number, p_Issue_data, p_Customer_phone_number, p_Credit_card_info, p_Cusomer_email, p_Customer_login, p_Customer_password);
-- 	end;
-- $$;

-- create or replace procedure Customer_Update (
-- p_ID_Customer Int,
-- p_Customer_surname Varchar(36), 
-- p_Customer_name Varchar(36), 
-- p_Customer_last_name Varchar(36), 
-- p_Passport_series Varchar(5), 
-- p_Passport_number Varchar(6), 
-- p_Issue_data Date, 
-- p_Customer_phone_number Varchar(16), 
-- p_Credit_card_info Varchar(19), 
-- p_Cusomer_email Varchar(36),
-- p_Customer_login Varchar(36),
-- p_Customer_password Varchar(36)
-- )

-- language plpgsql
-- as $$
-- 	begin
-- 		update Customer set
-- 		Customer_surname = p_Customer_surname, 
-- 		Customer_name = p_Customer_name, 
-- 		Customer_last_name = p_Customer_last_name, 
-- 		Passport_series = p_Passport_series, 
-- 		Passport_number = p_Passport_number, 
-- 		Issue_data = p_Issue_data, 
-- 		Customer_phone_number = p_Customer_phone_number,
-- 		Credit_card_info = p_Credit_card_info, 
-- 		Cusomer_email = p_Cusomer_email, 
-- 		Customer_login = p_Customer_login, 
-- 		Customer_password = p_Customer_password			
-- 		where
-- 				ID_Customer = p_ID_Customer;
-- 	end;
-- $$;

-- create or replace procedure Customer_Delete (p_ID_Customer Int)
-- language plpgsql
-- as $$
-- 	begin
-- 		delete from Customer
-- 			where
-- 				ID_Customer = p_ID_Customer;
-- 	end;
-- $$;

-- create or replace procedure Product_Insert (p_Article_number Varchar(10), 
-- p_Product_type Varchar(36),
-- p_Product_photo Text,
-- p_Manufacturing_country_id Int,
-- p_Manufacturer_id Int,
-- p_Product_amount Int,
-- p_Product_price Decimal(10,2)
-- )
-- language plpgsql
-- as $$
-- 	begin
-- 		insert into Product (Article_number, Product_type, Product_photo, Manufacturing_country_id, Manufacturer_id, Product_amount, Product_price)
-- 		values (p_Article_number, p_Product_type, p_Product_photo, p_Manufacturing_country_id, p_Manufacturer_id, p_Product_amount, p_Product_price);
-- 	end;
-- $$;

-- create or replace procedure Product_Update (
-- p_ID_Product Int, 
-- p_Article_number Varchar(10), 
-- p_Product_type Varchar(36),
-- p_Product_photo Text,
-- p_Manufacturing_country_id Int,
-- p_Manufacturer_id Int,
-- p_Product_amount Int,
-- p_Product_price Decimal(10,2)
-- )

-- language plpgsql
-- as $$
-- 	begin
-- 		update Product set
-- 		Article_number = p_Article_number, 
-- 		Product_type = p_Product_type, 
-- 		Product_photo = p_Product_photo,
-- 		Manufacturing_country_id = p_Manufacturing_country, 
-- 		Manufacturer_id = p_Manufacturer_id, 
-- 		Product_amount = p_Product_amount, 
-- 		Product_price = p_Product_price			where
-- 				ID_Product = p_ID_Product;
-- 	end;
-- $$;

-- create or replace procedure Product_Delete (p_ID_Product Int)
-- language plpgsql
-- as $$
-- 	begin
-- 		delete from Product
-- 			where
-- 				ID_Product = p_ID_Product;
-- 	end;
-- $$;

-- create or replace procedure Manufacturer_Insert (p_Manufacturer_name Varchar(36))
-- language plpgsql
-- as $$
-- 	begin
-- 		insert into Manufacturer (Manufacturer_name)
-- 		values (p_Manufacturer_name);
-- 	end;
-- $$;

-- create or replace procedure Manufacturer_Update (p_ID_Manufacturer Int, p_Manufacturer_name Varchar(36))
-- language plpgsql
-- as $$
-- 	begin
-- 		update Manufacturer set
		
-- 		Manufacturer_name = p_Manufacturer_name
-- 			where
-- 				ID_Manufacturer = p_ID_Manufacturer;
-- 	end;
-- $$;

-- create or replace procedure Manufacturer_Delete (p_ID_Manufacturer Int)
-- language plpgsql
-- as $$
-- 	begin
-- 		delete from Manufacturer
-- 			where
-- 				ID_Manufacturer = p_ID_Manufacturer;
-- 	end;
-- $$;

-- create or replace procedure Manufacturing_country_Insert (p_Manufacturing_country_name Varchar(36))
-- language plpgsql
-- as $$
-- 	begin
-- 		insert into Manufacturing_country
-- (Manufacturing_country_name )
-- 		values (p_Manufacturing_country_name );
-- 	end;
-- $$;

-- create or replace procedure Manufacturing_country_Update (p_ID_Manufacturing_country Int, p_Manufacturing_country_name Varchar(36))
-- language plpgsql
-- as $$
-- 	begin
-- 		update Manufacturing_country set
-- 		Manufacturing_country_name = p_Manufacturing_country_name			where
-- 				ID_Manufacturing_country = p_ID_Manufacturing_country;
-- 	end;
-- $$;


-- create or replace procedure Manufacturing_country_Delete (p_ID_Manufacturing_country int)
-- language plpgsql
-- as $$
-- 	begin
-- 		delete from Manufacturing_country
-- 			where
-- 				ID_Manufacturing_country = p_ID_Manufacturing_country;
-- 	end;
-- $$;

-- create or replace procedure Season_Insert (p_Season_name Varchar(36))
-- language plpgsql
-- as $$
-- 	begin
-- 		insert into Season (Season_name)
-- 		values (p_Season_name);
-- 	end;
-- $$;

-- create or replace procedure Season_Update (p_ID_Season  Int, p_Season_name Varchar(36))
-- language plpgsql
-- as $$
-- 	begin
-- 		update Season set
-- 		Season_name = p_Season_name
-- 			where
-- 				ID_Season = p_ID_Season;
-- 	end;
-- $$;

-- create or replace procedure Season_Delete (p_ID_Season  Int)
-- language plpgsql
-- as $$
-- 	begin
-- 		delete from Season
-- 			where
-- 				ID_Season = p_ID_Season ;
-- 	end;
-- $$;

-- create or replace procedure Composition_Insert (p_Composition_name Varchar(36))
-- language plpgsql
-- as $$
-- 	begin
-- 		insert into Composition (Composition_name )
-- 		values (p_Composition_name );
-- 	end;
-- $$;

-- create or replace procedure Composition_Update (p_ID_Composition  Int, p_Composition_name Varchar(36))
-- language plpgsql
-- as $$
-- 	begin
-- 		update Composition set
-- 		Composition_name = p_Composition_name			
-- 		where
-- 				ID_Composition = p_ID_Composition;
-- 	end;
-- $$;


-- create or replace procedure Composition_Delete (p_ID_Composition int)
-- language plpgsql
-- as $$
-- 	begin
-- 		delete from Composition
-- 			where
-- 				ID_Composition = p_ID_Composition;
-- 	end;
-- $$;

-- create or replace procedure Size_Insert (p_Size Varchar(10))
-- language plpgsql
-- as $$
-- 	begin
-- 		insert into Size (Size)
-- 		values (p_Size);
-- 	end;
-- $$;

-- create or replace procedure Size_Update (p_ID_Size int, p_Size Varchar(10))
-- language plpgsql
-- as $$
-- 	begin
-- 		update Size set
-- 		Size = p_Size
-- 			where
-- 				ID_Size = p_ID_Size;
-- 	end;
-- $$;

-- create or replace procedure Size_Delete (p_ID_Size int)
-- language plpgsql
-- as $$
-- 	begin
-- 		delete from Size
-- 			where
-- 				ID_Size = p_ID_Size;
-- 	end;
-- $$;

-- create or replace procedure Extra_request_Insert (p_Extra_request_number Varchar(18), p_Order_id Int, p_Worker_id Int)
-- language plpgsql
-- as $$
-- 	begin
-- 		insert into Extra_request (Extra_request_number, Order_id, Worker_id)
-- 		values (p_Extra_request_number, p_Order_id, p_Worker_id);
-- 	end;
-- $$;

-- create or replace procedure Extra_request_Update (p_ID_Extra_request int, p_Extra_request_number Varchar(18), p_Order_id Int, p_Worker_id Int)
-- language plpgsql
-- as $$
-- 	begin
-- 		update Extra_request set
-- 		Extra_request_number = p_Extra_request_number,
-- 		Order_id = p_Order_id,
-- 		Worker_id = p_Worker_id
-- 			where
-- 				ID_Extra_request = p_ID_Extra_request;
-- 	end;
-- $$;

-- create or replace procedure Extra_request_Delete (p_ID_Extra_request int)
-- language plpgsql
-- as $$
-- 	begin
-- 		delete from Extra_request
-- 			where
-- 				ID_Extra_request = p_ID_Extra_request;
-- 	end;
-- $$;


-- create or replace procedure Order_Insert (p_Order_number Varchar(16), p_Supplier_id Int, p_Order_date Date, p_Order_time Time, p_Order_status_id Int, p_Costs Decimal(10,2))
-- language plpgsql
-- as $$
-- 	begin
-- 		insert into Orders 
-- (Order_number, Supplier_id, Order_date, Order_time, Order_status_id, Costs)
-- 		values (p_Order_number, p_Supplier_id, p_Order_date, p_Order_time, p_Order_status_id, p_Costs);
-- 	end;
-- $$;

-- create or replace procedure Order_Update (p_ID_Order int, p_Order_number Varchar(16), p_Supplier_id Int, p_Order_date Date, p_Order_time Time, p_Order_status_id Int, p_Costs Decimal(10,2))
-- language plpgsql
-- as $$
-- 	begin
-- 		update Orders set
-- 		Order_number = p_Order_number,
-- 		Supplier_id = p_Supplier_id,
-- 		Order_date = p_Order_date,
-- 		Order_time = p_Order_time,
-- 		Order_status_id = p_Order_status_id,
-- 		Costs =p_Costs
-- 			where
-- 				ID_Order = p_ID_Order;
-- 	end;
-- $$;

-- create or replace procedure Order_Delete (p_ID_Order int)
-- language plpgsql
-- as $$
-- 	begin
-- 		delete from Orders
-- 			where
-- 				ID_Order = p_ID_Order;
-- 	end;
-- $$;

-- create or replace procedure Supplier_Insert (p_Supplier_name Varchar(36))
-- language plpgsql
-- as $$
-- 	begin
-- 		insert into Supplier
-- (Supplier_name)
-- 		values (p_Supplier_name);
-- 	end;
-- $$;

-- create or replace procedure Supplier_Update (p_ID_Supplier int, p_Supplier_name Varchar(36))
-- language plpgsql
-- as $$
-- 	begin
-- 		update Supplier set
-- 		Supplier_name = p_Supplier_name			
-- 		where
-- 				ID_Supplier= p_ID_Supplier;
-- 	end;
-- $$;

-- create or replace procedure Supplier_Delete (p_ID_Supplier int)
-- language plpgsql
-- as $$
-- 	begin
-- 		delete from Supplier
-- 			where
-- 				ID_Supplier = p_ID_Supplier;
-- 	end;
-- $$;

-- create or replace procedure Order_status_Insert (p_Order_status Varchar(36))
-- language plpgsql
-- as $$
-- 	begin
-- 		insert into Order_status
-- (Order_status )
-- 		values (p_Order_status);
-- 	end;
-- $$;

-- create or replace procedure Order_status_Update (p_ID_Order_status int, p_Order_status Varchar(36))
-- language plpgsql
-- as $$
-- 	begin
-- 		update Order_status set
-- 		Order_status = p_Order_status 
-- 			where
-- 				ID_Order_status = p_ID_Order_status;
-- 	end;
-- $$;

-- create or replace procedure Order_status_Delete (p_ID_Order_status int)
-- language plpgsql
-- as $$
-- 	begin
-- 		delete from Order_status
-- 			where
-- 				ID_Order_status = p_ID_Order_status;
-- 	end;
-- $$;


-- create or replace procedure Receipt_Insert (
-- 	p_Receipt_number Varchar(36),
-- 	p_Client_order_id Int,
-- 	p_Receipt_date Date,
-- 	p_Receipt_time Time,
-- 	p_Receipt_sum Decimal(10,2),
-- 	p_Receipt_change Decimal(10,2)
-- )
-- language plpgsql
-- as $$
-- 	begin
-- 		insert into Receipt
-- (Receipt_number, Client_order_id, Receipt_date, Receipt_time, Receipt_sum, Receipt_change )
-- 		values (p_Receipt_number, p_Client_order_id, p_Receipt_date, p_Receipt_time, p_Receipt_sum, p_Receipt_change);
-- 	end;
-- $$;

-- create or replace procedure Receipt_Update (p_ID_Receipt Int,
-- 	p_Receipt_number Varchar(36),
-- 	p_Client_order_id Int,
-- 	p_Receipt_date Date,
-- 	p_Receipt_time Time,
-- 	p_Receipt_sum Decimal(10,2),
-- 	p_Receipt_change Decimal(10,2))
-- language plpgsql
-- as $$
-- 	begin
-- 		update Receipt set
-- 		Receipt_number = p_Receipt_number,
-- 		Client_order_id = p_Client_order_id,
-- 		Receipt_date = p_Receipt_date,
-- 		Receipt_time = p_Receipt_time,
-- 		Receipt_sum = p_Receipt_sum,
-- 		Receipt_change = p_Receipt_change
-- 			where
-- 				ID_Receipt = p_ID_Receipt;
-- 	end;
-- $$;

-- create or replace procedure Receipt_Delete (p_ID_Receipt int)
-- language plpgsql
-- as $$
-- 	begin
-- 		delete from Receipt
-- 			where
-- 				ID_Receipt = p_ID_Receipt;
-- 	end;
-- $$;



-- create or replace procedure Request_in_order_Insert (p_Request_id Int, p_Order_id Int)
-- language plpgsql
-- as $$
-- 	begin
-- 		insert into Request_in_order
-- (Request_id, Order_id)
-- 		values (p_Request_id, p_Order_id);
-- 	end;
-- $$;

-- create or replace procedure Request_in_order_Update (p_ID_Request_in_order int, p_Request_id Int, p_Order_id Int)
-- language plpgsql
-- as $$
-- 	begin
-- 		update Request_in_order set
-- 		Request_id = p_Request_id,
-- 		Order_id = p_Order_id	
-- 	where				 		ID_Request_in_order = p_ID_Request_in_order;
-- 	end;
-- $$;

-- create or replace procedure Request_in_order_Delete (p_ID_Request_in_order int)
-- language plpgsql
-- as $$
-- 	begin
-- 		delete from Request_in_order
-- 			where
-- 				ID_Request_in_order = p_ID_Request_in_order;
-- 	end;
-- $$;

-- create or replace procedure Product_in_request_Insert (p_Product_id Int, p_Request_id Int)
-- language plpgsql
-- as $$
-- 	begin
-- 		insert into Product_in_request
-- (Product_id, Request_id)
-- 		values (p_Product_id, p_Request_id);
-- 	end;
-- $$;
-- create or replace procedure Product_in_request_Update (p_ID_Product_in_request int, p_Product_id Int, p_Request_id Int)
-- language plpgsql
-- as $$
-- 	begin
-- 		update Products_in_request set
-- 		Product_id = p_Product_id,
-- 		Request_id = p_Request_id			where
-- 				ID_Product_in_request = p_ID_Product_in_request;
-- 	end;
-- $$;

-- create or replace procedure Product_in_request_Delete (p_ID_Product_in_request int)
-- language plpgsql
-- as $$
-- 	begin
-- 		delete from Products_in_request
-- 			where
-- 				ID_Product_in_request = p_ID_Product_in_request;
-- 	end;
-- $$;

-- create or replace procedure Product_in_customer_order_Insert
-- (p_Customer_order_id Int, p_Product_id Int, p_Product_amount Int)
-- language plpgsql
-- as $$
-- 	begin
-- 		insert into Products_in_customer_order
-- (Customer_order_id, Product_id, Product_amount)
-- 		values (p_Customer_order_id, p_Product_id, p_Product_amount);
-- 	end;
-- $$;

-- create or replace procedure Product_in_customer_order_Update (p_ID_Product_in_customer_order int, p_Customer_order_id Int, p_Product_id Int, p_Product_amount Int)
-- language plpgsql
-- as $$
-- 	begin
-- 		update Products_in_customer_order set
-- 		Customer_order_id = p_Customer_order_id,
-- 		Product_id = p_Product_id,
-- 		Product_amount = p_Product_amount			where
-- 				ID_Product_in_customer_order = p_ID_Product_in_customer_order;
-- 	end;
-- $$;

-- create or replace procedure Product_in_customer_order_Delete (p_ID_Product_in_customer_order int)
-- language plpgsql
-- as $$
-- 	begin
-- 		delete from Products_in_customer_order
-- 			where
-- 				ID_Product_in_customer_order = p_ID_Product_in_customer_order;
-- 	end;
-- $$;

-- create or replace procedure Product_size_Insert (p_Product_id Int, p_Size_id Int)
-- language plpgsql
-- as $$
-- 	begin
-- 		insert into Product_size
-- (Product_id, Size_id)
-- 		values (p_Product_id, p_Size_id);
-- 	end;
-- $$;

-- create or replace procedure Product_size_Update (p_ID_Product_size Int, p_Product_id Int, p_Size_id Int)
-- language plpgsql
-- as $$
-- 	begin
-- 		update Product_size set
-- 		Product_id = p_Product_id,
-- 		Size_id = p_Size_id			where
-- 				ID_Product_size = p_ID_Product_size;
-- 	end;
-- $$;

-- create or replace procedure Product_size_Delete (p_ID_Product_size int)
-- language plpgsql
-- as $$
-- 	begin
-- 		delete from Product_size
-- 			where
-- 				ID_Product_size = p_ID_Product_size;
-- 	end;
-- $$;

-- create or replace procedure Composition_product_Insert (p_Composition_id Int, p_Product_id Int, p_Percents Int)
-- language plpgsql
-- as $$
-- 	begin
-- 		insert into Composition_product
-- (Composition_id, Product_id, Percents)
-- 		values (p_Composition_id, p_Product_id, p_Percents);
-- 	end;
-- $$;

-- create or replace procedure Composition_product_Update (p_ID_Composition_product Int, p_Composition_id Int, p_Product_id Int, p_Percents Int)
-- language plpgsql
-- as $$
-- 	begin
-- 		update Composition_product set

-- 	Composition_id = p_Composition_id,
-- 	Product_id = p_Product_id,
-- 	Percents = p_Percents			where
-- 				ID_Composition_product = p_ID_Composition_product;
-- 	end;
-- $$;

-- create or replace procedure Composition_product_Delete (p_ID_Composition_product int)
-- language plpgsql
-- as $$
-- 	begin
-- 		delete from Composition_product
-- 			where
-- 				ID_Composition_product = p_ID_Composition_product;
-- 	end;
-- $$;

-- create or replace procedure Product_in_shop_Insert (p_Shop_id Int, p_Product_id Int, p_Product_amount Int)
-- language plpgsql
-- as $$
-- 	begin
-- 		insert into Product_in_shop
-- (Shop_id, Product_id, Product_amount)
-- 		values (p_Shop_id, p_Product_id, p_Product_amount);
-- 	end;
-- $$;

-- create or replace procedure Product_in_shop_Update (p_ID_Product_in_shop int, p_Shop_id Int, p_Product_id Int, p_Product_amount Int)
-- language plpgsql
-- as $$
-- 	begin
-- 		update Product_in_shop set

-- 		Shop_id = p_Shop_id,
-- 		Product_id = p_Product_id,
-- 		Product_amount = p_Product_amount			where
-- 				ID_Product_in_shop = p_ID_Product_in_shop;
-- 	end;
-- $$;

-- create or replace procedure Product_in_shop_Delete (p_ID_Product_in_shop int)
-- language plpgsql
-- as $$
-- 	begin
-- 		delete from Product_in_shop
-- 			where
-- 				ID_Product_in_shop = p_ID_Product_in_shop;
-- 	end;
-- $$;

-- create or replace procedure Season_product_Insert (p_Product_id Int, p_Season_id Int)
-- language plpgsql
-- as $$
-- 	begin
-- 		insert into Season_product
-- (Product_id, Season_id)
-- 		values (p_Product_id, p_Season_id);
-- 	end;
-- $$;

-- create or replace procedure Season_product_Update (p_ID_Season_product int, p_Product_id Int, p_Season_id Int)
-- language plpgsql
-- as $$
-- 	begin
-- 		update Season_product set

-- 		Product_id = p_Product_id,
-- 		Season_id = p_Season_id			where
-- 				ID_Season_product = p_ID_Season_product;
-- 	end;
-- $$;

-- create or replace procedure Season_product_Delete (p_ID_Season_product int)
-- language plpgsql
-- as $$
-- 	begin
-- 		delete from Season_product
-- 			where
-- 				ID_Season_product = p_ID_Season_product;
-- 	end;
-- $$;

-- create or replace procedure Product_on_display_Insert (p_Sales_floor_in_shop_id Int, p_Product_id Int, p_Display_in_sales_floor Int)
--  language plpgsql
--  as $$
--  	begin
--  		insert into Product_on_display
--  (Sales_floor_in_shop_id, Product_id, Display_in_sales_floor)
--  		values (p_Sales_floor_in_shop_id, p_Product_id, p_Display_in_sales_floor);
--  	end;
--  $$;

--  create or replace procedure Product_on_display_Update (p_ID_Product_on_display int, p_Sales_floor_in_shop_id Int, p_Product_id Int, p_Display_in_sales_floor Int)
--  language plpgsql
--  as $$
--  	begin
--  		update Product_on_display set
--  		Sales_floor_in_shop_id = p_Sales_floor_in_shop_id,
--  		Product_id = p_Product_id,
--  		Display_in_sales_floor = p_Display_in_sales_floor			where
--  				ID_Product_on_display = p_ID_Product_on_display;
--  	end;
--  $$;

-- create or replace procedure Product_on_display_Delete (p_ID_Product_on_display int)
-- language plpgsql
-- as $$
-- 	begin
-- 		delete from Product_on_display
-- 			where
-- 				ID_Product_on_display = p_ID_Product_on_display;
-- 	end;
-- $$;

-- create or replace procedure Sales_floor_in_shop_Insert (p_Sales_floor_id Int, p_Shop_id Int, p_Sector_in_sales_floor Int)
-- language plpgsql
-- as $$
-- 	begin
-- 		insert into Sales_floor_in_shop
-- (Sales_floor_id, Shop_id, Sector_in_sales_floor)
-- 		values (p_Sales_floor_id, p_Shop_id, p_Sector_in_sales_floor);
-- 	end;
-- $$;

-- create or replace procedure Sales_floor_in_shop_Update (p_ID_Sales_floor_in_shop int, p_Sales_floor_id Int, p_Shop_id Int, p_Sector_in_sales_floor Int)
-- language plpgsql
-- as $$
-- 	begin
-- 		update Sales_floor_in_shop set

-- 		Sales_floor_id = p_Sales_floor_id,
-- 		Shop_id = p_Shop_id,
-- 		Sector_in_sales_floor = p_Sector_in_sales_floor	
-- 		where
-- 				ID_Sales_floor_in_shop = p_ID_Sales_floor_in_shop;
-- 	end;
-- $$;

-- create or replace procedure Sales_floor_in_shop_Delete (p_ID_Sales_floor_in_shop int)
-- language plpgsql
-- as $$
-- 	begin
-- 		delete from Sales_floor_in_shop
-- 			where
-- 				ID_Sales_floor_in_shop = p_ID_Sales_floor_in_shop;
-- 	end;
-- $$;

-- create or replace procedure Product_in_extra_request_Insert (p_Extra_request_id Int, p_Product_id Int, p_Sum Decimal(12, 2))
-- language plpgsql
-- as $$
-- 	begin
-- 		insert into Product_in_extra_request
-- (Extra_request_id, Product_id, Sum)
-- 		values (p_Extra_request_id, p_Product_id, p_Sum);
-- 	end;
-- $$;


-- create or replace procedure Product_in_extra_request_Update (p_ID_Product_in_extra_request int, p_Extra_request_id Int, p_Product_id Int, p_Sum Decimal(12, 2))
-- language plpgsql
-- as $$
-- 	begin
-- 		update Product_in_extra_request set

-- 		Extra_request_id = p_Extra_request_id,
-- 		Product_id = p_Product_id,
-- 		Sum = p_Sum			where
-- 				ID_Product_in_extra_request = p_ID_Product_in_extra_request;
-- 	end;
-- $$;

-- create or replace procedure Product_in_extra_request_Delete (p_ID_Product_in_extra_request int)
-- language plpgsql
-- as $$
-- 	begin
-- 		delete from Product_in_extra_request			where
-- 				ID_Product_in_extra_request = p_ID_Product_in_extra_request;
-- 	end;
-- $$;










-- grant execute on procedure client_order_update to sukhareva_customer;
-- grant execute on procedure client_order_insert to sukhareva_customer;
-- grant execute on procedure client_order_delete to sukhareva_customer;
-- grant execute on procedure customer_update to sukhareva_customer;
-- grant execute on procedure customer_insert to sukhareva_customer;
-- grant execute on procedure customer_delete to sukhareva_customer;
-- grant execute on procedure product_in_customer_order_update to sukhareva_customer;
-- grant execute on procedure product_in_customer_order_insert to sukhareva_customer;
-- grant execute on procedure product_in_customer_order_delete to sukhareva_customer;

-- grant execute on procedure worker_update to sukhareva_worker;
-- grant execute on procedure request_update to sukhareva_worker;
-- grant execute on procedure request_insert to sukhareva_worker;
-- grant execute on procedure request_delete to sukhareva_worker;
-- grant execute on procedure customer_insert to sukhareva_worker;
-- grant execute on procedure product_update to sukhareva_worker;
-- grant execute on procedure product_insert to sukhareva_worker;
-- grant execute on procedure product_delete to sukhareva_worker;
-- grant execute on procedure extra_request_update to sukhareva_worker;
-- grant execute on procedure extra_request_insert to sukhareva_worker;
-- grant execute on procedure extra_request_delete to sukhareva_worker;
-- grant execute on procedure order_update to sukhareva_worker;
-- grant execute on procedure order_insert to sukhareva_worker;
-- grant execute on procedure order_delete to sukhareva_worker;
-- grant execute on procedure order_status_update to sukhareva_worker;
-- grant execute on procedure request_in_order_update to sukhareva_worker;
-- grant execute on procedure request_in_order_insert to sukhareva_worker;
-- grant execute on procedure request_in_order_delete to sukhareva_worker;
-- grant execute on procedure product_in_shop_update to sukhareva_worker;
-- grant execute on procedure product_in_shop_insert to sukhareva_worker;
-- grant execute on procedure product_in_shop_delete to sukhareva_worker;
-- grant execute on procedure product_on_display_update to sukhareva_worker;
-- grant execute on procedure product_on_display_insert to sukhareva_worker;
-- grant execute on procedure product_on_display_delete to sukhareva_worker;
-- grant execute on procedure product_in_extra_request_update to sukhareva_worker;
-- grant execute on procedure product_in_extra_request_insert to sukhareva_worker;
-- grant execute on procedure product_in_extra_request_delete to sukhareva_worker;

-- grant execute on procedure product_update to sukhareva_supplier;
-- grant execute on procedure manufacturer_update to sukhareva_supplier;
-- grant execute on procedure manufacturer_insert to sukhareva_supplier;
-- grant execute on procedure product_update to sukhareva_supplier;
-- grant execute on procedure manufacturing_country_update to sukhareva_supplier;
-- grant execute on procedure manufacturing_country_insert to sukhareva_supplier;
-- grant execute on procedure manufacturing_country_delete to sukhareva_supplier;
-- grant execute on procedure season_update to sukhareva_supplier;
-- grant execute on procedure season_insert to sukhareva_supplier;
-- grant execute on procedure season_delete to sukhareva_supplier;
-- grant execute on procedure composition_update to sukhareva_supplier;
-- grant execute on procedure composition_insert to sukhareva_supplier;
-- grant execute on procedure composition_delete to sukhareva_supplier;
-- grant execute on procedure size_update to sukhareva_supplier;
-- grant execute on procedure size_insert to sukhareva_supplier;
-- grant execute on procedure size_delete to sukhareva_supplier;
-- grant execute on procedure supplier_update to sukhareva_supplier;
-- grant execute on procedure order_status_update to sukhareva_supplier;
-- grant execute on procedure order_status_insert to sukhareva_supplier;
-- grant execute on procedure order_status_delete to sukhareva_supplier;
-- grant execute on procedure product_size_update to sukhareva_supplier;
-- grant execute on procedure product_size_insert to sukhareva_supplier;
-- grant execute on procedure product_size_delete to sukhareva_supplier;
-- grant execute on procedure composition_product_update to sukhareva_supplier;
-- grant execute on procedure composition_product_insert to sukhareva_supplier;
-- grant execute on procedure composition_product_delete to sukhareva_supplier;
-- grant execute on procedure season_product_update to sukhareva_supplier;
-- grant execute on procedure season_product_insert to sukhareva_supplier;
-- grant execute on procedure season_product_delete to sukhareva_supplier;

-- grant execute on procedure worker_insert to sukhareva_administrator;
-- grant execute on procedure worker_delete to sukhareva_administrator;
-- grant execute on procedure position_update to sukhareva_administrator;
-- grant execute on procedure position_insert to sukhareva_administrator;
-- grant execute on procedure position_delete to sukhareva_administrator;
-- grant execute on procedure request_update to sukhareva_administrator;
-- grant execute on procedure request_delete to sukhareva_administrator;
-- grant execute on procedure client_order_delete to sukhareva_administrator;
-- grant execute on procedure receipt_update to sukhareva_administrator;
-- grant execute on procedure receipt_insert to sukhareva_administrator;
-- grant execute on procedure receipt_delete to sukhareva_administrator;
-- grant execute on procedure sales_floor_update to sukhareva_administrator;
-- grant execute on procedure sales_floor_insert to sukhareva_administrator;
-- grant execute on procedure sales_floor_delete to sukhareva_administrator;
-- grant execute on procedure shop_update to sukhareva_administrator;
-- grant execute on procedure shop_insert to sukhareva_administrator;
-- grant execute on procedure shop_delete to sukhareva_administrator;
-- grant execute on procedure warehouse_update to sukhareva_administrator;
-- grant execute on procedure warehouse_insert to sukhareva_administrator;
-- grant execute on procedure warehouse_delete to sukhareva_administrator;
-- grant execute on procedure customer_delete to sukhareva_administrator;
-- grant execute on procedure product_update to sukhareva_administrator;
-- grant execute on procedure product_insert to sukhareva_administrator;
-- grant execute on procedure product_delete to sukhareva_administrator;
-- grant execute on procedure extra_request_update to sukhareva_administrator;
-- grant execute on procedure extra_request_insert to sukhareva_administrator;
-- grant execute on procedure extra_request_delete to sukhareva_administrator;
-- grant execute on procedure order_update to sukhareva_administrator;
-- grant execute on procedure order_insert to sukhareva_administrator;
-- grant execute on procedure order_delete to sukhareva_administrator;
-- grant execute on procedure supplier_update to sukhareva_administrator;
-- grant execute on procedure supplier_insert to sukhareva_administrator;
-- grant execute on procedure supplier_delete to sukhareva_administrator;
-- grant execute on procedure order_status_update to sukhareva_administrator;
-- grant execute on procedure request_in_order_update to sukhareva_administrator;
-- grant execute on procedure request_in_order_insert to sukhareva_administrator;
-- grant execute on procedure request_in_order_delete to sukhareva_administrator;
-- grant execute on procedure product_in_shop_update to sukhareva_administrator;
-- grant execute on procedure product_in_shop_insert to sukhareva_administrator;
-- grant execute on procedure product_in_shop_delete to sukhareva_administrator;
-- grant execute on procedure product_on_display_update to sukhareva_administrator;
-- grant execute on procedure product_on_display_insert to sukhareva_administrator;
-- grant execute on procedure product_on_display_delete to sukhareva_administrator;
-- grant execute on procedure sales_floor_in_shop_update to sukhareva_administrator;
-- grant execute on procedure sales_floor_in_shop_insert to sukhareva_administrator;
-- grant execute on procedure sales_floor_in_shop_delete to sukhareva_administrator;
-- grant execute on procedure product_in_extra_request_update to sukhareva_administrator;
-- grant execute on procedure product_in_extra_request_insert to sukhareva_administrator;
-- grant execute on procedure product_in_extra_request_delete to sukhareva_administrator;
