-- select 
-- 	Position_name as " Наименование должности " 
-- from Position
-- 	order by 
-- 		Position_name ASC;

-- select 
-- 	Sales_floor_name as "Название торгового зала" 
-- from Sales_floor
-- 	order by 
-- 	Sales_floor_name ASC;

-- select 
-- 	Shop_name||' - адрес: '||Shop_address as "Наименование и адрес торговой точки" 
-- from Shop
-- 		order by 
-- 			Shop_name ASC, 
-- 			Shop_address ASC;


-- select 
-- 	'Логин: '||Worker_login||' Пароль: '||Worker_Password as "Данные для входа", 
-- 	Worker_Surname||' '||Worker_Name||' '||Worker_second_name as "ФИО", 
--         Shop_name as "Торговая точка", 
--         Position_ID as "Должность"
-- from Worker
-- 	inner join Shop on 
-- 		ID_Shop = Shop_ID
-- 	inner join Position on 
-- 		ID_Position = Position_ID
-- 		order by 
-- 			Position_ID ASC;


-- select 
-- 	Warehouse_number||' - адрес '||Warehouse_address as "Наименование и адрес склада",
--         Shop_name as "Наименование торговой точки"
-- from Warehouse
-- 	inner join Shop on 
-- 		ID_Shop = Shop_ID
-- 		order by 
-- 			Warehouse_number ASC;

-- select 
-- 	'Логин: '||Customer_login||'   Пароль: '||Customer_Password as "Данные для входа", 
-- 	Passport_series||' '||Passport_number as "Серия и номер паспорта", 
-- 	Customer_Surname||' '||Customer_Name||' '||Customer_last_name as "ФИО", 
--         Customer_phone_number as "Номер телефона", 
--         Credit_card_info as "Данные банковской карты"
-- from Customer
-- 		order by 
-- 			Credit_card_info ASC;

-- select 
-- 	Manufacturer_name as " Наименование производителя" 
-- from Manufacturer
-- 	order by 
-- 	Manufacturer_name ASC;

-- select 
-- 	Manufacturing_country_name as "Страна  производителя" 
-- from Manufacturing_country
-- 	order by 
-- 	Manufacturing_country_name ASC;


-- select 
--         'Артикул товара: '|| article_number||'    Вид одежды: '||Product_type as "Товар", 
--         Product_photo as "Фото продукта",
-- 	'Страна производителя: '||Manufacturing_country_name||'   Наименование производителя: '||Manufacturer_id as "Производитель", 
--         Product_amount as "Доступное количество",
--         Product_price as "Цена"

-- from Product
-- 	inner join Manufacturing_country on 
-- 		ID_Manufacturing_country = Manufacturing_country_ID
-- 	inner join Manufacturer on 
-- 		ID_Manufacturer = Manufacturer_ID
-- 		order by 
-- 			article_number ASC,
-- 			Product_type ASC;

-- select 
-- 	Season_name as "Сезон одежды" 
-- from Season
-- 	order by 
-- 	Season_name ASC;

-- select 
-- 	Composition_name as "Материал" 
-- from Composition
-- 	order by 
-- 	Composition_name ASC;

-- select 
-- 	Size as "Размер " 
-- from Size
-- 	order by 
-- 	id_Size ASC;

-- select 
-- 	Supplier_name as "Название поставщика" 
-- from Supplier
-- 	order by 
-- 	Supplier_name ASC;

-- select 
-- 	Order_status as "Наименование статуса заказа" 
-- from Order_status
-- 	order by 
-- 	id_Order_status ASC;

-- select 
-- 	Order_number as "Номер заказа",
-- 	Supplier_name as "Наименование поставщика",
-- 	Order_date||' '||Order_time as "Дата формирования заказа", 
-- 	Order_status as "Наименование статуса заказа",
--     Costs as "Стоимость"
-- from Orders
-- 	inner join Order_status on 
-- 		ID_Order_status = Order_status_ID
-- 	inner join Supplier on 
-- 		ID_Supplier = Supplier_ID
-- 		order by 
-- 			Order_number ASC,
-- 			Supplier_name ASC;

