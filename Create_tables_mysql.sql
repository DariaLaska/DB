-- create table if not exists Positions(	
-- 	ID_Position int not null auto_increment primary key,
-- 	Position_name Varchar(36) not null
-- 		);
-- create table if not exists Sales_floor(	
-- 	ID_Sales_floor Int not null auto_increment primary key,
-- 	Sales_floor_name Varchar(36) not null
-- 	);
-- create table if not exists Shop(	
-- 	ID_Shop Int not null auto_increment primary key,
-- 	Shop_name Varchar(36) not null,
-- 	Shop_address Varchar(36) not null
-- 	);
-- create table if not exists Warehouse(	
-- 	ID_Warehouse Int not null auto_increment primary key,
-- 	Warehouse_number Int not null,
-- 	Warehouse_address Varchar(36) not null,
-- 	Shop_id Int not null,  constraint FK_Shop_Warehouse foreign key (Shop_id)   references Shop(ID_Shop)
-- 	);
-- create table if not exists Customer(	
-- 	ID_Customer Int not null auto_increment primary key,
-- 	Customer_surname Varchar(36) not null,
-- 	Customer_name Varchar(36) not null,
-- 	Customer_last_name Varchar(36) not null,
-- 	Passport_series Varchar(5) not null,
-- 	Passport_number Varchar(6) not null,
-- 	Issue_data Date not null,
-- 	Customer_phone_number Varchar(16) not null,
-- 	Credit_card_info Int not null,
-- 	Cusomer_email Varchar(36) not null,
-- 	Customer_login Varchar(36) not null,
-- 	Customer_password
-- Varchar(36) not null
-- 	);
-- create table if not exists Manufacturer(
-- 	ID_Manufacturer Int not null auto_increment primary key,
-- 	Manufacturer_name Varchar(36) not null
-- 	);
-- create table if not exists Manufacturing_country(
-- 	ID_Manufacturing_country Int not null auto_increment primary key,
-- 	Manufacturing_country_name Varchar(36) not null
-- 	);
-- create table if not exists Season(
-- 	ID_Season Int not null auto_increment  primary key,
-- 	Season_name Varchar(36) not null);
-- create table if not exists Composition(
-- 	ID_Composition Int not null auto_increment primary key,
-- 	Composition_name Varchar(36) not null
-- 	);
-- create table if not exists Size(
-- 	ID_Size Int not null auto_increment primary key,
-- 	Size Int not null
-- 	);
-- create table if not exists Supplier(
-- 	ID_Supplier Int not null auto_increment primary key,
-- 	Supplier_name Varchar(36) not null
-- 	);
-- create table if not exists Order_status(
-- 	ID_Order_status Int not null auto_increment primary key,
-- 	Order_status Varchar(36) not null
-- 	);
-- create table if not exists Worker (		
--             ID_Worker  int not null auto_increment primary key,	
-- 			Worker_surname Varchar(36) not null ,
--             Worker_name Varchar(36) not null,
--             Worker_second_name Varchar(36) not null,
--            Worker_login Varchar(36) not null,
--             Worker_password Varchar(36) not null,
--             Shop_ID Int not null, constraint FK_Shop_Worker foreign key (Shop_ID) references Shop(ID_Shop),
--             Position_id Int not null, constraint FK_Position_Worker foreign key (Position_id) references Positions(ID_Position)		
-- );

-- create table if not exists Request(	
-- 	ID_Request Int not null auto_increment primary key,
-- 	Request_number Int not null,
-- 	Request_date Date not null,
-- 	Worker_id Int not null, constraint FK_Worker_Request foreign key (Worker_id) references Worker(ID_Worker)
-- 	);

