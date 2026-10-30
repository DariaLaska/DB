ALTER TABLE Worker
ADD CONSTRAINT UQ_Worker_login UNIQUE (Worker_login),
ADD CONSTRAINT CH_Worker_login_len CHECK (LENGTH(Worker_login) >= 6),
ADD CONSTRAINT CH_Worker_login_LetterU CHECK (regexp_like(Worker_login, '[A-Z]')),
ADD CONSTRAINT CH_Worker_login_LetterL CHECK (regexp_like(Worker_login, '[a-z]')),
ADD CONSTRAINT CH_Worker_password_Len CHECK (length(Worker_password) >= 8),
ADD CONSTRAINT CH_Worker_password_LetterU CHECK (regexp_like(Worker_password, '[A-Z]')),
ADD CONSTRAINT CH_Worker_password_LetterL CHECK (regexp_like(Worker_password, '[a-z]')),
ADD CONSTRAINT CH_Worker_password_Numb CHECK (regexp_like(Worker_password, '[0-9]')),

ADD CONSTRAINT CH_Worker_password_Symb CHECK (regexp_like(Worker_password, '[!@#$^&*()]')),

ALTER COLUMN Worker_second_name SET DEFAULT 'Нет данных';



Alter table Positions
add constraint UQ_Position_name unique (Position_name);


Alter table Request
add constraint UQ_Request_number unique (Request_number);


Alter table Client_order
add constraint UQ_Client_order_number unique (Client_order_number),
add constraint CH_Client_order_number check (regexp_like(Client_order_number, 'ЗкП-[0-9]{9}-[0-9]{2}')),
add constraint CH_Client_order_sum check (Client_order_sum >= 0);

ALTER TABLE Client_order MODIFY Client_order_number varchar (19);


Alter table Receipt
           add constraint UQ_Receipt_number unique (Receipt_number),
             add constraint CH_Receipt_number check (regexp_like(Receipt_number, 'КЧ-[0-9]{10}')),
             add constraint CH_Receipt_sum check (Receipt_sum >= 0),
             add constraint CH_Receipt_change check (Receipt_change >= 0);
             
Alter table Receipt MODIFY Receipt_number varchar(16);


Alter table Sales_floor
add constraint UQ_Sales_floor_name unique (Sales_floor_name);


Alter table Shop
           add constraint UQ_Shop_name unique (Shop_name),
           add constraint CH_Shop_name check (regexp_like(Shop_name, 'FG-[0-9]{2}')),
           add constraint UQ_Shop_address unique (Shop_address);

alter table Shop modify Shop_name varchar(7);



Alter table Warehouse
           add constraint UQ_Warehouse_number unique (Warehouse_number),
           add constraint CH_Warehouse_number check (regexp_like(Warehouse_number, 'СП[0-9]{2}'));

alter table Warehouse modify Warehouse_number varchar(7);


Alter table Customer
    add constraint CH_Passport_series check (regexp_like(Passport_series, '[0-9]{2} [0-9]{2}')),
    add constraint CH_Passport_number check (regexp_like(Passport_number, '[0-9]{6}')),
	
    add constraint CH_Customer_phone_number check (regexp_like(Customer_phone_number, '^\\+7\\([0-9]{3}\\)[0-9]{3}-[0-9]{2}-[0-9]{2}$')),
 
    add constraint CH_Credit_card_info check (regexp_like(Credit_card_info, '[0-9]{4} [0-9]{4} [0-9]{4} [0-9]{4}')),
	add constraint UQ_Credit_card_info unique (Credit_card_info),

	add constraint UQ_Customer_login unique (Customer_login),
	add constraint CH_Customer_login_len check (length(Customer_login) >= 6),
	add constraint CH_Customer_login_LetterU check (regexp_like(Customer_login, '[a-zA-Z]')),
	add constraint CH_Customer_password_Len check (length(Customer_password) >= 8),
	add constraint CH_Customer_password_LetterU check (regexp_like(Customer_password, '[A-Z]')),
	add constraint CH_Customer_password_LetterL check (regexp_like(Customer_password, '[a-z]')),
	add constraint CH_Customer_password_Numb check (regexp_like(Customer_password, '[0-9]')),
    add constraint CH_Customer_passwor_Symb check (regexp_like(Customer_password, '[!@#$^&*()]'));
	