-- select 
-- 	Extra_request_number as "Номер доп заявки",
-- 	Order_number as "Код заказа"
-- from Extra_request
-- 	inner join Orders on 
-- 		ID_Order = Order_id
-- 		order by
-- 			Extra_request_number ASC, 
-- 			Order_number ASC;

-- select 
-- 	Request_number as "Номер заявки",
-- 	Request_date as "Дата создания заявки"
-- from Request
-- 	inner join Worker on 
-- 		ID_Worker = Worker_id
-- 		order by
-- 			Request_number ASC, 
-- 			Request_date ASC;

-- select 
-- 	Client_order_number as "Номер заказа",
-- 	Customer_Surname||' '||Customer_Name||' '||Customer_last_name as "Покупатель", 
-- 	'Дата: '||Client_order_date||'   Время: '||Client_order_time as "Дата заказа", 
--      Client_order_sum as "Сумма заказа",
--      Worker_Surname||' '||Worker_Name||' '||Worker_second_name as "Сотрудник"
-- from Client_order
-- 	inner join Customer on 
-- 		ID_Customer = Customer_ID
-- 	inner join Worker on 
-- 		ID_Worker = Worker_ID
-- 		order by 
-- 			Client_order_number ASC,
-- 			Customer_Surname ASC,
-- 			Client_order_date ASC;

-- select 
-- 	Receipt_number as "Номер чека",
-- 	Client_order_number as "Номер клиентского заказа", 
-- 	'Дата: '||Receipt_date||' Время: '||Receipt_time as "Дата заказа", 
--         Receipt_sum as "Итоговая сумма",
--         Receipt_change as "Сдача"
-- from Receipt 
-- 	inner join Client_order on 
-- 		ID_Client_order = Client_order_ID
-- 		order by 
-- 			Receipt_number ASC,
-- 			Receipt_date ASC,
-- 			Receipt_sum DESC;


-- select 
-- 	'Номер заявки: '||Request_number as "Заявка на поставку", 
-- 	'Номер заказа: '||Order_number as "Заказ на поставку "
-- from Request_in_order
-- 	inner join Request on
-- 		ID_Request = Request_ID
-- 	inner join Orders on
-- 		ID_Order = Order_ID
-- 			order by
-- 				Order_number ASC,
-- 				Request_number ASC;

-- select 
-- 	'Артикул товара: '|| article_number||'    Вид одежды: '||Product_type as "Товар", 
-- 	Request_number as "Номер заявки"
-- from Products_in_request
-- 	inner join Product on
-- 		ID_Product = Product_ID
-- 	inner join Request on
-- 		ID_Request = Request_ID
-- 			order by
-- 				Request_number ASC,
-- 				article_number ASC,
-- 				Product_type ASC;

-- select 
-- 	Client_order_number||'    Сумма заказа: '|| Client_order_sum as "Клиентский заказ", 
-- 	Customer_Surname||' '||Customer_Name||' '||Customer_last_name as "Покупатель", 
-- 	'Артикул товара: '|| article_number||'    Вид одежды: '||Product_type as "Товар",
-- 	Products_in_customer_order.Product_amount as "Количество товара"
-- from Products_in_customer_order
-- 	inner join Product on
-- 		ID_Product = Product_ID
-- 	inner join Client_order on 
-- 		ID_Client_order = Customer_order_ID
-- 	inner join Customer on 
-- 		ID_Customer = Customer_ID
-- 			order by
-- 				article_number ASC,
-- 				Client_order ASC,
-- 				Customer_Surname ASC,
-- 				Products_in_customer_order.Product_amount ASC;

-- select 
-- 	'Артикул товара: '|| article_number||'    Вид одежды: '||Product_type as "Товар",
-- 	Size as "Размер товара"
-- from Product_size
-- 	inner join Product on
-- 		ID_Product = Product_ID
-- 	inner join Size on 
-- 		ID_Size = Size_ID
-- 			order by
-- 				article_number ASC,
-- 				Size ASC;