-- create table if not exists Client_order(	
-- 	ID_Client_order Int not null auto_increment  primary key,
-- 	Client_order_number Int not null,
-- 	Customer_id Int not null,    constraint FK_Customer_Client_order foreign key (Customer_id) references Customer(ID_Customer),
-- 	Client_order_date Date not null,
-- 	Client_order_time Time not null,
-- 	Client_order_sum Decimal(3,2) not null,
-- 	Worker_id Int not null, constraint FK_Worker_Client_order foreign key (Worker_id)  references Worker(ID_Worker)
-- 	);
-- create table if not exists Receipt(	
-- 	ID_Receipt Int not null auto_increment primary key,
-- 	Receipt_number Varchar(36) not null,
-- 	Client_order_id Int not null,  constraint FK_Client_order_Receipt foreign key (Client_order_id)  references Client_order(ID_Client_order),
-- 	Receipt_date Date not null,
-- 	Receipt_time Time not null,
-- 	Receipt_sum Decimal(3,2) not null,
-- 	Receipt_change Decimal(3,2) not null
-- 	);
-- create table if not exists Product(	
-- 	ID_Product Int not null auto_increment primary key,
-- 	Article_number Varchar(10) not null,
-- 	Product_type Varchar(36) not null,
-- 	Product_photo Text not null,
-- 	Manufacturing_country_id Int not null, constraint FK_Manufacturing_country_Product foreign key (Manufacturing_country_id)  references Manufacturing_country(ID_Manufacturing_country),
-- 	Manufacturer_id Int not null, constraint FK_Manufacturer_Product foreign key (Manufacturer_id)  references Manufacturer(ID_Manufacturer),	
-- 	Product_amount Int not null,
-- 	Product_price Decimal(3,2) not null
-- 		);
-- create table if not exists Orders(
-- 	ID_Order Int not null auto_increment primary key,
-- 	Order_number Int not null,
-- 	Supplier_id Int not null, constraint FK_Supplier_Orders foreign key (Supplier_id)  references Supplier(ID_Supplier),
-- 	Order_date Date not null,
-- 	Order_time Date not null,
-- 	Order_status_id Int not null, constraint FK_Order_status_Orders foreign key (Order_status_id)   references Order_status(ID_Order_status),
-- 	Costs Decimal(3,2) not null
-- 	);


-- create table if not exists Extra_request(
-- 	ID_Extra_request Int not null auto_increment primary key,
-- 	Extra_request_number Int not null,
-- 	Order_id Int not null, constraint FK_Order_Extra_request foreign key (Order_id) references Orders(ID_Order),
-- 	Worker_id Int not null, constraint FK_Worker_Extra_request foreign key (Worker_id) references Worker(ID_Worker)
-- 	);
-- create table if not exists Request_in_order(
-- 	ID_Request_in_order Int not null auto_increment primary key,
-- 	Request_id Int not null, constraint FK_Request_Request_in_order foreign key (Request_id)  references Request(ID_Request),
-- 	Order_id Int not null, constraint FK_Order_Request_in_order foreign key (Order_id)   references Orders(ID_Order)
-- 	);
-- create table if not exists Products_in_request(
-- 	ID_Product_in_request Int not null auto_increment primary key,
-- 	Product_id Int not null, constraint FK_Product_Product_in_request foreign key (Product_id)  references Product(ID_Product),
-- 	Request_id Int not null, constraint FK_Request_Product_in_request foreign key (Request_id)  references Request(ID_Request)
-- 	);
-- create table if not exists Products_in_customer_order (
-- 	ID_Product_in_customer_order Int not null auto_increment primary key,
-- 	Client_order_id Int not null, constraint FK_Client_order_Product_in_client_order foreign key (Client_order_id)  references Client_order(ID_Client_order),
-- 	Product_id Int not null, constraint FK_Product_Product_in_customer_order foreign key (Product_id)  references Product(ID_Product),
-- 	Product_amount Int not null
-- 	);
-- create table if not exists Product_size(
-- 	ID_Product_size Int not null auto_increment primary key,
-- 	Product_id Int not null, constraint FK_Product_Product_size foreign key (Product_id)  references Product(ID_Product),
-- 	Size_id Int not null, constraint FK_Size_Product_size foreign key (Size_id)   references Size(ID_Size)
-- 	);
-- create table if not exists Composition_product(
-- 	ID_Composition_product Int not null auto_increment primary key,
-- 	Composition_id Int not null, constraint FK_Composition_Composition_product foreign key (Composition_id)  references Composition(ID_Composition),
-- 	Product_id Int not null, constraint FK_Product_Composition_product foreign key (Product_id)  references Product(ID_Product),
-- 	Percents Int not null
-- 	);
-- create table if not exists Product_in_shop(
-- 	ID_Product_in_shop Int not null auto_increment primary key,
-- 	Shop_id Int not null, constraint FK_Shop_Product_in_shop foreign key (Shop_id)  references Shop(ID_Shop),
-- 	Product_id Int not null, constraint FK_Product_Product_in_shop foreign key (Product_id)  references Product(ID_Product),
-- 	Product_amount Int not null
-- 	);
-- create table if not exists Season_product(
-- 	ID_Season_product Int not null auto_increment primary key,
-- 	Product_id Int not null, constraint FK_Product_Season_product foreign key (Product_id)  references Product(ID_Product),
-- 	Season_id Int not null, constraint FK_Season_Season_product foreign key (Season_id)  references Season(ID_Season)
-- 	);
-- create table if not exists Product_on_display(
-- 	ID_Product_on_display Int not null auto_increment primary key,
-- 	Sales_floor_id Int not null, constraint FK_Sales_floor_Product_on_display foreign key (Sales_floor_id)  references Sales_floor(ID_Sales_floor),
-- 	Product_id Int not null, constraint FK_Product_Product_on_display foreign key (Product_id)  references Product(ID_Product),
-- 	Display_in_sales_floor Int not null
-- 	);
-- create table if not exists Sales_floor_in_shop(
-- 	ID_Sales_floor_in_shop Int not null auto_increment  primary key,
-- 	Sales_floor_id Int not null, constraint FK_Sales_floor_Sales_floor_in_shop foreign key (Sales_floor_id)  references Sales_floor(ID_Sales_floor),
-- 	Shop_id Int not null, constraint FK_Shop_Sales_floor_in_shop foreign key (Shop_id)  references Shop(ID_Shop),
-- 	Sector_in_sales_floor Int not null
-- 	);
-- create table if not exists Product_in_extra_request(
-- 	ID_Product_in_extra_request Int not null auto_increment primary key,
-- 	Extra_request_id Int not null, constraint FK_Extra_request_Product_in_extra_request foreign key (Extra_request_id)  references Extra_request(ID_Extra_request),
-- 	Product_id Int not null, constraint FK_Product_Product_in_extra_request foreign key (Product_id)  references Product(ID_Product),
-- 	Sum Decimal(12, 2) not null
-- 	);