alter column Customer_last_name set default ('Нет данных');

alter table Customer modify Passport_series  varchar(8);
alter table Customer modify Passport_number  varchar(9);
alter table Customer modify Customer_phone_number  varchar(19);
alter table Customer modify Credit_card_info  varchar(22);



Alter table Product
            add constraint CH_Article_number check (regexp_like(Article_number, 'SP/[0-9]{7}')),
            add constraint UQ_Article_number unique (Article_number),

            add constraint UQ_Product_type unique (Product_type),
             add constraint CH_Product_amount check (Product_amount > 0),

             add constraint CH_Product_price check (Product_price > 0);

alter table Product modify Article_number varchar(13);


Alter table Manufacturer
            add constraint UQ_Manufacturer_name unique (Manufacturer_name);

Alter table Manufacturing_country
            add constraint UQ_Manufacturing_country_name unique (Manufacturing_country_name);


Alter table Season
            add constraint UQ_Season_name unique (Season_name);

Alter table Composition
            add constraint UQ_Composition_name unique (Composition_name);

Alter table Size
            add constraint UQ_Size unique (Size);



Alter table Extra_request
            add constraint UQ_Extra_request_number unique (Extra_request_number),
    add constraint CH_Extra_request_number check (regexp_like(Extra_request_number, 'ЗП-[0-9]{10}-[0-9]{2}/[0-9]'));

alter table Extra_request modify Extra_request_number varchar(21);


Alter table Orders
            add constraint UQ_Order_number unique (Order_number),
    add constraint CH_Order_number check (regexp_like(Order_number, 'ЗП-[0-9]{10}-[0-9]{2}'));

alter table Orders modify Order_number varchar(19);


Alter table Order_status
            add constraint CH_Order_status check (Order_status in ('В обработке', 'В пути', 'Доставлено'));


Alter table Products_in_customer_order
             add constraint CH_Products_amount check (Product_amount > 0);


Alter table Composition_Product
             add constraint CH_Percent check (Percents > 0);

Alter table Product_in_shop             
add constraint CH_Product_in_shop_Product_amount check (Product_amount > 0);



Alter table Product_on_display             
        add constraint CH_Display_in_sales_floor check (Display_in_sales_floor > 0);


Alter table Product_in_extra_request
        add constraint CH_Sum check (Sum > 0);




CREATE TABLE Client_order_in_itinerary (
    ID_Client_order_in_itinerary INT AUTO_INCREMENT NOT NULL,
    Itinerary_id INT NOT NULL,
    Client_order_id INT NOT NULL,
    Packaging_time TIME NOT NULL,
    Cl_order_to_curier_time TIME NOT NULL,
    Order_on_way TIME NOT NULL,
    Cl_order_to_client TIME NOT NULL,
    Deliv_order_status_id INT NOT NULL,
    
    PRIMARY KEY (ID_Client_order_in_itinerary),
    FOREIGN KEY (Itinerary_id) REFERENCES Itinerary (ID_Itinerary),
    FOREIGN KEY (Client_order_id) REFERENCES Client_order (ID_Client_order),
    FOREIGN KEY (Deliv_order_status_id) REFERENCES Deliv_order_status (ID_Deliv_order_status)
);

CREATE INDEX index_ID_Client_order_in_itinerary ON Client_order_in_itinerary (ID_Client_order_in_itinerary);
CREATE INDEX index_Cl_order_to_curier_time ON Client_order_in_itinerary (Cl_order_to_curier_time);
CREATE INDEX index_Packaging_time ON Client_order_in_itinerary (Packaging_time);
CREATE INDEX index_Order_on_way ON Client_order_in_itinerary (Order_on_way);
CREATE INDEX index_Cl_order_to_client ON Client_order_in_itinerary (Cl_order_to_client);