-- select 
-- 	'Артикул товара: '|| article_number||'    Вид одежды: '||Product_type as "Товар",
-- 	Composition_name as "Материал",
-- 	Percents as "Процент"
-- from Composition_product
-- 	inner join Product on
-- 		ID_Product = Product_ID
-- 	inner join Composition on 
-- 		ID_Composition = Composition_ID
-- 			order by
-- 				article_number ASC,
-- 				Composition_name ASC,
-- 				percents ASC;

-- select 
-- 	'Артикул товара: '|| article_number||'    Вид одежды: '||Product_type as "Товар",
-- 	Shop_name||' - адрес '||Shop_address as "Торговая точка" ,
-- 	Product_in_shop.Product_amount as "Количество товара"
-- from Product_in_shop
-- 	inner join Product on
-- 		ID_Product = Product_ID
-- 	inner join Shop on 
-- 		ID_Shop = Shop_ID
-- 			order by
-- 				article_number ASC,
-- 				Shop_name ASC,
-- 				Product_in_shop.Product_amount ASC;

-- select 
-- 	'Артикул товара: '|| article_number||'    Вид одежды: '||Product_type as "Товар",
-- 	Season_name as "Сезон"
-- from Season_product
-- 	inner join Product on
-- 		ID_Product = Product_ID
-- 	inner join Season on 
-- 		ID_Season = Season_ID
-- 			order by
-- 				article_number ASC,
-- 				Season_name ASC;


-- select 
-- 	Shop_name as "Торговая точка",
-- 	Sales_floor_name as "Зал торговой точки",
-- 	Sector_in_sales_floor as "Сектор торгового зала"
-- from Sales_floor_in_shop
-- 	inner join Shop on
-- 		ID_Shop = Shop_ID
-- 	inner join Sales_floor on 
-- 		ID_Sales_floor = Sales_floor_ID
-- 			order by
-- 				Shop_name ASC,
-- 				Sales_floor_name ASC,
-- 				Sector_in_sales_floor ASC;

-- select 
-- 	'Артикул товара: '|| article_number||'    Вид одежды: '||Product_type as "Товар",
-- 	Shop_name||' '||Sales_floor_name as "Зал торговой точки",
-- 	Display_in_sales_floor as "Стенд торгового зала"
-- from Product_on_display
-- 	inner join Product on
-- 		ID_Product = Product_ID
-- 	inner join Sales_floor_in_shop on 
-- 		ID_Sales_floor_in_shop = Sales_floor_in_shop_ID
-- 	inner join Sales_floor on 
-- 		ID_Sales_floor = Sales_floor_ID
-- 	inner join Shop on 
-- 		ID_Shop = Shop_ID
-- 			order by
-- 				article_number ASC,
-- 				Shop_name ASC,
-- 				Display_in_sales_floor ASC;

-- select 
-- 	'Артикул товара: '|| article_number||'    Вид одежды: '||Product_type as "Товар",
-- 	'Номер доп заявки: '||Extra_request_number||'    Номер заказа: '||Order_number as "Доп заявка",
-- 	Sum as "Сумма"
-- from Product_in_extra_request
-- 	inner join Product on
-- 		ID_Product = Product_ID
-- 	inner join Extra_request on 
-- 		ID_Extra_request = Extra_request_ID
-- 	inner join Orders on 
-- 		ID_Order = Order_ID
-- 			order by
-- 				article_number ASC,
-- 				Extra_request_number ASC;











-- rl_admin
-- call position_update (3, 'Кассир');
-- call position_update (3, 'Старший кассир');
-- call Position_Insert('Кассир');
-- call Position_delete(5);

-- call shop_update(1, 'FG-01', 'ул. Беговая, д. 17, стр. 8');
-- call Shop_update(2, 'FG-02', 'г. Москва, ул. Комсомольская, д. 56, стр. 6');