-- create index index_Worker_login on Worker(Worker_login);
-- create index index_Position_name on Positions(Position_name);
-- create index index_Request_number on Request (Request_number);
-- create index index_Client_order_number on Client_order (Client_order_number);
-- create index index_Receipt_number on Receipt (Receipt_number);
-- create index index_Sales_floor_name on Sales_floor (Sales_floor_name);
-- create index index_Shop_name on Shop (Shop_name);
-- create index index_Shop_address on Shop (Shop_address);
-- create index index_Warehouse_number on Warehouse (Warehouse_number);
-- create index index_Warehouse_address on Warehouse (Warehouse_address);
-- create index index_Credit_card_info on Customer (Credit_card_info);
-- create index index_Customer_login on Customer (Customer_login);
-- create index index_Manufacturer_name on Manufacturer (Manufacturer_name);
-- create index index_Manufacturing_country_name on Manufacturing_country (Manufacturing_country_name);
-- create index index_Season_name on Season (Season_name);
-- create index index_Composition_name on Composition (Composition_name);
-- create index index_Size on Size (Size);
-- create index index_Extra_request_number on Extra_request (Extra_request_number);
-- create index index_Order_number on Orders (Order_number);

grant select on product_on_display to sukhareva_customer;
grant select on product_in_shop to sukhareva_customer;
grant select on Size to sukhareva_customer;
grant select on Product to sukhareva_customer;
grant select on Manufacturer to sukhareva_customer;
grant select on Manufacturing_country to sukhareva_customer;
grant select on Season to sukhareva_customer;
grant select on Composition to sukhareva_customer;
grant select on Shop to sukhareva_customer;
grant select on Sales_floor to sukhareva_customer;
grant select on Product_size to sukhareva_customer;
grant select on Composition_product to sukhareva_customer;
grant select on Season_product to sukhareva_customer;
grant select on Receipt to sukhareva_customer;
grant select, insert, update, delete on products_in_customer_order to sukhareva_customer;
grant select, insert, update, delete on Client_order to sukhareva_customer;
grant insert, update, delete on Customer to sukhareva_customer;