CREATE TABLE Deliv_order_status (
    ID_Deliv_order_status INT AUTO_INCREMENT NOT NULL,
    Delivery_order_status VARCHAR(36) NOT NULL,
    PRIMARY KEY (ID_Deliv_order_status),
    UNIQUE KEY UQ_Delivery_order_status (Delivery_order_status),
    CHECK (Delivery_order_status IN ('Ожидает выдачи', 'В пути', 'Закрыт'))
);

CREATE INDEX index_ID_Deliv_order_status ON Deliv_order_status (ID_Deliv_order_status);
CREATE INDEX index_Delivery_order_status ON Deliv_order_status (Delivery_order_status);


CREATE TABLE Delivery_man (
    ID_Delivery_man INT AUTO_INCREMENT NOT NULL,
    Delivery_man_surname VARCHAR(36) NOT NULL,
    Delivery_man_name VARCHAR(36) NOT NULL,
    Delivery_man_second_name VARCHAR(36) DEFAULT 'Отсутствует',
    Delivery_man_phone VARCHAR(16) NOT NULL,
    PRIMARY KEY (ID_Delivery_man),
    UNIQUE KEY UQ_Delivery_man_phone (Delivery_man_phone),
    CHECK (Delivery_man_phone REGEXP '^\\+7\\([0-9]{3}\\)[0-9]{3}-[0-9]{2}-[0-9]{2}$')
);

CREATE INDEX index_ID_Delivery_man ON Delivery_man (ID_Delivery_man);
CREATE INDEX ndex_Delivery_man_phone ON Delivery_man (Delivery_man_phone);


CREATE TABLE Car (
    ID_Car INT NOT NULL AUTO_INCREMENT,
    Car_model VARCHAR(36) NOT NULL,
    Car_number VARCHAR(12) NOT NULL,
    PRIMARY KEY (ID_Car),
    UNIQUE KEY UQ_Car_model (Car_model),
    UNIQUE KEY UQ_Car_number (Car_number),
    CHECK (Car_number REGEXP '^[ABCEHKMOPTYX][0-9]{3}[ABCEHKMOPTYX]{2} [0-9]{2}')
);

CREATE INDEX index_ID_Car ON Car (ID_Car);
CREATE INDEX index_Car_number ON Car (Car_number);


CREATE TABLE Overall_status (
    ID_Overall_status INT NOT NULL AUTO_INCREMENT,
    Overall_status VARCHAR(36) NOT NULL,
    PRIMARY KEY (ID_Overall_status),
    UNIQUE KEY UQ_Overall_status (Overall_status),
    CHECK (Overall_status IN ('Завершён', 'Выполняется'))
);

CREATE INDEX  index_ID_Overall_status ON Overall_status (ID_Overall_status);
CREATE INDEX  index_Overall_status ON Overall_status (Overall_status);


CREATE TABLE Itinerary (
    ID_Itinerary INT NOT NULL AUTO_INCREMENT,
    Itinerary_number VARCHAR(22) NOT NULL,
    Itinerary_date DATE NOT NULL,
    Itinerary_time TIME NOT NULL,
    Delivery_man_id INT NOT NULL,
    Car_id INT NOT NULL,
    Overall_status_id INT NOT NULL,
    PRIMARY KEY (ID_Itinerary),
    UNIQUE KEY UQ_Itinerary_number (Itinerary_number),
    CONSTRAINT CH_Itinerary_number CHECK (Itinerary_number REGEXP 'Д-МЛ-[0-9]{2}-[0-9]{10}'),
    FOREIGN KEY (Delivery_man_id) REFERENCES Delivery_man (ID_Delivery_man),
    FOREIGN KEY (Car_id) REFERENCES Car (ID_Car),
    FOREIGN KEY (Overall_status_id) REFERENCES Overall_status (ID_Overall_status)
);

CREATE INDEX  index_ID_Itinerary ON Itinerary (ID_Itinerary);
CREATE INDEX  index_Itinerary_number ON Itinerary (Itinerary_number);