grant select on Positions to sukhareva_worker;
grant select on Client_order to sukhareva_worker;
grant select on Receipt to sukhareva_worker;
grant select on Sales_floor to sukhareva_worker;
grant select on Warehouse to sukhareva_worker;
grant select on Shop to sukhareva_worker;
grant select on Manufacturer to sukhareva_worker;
grant select on Manufacturing_country to sukhareva_worker;
grant select on Season to sukhareva_worker;
grant select on Composition to sukhareva_worker;
grant select on Supplier to sukhareva_worker;
grant select on Size to sukhareva_worker;
grant select on Products_in_customer_order to sukhareva_worker;
grant select on Product_size to sukhareva_worker;
grant select on Composition_product to sukhareva_worker;
grant select on Sales_floor_in_shop to sukhareva_worker;
grant select, update on Order_status to sukhareva_worker;
grant select, update on Season_product to sukhareva_worker;
grant select, update on Worker to sukhareva_worker;
grant select, insert, update, delete on Request to sukhareva_worker;
grant select, insert, update, delete on Product_in_shop to sukhareva_worker;
grant select, insert, update, delete on Product_on_display to sukhareva_worker;
grant select, insert, update, delete on Request_in_order to sukhareva_worker;
grant select, insert, update, delete on Product to sukhareva_worker;
grant select, insert, update, delete on Product_in_extra_request to sukhareva_worker;
grant select, insert, update, delete on extra_request to sukhareva_worker;
grant select, insert, update, delete on Orders to sukhareva_worker;
grant select, insert, update, delete on Products_in_request to sukhareva_worker;
grant select, insert on Customer to sukhareva_worker;


grant select, update on Order_status to sukhareva_supplier;
grant select, update on Supplier to sukhareva_supplier;
grant select, insert, update, delete on manufacturer to sukhareva_supplier;
grant select, insert, update, delete on Manufacturing_country to sukhareva_supplier;
grant select, insert, update, delete on Composition to sukhareva_supplier;
grant select, insert, update, delete on Size to sukhareva_supplier;
grant select, insert, update, delete on Season to sukhareva_supplier;
grant select, insert, update, delete on Composition_product to sukhareva_supplier;
grant select, insert, update, delete on Product_size to sukhareva_supplier;
grant select, insert, update, delete on Season_product to sukhareva_supplier;
grant select on Product_in_extra_request to sukhareva_supplier;
grant select on Products_in_request to sukhareva_supplier;
grant select on Request_in_order to sukhareva_supplier;


grant select, insert, update, delete on Positions to sukhareva_administrator;
grant select, insert, update, delete on Receipt to sukhareva_administrator;
grant select, insert, update, delete on Request to sukhareva_administrator;
grant select, insert, update, delete on Product to sukhareva_administrator;
grant select, insert, update, delete on Sales_floor to sukhareva_administrator;
grant select, insert, update, delete on Shop to sukhareva_administrator;
grant select, insert, update, delete on Warehouse to sukhareva_administrator;
grant select, insert, update, delete on Extra_request to sukhareva_administrator;
grant select, insert, update, delete on Orders to sukhareva_administrator;
grant select, insert, update, delete on Supplier to sukhareva_administrator;
grant select, insert, update, delete on Order_status to sukhareva_administrator;
grant select, insert, update, delete on Request_in_order to sukhareva_administrator;
grant select, insert, update, delete on Products_in_request to sukhareva_administrator;
grant select, insert, update, delete on Product_in_shop to sukhareva_administrator;
grant select, insert, update, delete on Product_on_display to sukhareva_administrator;
grant select, insert, update, delete on Sales_floor_in_shop to sukhareva_administrator;
grant select, insert, update, delete on Product_in_extra_request to sukhareva_administrator;
grant select, insert, delete on Worker to sukhareva_administrator;
grant select, delete on Worker to sukhareva_administrator;
grant select, delete on Customer to sukhareva_administrator;
grant select on Manufacturer to sukhareva_administrator;
grant select on Manufacturing_country to sukhareva_administrator;
grant select on Season to sukhareva_administrator;
grant select on Composition to sukhareva_administrator;
grant select on Size to sukhareva_administrator;
grant select on Products_in_customer_order to sukhareva_administrator;
grant select on Product_size to sukhareva_administrator;
grant select on Composition_product to sukhareva_administrator;
grant select, update on Season_product to sukhareva_administrator;
