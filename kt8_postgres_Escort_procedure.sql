-- create or replace procedure Manufacturing_country_Insert (p_Manufacturing_country_name Varchar(36))
-- language plpgsql
-- as $$
-- 	begin
-- 		insert into Manufacturing_country
-- (Manufacturing_country_name )
-- 		values (p_Manufacturing_country_name );
-- 		exception when others then
-- 			raise notice 'Указанная страна уже есть в базе!';
-- 	end;
-- $$;
-- call Manufacturing_country_Insert('Китай');





-- create or replace procedure Car_Insert (
-- 	p_Car_model Varchar(36), 
-- 	p_Car_number Varchar(12)
-- )
-- language plpgsql
-- as $$
-- 	begin
-- 		insert into Car (Car_model, Car_number)
-- 		values (p_Car_model, p_Car_number);
-- 	end;
-- $$;
-- call Car_Insert('KIA Rio', 'O464OP 77');
-- select * from Car;

-- create or replace procedure Delivery_man_Insert(
-- 	p_Delivery_man_surname Varchar(36), 
-- 	p_Delivery_man_name Varchar(36),
-- 	p_Delivery_man_second_name Varchar(36),
-- 	p_Delivery_man_phone Varchar(19)
-- )
-- language plpgsql
-- as $$
-- 	begin
-- 		insert into Delivery_man(Delivery_man_surname, Delivery_man_name, Delivery_man_second_name, Delivery_man_phone)
-- 		values (p_Delivery_man_surname, p_Delivery_man_name, p_Delivery_man_second_name, p_Delivery_man_phone);
-- 	end;
-- $$;
-- call Delivery_man_Insert('Павлов', 'Роман', 'Дмитриевич', '+7(999)999-99-99');
-- select * from Delivery_man;

-- create or replace procedure Overall_status_Insert(
-- 	p_Overall_status varchar(36) 
-- )
-- language plpgsql
-- as $$
-- 	begin
-- 		insert into Overall_status(Overall_status)
-- 		values (p_Overall_status);
-- 	end;
-- $$;
-- call Overall_status_Insert('Выполняется');
-- select * from Overall_status;
-- call Overall_status_Insert('Завершён');
-- select * from Overall_status;


-- create or replace procedure Itinerary_Insert ( 
-- 	p_Itinerary_date Date, 
-- 	p_Itinerary_time Time, 
-- 	p_Delivery_man_id Int, 
-- 	p_Car_id Int, 
-- 	p_Overall_status_id Int
-- )
-- language plpgsql
-- as $$
-- 	declare p_New_Number int := count(*)+1 from Itinerary;
-- 	declare p_Year int := SUBSTRING(p_Itinerary_date::text, 3, 2);
-- 	declare p_Symb_Len smallint := length(p_New_Number::text);
-- 	declare p_Loop_Max_Step smallint := 10 - p_Symb_Len;
-- 	declare p_New_Text_Number varchar (21) := '';
-- 	begin
-- 		for i in 1..p_Loop_Max_Step loop
-- 			p_New_Text_Number := p_New_Text_Number||'0';
-- 		end loop;
-- 		p_New_Text_Number:= 'Д-МЛ-'||p_Year||'-'||p_New_Text_Number||p_New_Number;
-- 		insert into Itinerary ( Itinerary_number, 
-- 							    Itinerary_date, 
-- 								Itinerary_time, 
-- 								Delivery_man_id, 
-- 								Car_id, 
-- 								Overall_status_id)
-- 		values (p_New_Text_Number, p_Itinerary_date, p_Itinerary_time, p_Delivery_man_id, p_Car_id, 
-- 								p_Overall_status_id);
-- 	end;
-- $$;

-- call Itinerary_Insert('2024-03-01', '10:00:00', 1, 1, 1);



-- create or replace procedure Customer_Delete (p_ID_Customer int)
-- language plpgsql
-- as $$
-- 	declare p_Exist_Client_order smallint := count(*) from Client_order
-- 		where Customer_id = p_ID_Customer;
-- 	begin
-- 		if (p_Exist_Client_order > 0) then
-- 			raise notice 'Выбранного клиента невозможно удалить!';
-- 		else
-- 			delete from Customer
-- 				where 
-- 					ID_Customer = p_ID_Customer;
-- 		end if;
-- 	end;
-- $$;
-- call Customer_Delete(8);

-- drop procedure Season_product_Insert ;
-- create or replace procedure Season_product_Insert (p_Product_id Int, p_Season_id Int)
-- language plpgsql
-- as $$
-- 	declare p_Exist_Season smallint := count(*) from Season_product
-- 		where  
-- 			Product_id = p_Product_id and 
-- 			Season_id = p_Season_id;
-- 	begin
-- 		if (p_Exist_Season <> 0) then
-- 			raise notice 'Указанный сезон уже есть у выбранного товара!';
-- 		else
-- 			insert into Season_product(Product_id, Season_id)
-- 			values (p_Product_id, p_Season_id);
-- 		end if;
-- 	end;
-- $$;
-- call Season_product_Insert(4, 1);

CREATE FUNCTION array_zip_with_multiply( arr_q anyarray, arr_e anyarray )
RETURNS anyarray
AS $$
  SELECT ARRAY(
    SELECT a*b
    FROM unnest(
      arr_q, -- ex1
      arr_e  -- ex2
    ) AS t(a,b)
  );
$$ LANGUAGE sql
IMMUTABLE;



select * from Product;
drop procedure Products_in_customer_order(p_Customer_order_id Int,
											p_Product_id Int, p_Product_amount Int );
											
create or replace procedure Products_in_customer_order(p_Customer_order_id Int,
											p_Product_id Int, p_Product_amount Int )
language plpgsql
as $$
	declare p_Sum_Order decimal(10,2) := 0;
	declare p_new_price int := product_price from product
	where id_product = p_Product_id;
	
	declare p_prods_id INT[] := ARRAY_AGG(product_id::int) 
		from Products_in_customer_order
			where products_in_customer_order.customer_order_id = p_Customer_order_id;
	declare p_prods_price INT[] := ARRAY_AGG(product_price::decimal(10,2)) from Product
			where id_product = ((p_prods_id)+3);
	declare p_prods_amount INT[] := ARRAY_AGG(product_amount::int) 
		from Products_in_customer_order
			where customer_order_id = p_Customer_order_id;
	
 	begin
		
		insert into Products_in_customer_order(Customer_order_id,
											Product_id, Product_amount )
		values (p_Customer_order_id, p_Product_id, p_Product_amount);

		SELECT array_zip_with_multiply( p_prods_price, p_prods_amount );
		p_Sum_Order := distinct(sum(array_zip_with_multiply( p_prods_price, p_prods_amount )));
		
		p_Sum_Order := p_Sum_Order + p_new_price*p_Product_amount;

		update Client_order set
			Client_order_sum = p_Sum_Order
				where 
					Client_order_id = p_Customer_order_id;
	end;
	
$$;  

call Products_in_customer_order(2, 4, 1);

select Cliet_order_sum from Client_order
where Client_order_id = ;

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

create or replace procedure Client_order_Insert (p_Client_order_number Varchar(19), 
p_Customer_id Int, 
p_Client_order_date Date, 
p_Client_order_time Time,
 p_Client_order_sum Decimal(10,2), 
p_Worker_id Int)
language plpgsql
as $$
	declare p_SumPrice decimal(5,1) := 0;
	declare p_New_Price decimal (10,2) := product_price from Product 
									where id_product = p_Product_id;
 	begin
		Product_in_customer_order

		insert into Client_order (Client_order_number, Customer_id , Client_order_date, Client_order_time, Client_order_sum, Worker_id )
		values (p_Client_order_number, p_Customer_id , p_Client_order_date, p_Client_order_time, Client_order_sum, Worker_id );
		p_SumPrice := distinct(sum(Client_order_sum)) from Client_order
			where Client_order_id = p_Client_order_id;
		p_SumPrice := p_SumPrice + p_New_Price;
		update Client_order set
			Client_order_sum = p_SumPrice
				where 
					Client_order_id = p_Client_order_id;
	end;
$$; 
call Client_order_Insert (17, 18, 1);
select * from client_order










-- create or replace procedure Deliv_order_status_Insert (p_Delivery_order_status varchar(36))
-- language plpgsql
-- as $$
-- 	begin
-- 		insert into Deliv_order_status(Delivery_order_status)
-- 		values (p_Delivery_order_status);
-- 			exception when others then
-- 				raise notice 'Указанный статус уже есть!';
-- 	end;
-- $$;

-- create or replace procedure Deliv_order_status_Update(p_ID_Deliv_order_status int, p_Delivery_order_status varchar(36))
-- language plpgsql
-- as $$
-- 	begin
-- 		update Deliv_order_status set
-- 		Delivery_order_status = p_Delivery_order_status
-- 			where
-- 				ID_Deliv_order_status  = p_ID_Deliv_order_status ;
-- 				exception when others then
-- 					raise notice 'Указанный статус уже есть!';
-- 	end;
-- $$;

-- create or replace procedure Deliv_order_status_Delete(p_ID_Deliv_order_status int)
-- language plpgsql
-- as $$
-- 	declare p_Exist smallint := count(*) from Client_order_in_itinerary
-- 		where Deliv_order_status_id = p_ID_Deliv_order_status;
-- 	begin
-- 		if (p_Exist > 0) then
-- 			raise notice 'Выбранный тип удилть нельзя, есть созданная ID карта!';
-- 		else
-- 			delete from Deliv_order_status
-- 				where
-- 					Deliv_order_status_id = p_ID_Deliv_order_status;
-- 		end if;
-- 	end;
-- $$;


-- create or replace procedure Delivery_man_Insert (  p_Delivery_man_surname Varchar(36), 
-- 													p_Delivery_man_name Varchar(36),
-- 													p_Delivery_man_second_name Varchar(36),
-- 													p_Delivery_man_phone Varchar(19) )
-- language plpgsql
-- as $$
-- 	begin
-- 		insert into Delivery_man (Delivery_man_surname, Delivery_man_name, Delivery_man_second_name, Delivery_man_phone)
-- 		values (p_Delivery_man_surname, p_Delivery_man_name, p_Delivery_man_second_name, p_Delivery_man_phone);
-- 			exception when others then
-- 				raise notice 'Такой курьер уже есть!';
-- 	end;
-- $$;

-- create or replace procedure Delivery_man_Update(ID_Delivery_man Int, p_Delivery_man_surname Varchar(36), 
-- 													p_Delivery_man_name Varchar(36),
-- 													p_Delivery_man_second_name Varchar(36),
-- 													p_Delivery_man_phone Varchar(19))
-- language plpgsql
-- as $$
-- 	begin
-- 		update Delivery_man set
-- 		Delivery_man_surname = p_Delivery_man_surname,
-- 		Delivery_man_name = p_Delivery_man_name,
-- 		Delivery_man_second_name = p_Delivery_man_second_name,
-- 		Delivery_man_phone = p_Delivery_man_phone
-- 			where
-- 				ID_Delivery_man   = p_ID_Delivery_man;
-- 				exception when others then
-- 					raise notice 'Такой курьер уже есть!';
-- 	end;
-- $$;

-- create or replace procedure Delivery_man_Delete(p_ID_Delivery_man int)
-- language plpgsql
-- as $$
-- 	declare p_Exist smallint := count(*) from Itinerary
-- 		where Delivery_man_id = p_ID_Delivery_man;
-- 	begin
-- 		if (p_Exist > 0) then
-- 			raise notice 'Выбранного курьера нельзя удалить, он есть в маршутном листе!';
-- 		else
-- 			delete from Deliv_order_status
-- 				where
-- 					Deliv_order_status_id = p_ID_Deliv_order_status;
-- 		end if;
-- 	end;
-- $$;




-- create or replace procedure Car_Update(p_ID_Car Int, p_Car_model Varchar(36), p_Car_number Varchar(12))
-- language plpgsql
-- as $$
-- 	begin
-- 		update Car set
-- 		Car_model = p_Car_model,
-- 		Car_number = p_Car_number
-- 			where
-- 				ID_Car   = p_ID_Car;
-- 				exception when others then
-- 					raise notice 'Такой автомобиль уже есть!';
-- 	end;
-- $$;

-- create or replace procedure Car_Delete(p_ID_Car Int)
-- language plpgsql
-- as $$
-- 	declare p_Exist smallint := count(*) from Itinerary
-- 		where Car_id = p_ID_Car;
-- 	begin
-- 		if (p_Exist > 0) then
-- 			raise notice 'Выбранный автомобиль нельзя удалить, он есть в маршутном листе!';
-- 		else
-- 			delete from Car
-- 				where
-- 					Car_id = p_ID_Car;
-- 		end if;
-- 	end;
-- $$;



-- create or replace procedure Itinerary_Update ( 
-- 	p_ID_Itinerary Int,
-- 	p_Itinerary_date Date, 
-- 	p_Itinerary_time Time, 
-- 	p_Delivery_man_id Int, 
-- 	p_Car_id Int, 
-- 	p_Overall_status_id Int
-- )
-- language plpgsql
-- as $$
-- 	begin
-- 		update Itinerary set
-- 		Itinerary_date = p_Itinerary_date,
-- 		Itinerary_time = p_Itinerary_time,
-- 		Delivery_man_id  = p_Delivery_man_id,
-- 		Car_id = p_Car_id,
-- 		Overall_status_id = p_Overall_status_id
-- 			where
-- 				ID_Itinerary   = p_ID_Itinerary;
				
-- 	end;
-- $$;


-- create or replace procedure Itinerary_Delete (p_ID_Itinerary Int)
-- language plpgsql
-- as $$
-- 	declare p_Exist smallint := count(*) from Client_order_in_itinerary
-- 		where Itinerary_id = p_id_Itinerary;
-- 	begin
-- 		if (p_Exist > 0) then
-- 			raise notice 'Выбранный маршутный лист нельзя удалить!';
-- 		else
-- 			delete from Itinerary
-- 				where
-- 					id_Itinerary = p_ID_Itinerary;
-- 		end if;
-- 	end;
-- $$;


-- create or replace procedure Overall_status_Insert (p_Overall_status varchar(36))
-- language plpgsql
-- as $$
-- 	begin
-- 		insert into Overall_status (Overall_status)
-- 		values (p_Overall_status);
-- 	end;
-- $$;

-- create or replace procedure Overall_status_Update(p_ID_Overall_status Int, p_Overall_status varchar(36))
-- language plpgsql
-- as $$
-- 	begin
-- 		update Overall_status set
-- 		Overall_status = p_Overall_status
-- 			where
-- 				ID_Overall_status   = p_ID_Overall_status;
-- 				exception when others then
-- 					raise notice 'Такой статус уже есть!';
-- 	end;
-- $$;

-- create or replace procedure Overall_status_Delete(p_ID_Overall_status Int)
-- language plpgsql
-- as $$
-- 	declare p_Exist smallint := count(*) from Itinerary
-- 		where Car_id = p_ID_Car;
-- 	begin
-- 		if (p_Exist > 0) then
-- 			raise notice 'Выбранный статус нельзя удалить, он есть в маршутном листе!';
-- 		else
-- 			delete from Overall_status
-- 				where
-- 					Overall_status_id = p_ID_Overall_status;
-- 		end if;
-- 	end;
-- $$;

-- ALTER TABLE Client_order_in_itinerary ADD Deliv_order_status_id Int not null references Deliv_order_status(ID_Deliv_order_status);

-- create or replace procedure Client_order_in_itinerary_Insert ( p_Itinerary_id Int,
-- 																p_Client_order_id Int,
-- 																p_Packaging_time Time,
-- 																p_Cl_order_to_curier_time Time,
-- 																p_Order_on_way Time,
-- 																p_Cl_order_to_client Time,
-- 																p_Deliv_order_status_id Int )
-- language plpgsql
-- as $$
-- 	begin
-- 		insert into Client_order_in_itinerary (Itinerary_id, Client_order_id, Packaging_time, Cl_order_to_curier_time, Order_on_way, Cl_order_to_client, Deliv_order_status_id)
-- 		values (p_Itinerary_id, p_Client_order_id, p_Packaging_time, p_Cl_order_to_curier_time, p_Order_on_way, p_Cl_order_to_client, p_Deliv_order_status_id);
-- 	end;
-- $$;

-- create or replace procedure Client_order_in_itinerary_Update(  p_ID_Client_order_in_itinerary Int,
-- 																p_Itinerary_id Int,
-- 																p_Client_order_id Int,
-- 																p_Packaging_time Time,
-- 																p_Cl_order_to_curier_time Time,
-- 																p_Order_on_way Time,
-- 																Cl_order_to_client Time,
-- 																p_Deliv_order_status_id Int )
-- language plpgsql
-- as $$
-- 	begin
-- 		update Client_order_in_itinerary set
-- 		Itinerary_id =p_Itinerary_id,
-- 		Client_order_id = p_Client_order_id,
-- 		Packaging_time = p_Packaging_time,
-- 		Cl_order_to_curier_time = p_Cl_order_to_curier_time,
-- 		Order_on_way = p_Order_on_way,
-- 		Cl_order_to_client = p_Cl_order_to_client,
-- 		Deliv_order_status_id = p_Deliv_order_status_id
-- 			where
-- 				ID_Client_order_in_itinerary   = p_ID_Client_order_in_itinerary;
				
-- 	end;
-- $$;

-- create or replace procedure Client_order_in_itinerary_Delete(p_ID_Client_order_in_itinerary Int)
-- language plpgsql
-- as $$
-- 	begin
-- 		delete from Client_order_in_itinerary
-- 				where
-- 					Client_order_in_itinerary_id = p_ID_Client_order_in_itinerary ;

-- 	end;
-- $$;


-- create or replace procedure Request_Insert (p_Request_number Varchar(12), p_Request_date Date, p_Worker_id Int)
-- language plpgsql
-- as $$
-- 	begin
-- 		if (p_Request_date < current_Date) then
-- 			raise notice 'Дата создания учебной группы должна быть в настоящем времени!';
-- 		else
-- 			insert into Request (Request_number, Request_date, Worker_id)
-- 			values (p_Request_number, p_Request_date, p_Worker_id);
-- 		end if;
-- 	end;
-- $$;


-- create or replace procedure Client_order_Insert(
-- 	p_Client_order_number Varchar(19), 
-- 	p_Customer_id Int, 
-- 	p_Client_order_date Date, 
-- 	p_Client_order_time Time,
-- 	 p_Client_order_sum Decimal(10,2), 
-- 	p_Worker_id Int)
-- language plpgsql
-- as $$
-- 	begin
-- 	if (p_Client_order_date = current_Date AND p_Client_order_time = current_Time) then
--      insert into Client_order(Client_order_number, Customer_id, Client_order_date, Client_order_time, Client_order_sum, Worker_id)
-- 		values (p_Client_order_number, p_Customer_id, p_Client_order_date, p_Client_order_time, p_Client_order_sum, p_Worker_id);

-- 		else
-- 				-- 			raise notice 'Дата создания учебной группы должна быть в настоящем времени!';
-- 		end if;
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
-- 	if (p_Receipt_date = current_Date AND p_Receipt_time = current_Time) then
--       insert into Receipt
-- 			(Receipt_number, Client_order_id, Receipt_date, Receipt_time, Receipt_sum, Receipt_change )
-- 		values (p_Receipt_number, p_Client_order_id, p_Receipt_date, p_Receipt_time, p_Receipt_sum, p_Receipt_change);
-- 		else
--  			raise notice 'Дата создания чека должна быть в настоящем времени!';
--    		end if;
		
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
-- 		SELECT EXTRACT(YEAR FROM NOW()) as current_year;
-- 		if EXTRACT(YEAR FROM AGE(current_year, issue_data)) then
-- 			insert into Customer(Customer_surname, Customer_name, Customer_last_name, Passport_series, Passport_number, Issue_data, Customer_phone_number, Credit_card_info, Cusomer_email, Customer_login, Customer_password)
-- 			values (p_Customer_surname, p_Customer_name, p_Customer_last_name, p_Passport_series, p_Passport_number, p_Issue_data, p_Customer_phone_number, p_Credit_card_info, p_Cusomer_email, p_Customer_login, p_Customer_password);
-- 		else
--  			raise notice 'Дата выдачи паспорта, должна иметь разницу относительно текущей даты, не менее 14 лет!';
--    		end if;
-- 	end;
-- $$;

-- create or replace procedure Order_Insert (p_Order_number Varchar(16), p_Supplier_id Int, p_Order_date Date, p_Order_time Time, p_Order_status_id Int, p_Costs Decimal(10,2))
-- language plpgsql
-- as $$
-- 	begin
-- 		if p_Order_date = current_Date AND p_Order_time = current_Time then
-- 		insert into Orders 
-- 			(Order_number, Supplier_id, Order_date, Order_time, Order_status_id, Costs)
-- 			values (p_Order_number, p_Supplier_id, p_Order_date, p_Order_time, p_Order_status_id, p_Costs);
-- 		else
--   			raise notice 'Дата заказа должна быть в настоящем времени!';

-- 		end if;
-- 	end;
-- $$;

-- create or replace procedure Itinerary_Insert ( 
-- 	p_Itinerary_date Date, 
-- 	p_Itinerary_time Time, 
-- 	p_Delivery_man_id Int, 
-- 	p_Car_id Int, 
-- 	p_Overall_status_id Int
-- )
-- language plpgsql
-- as $$
-- 	declare p_New_Number int := count(*)+1 from Itinerary;
-- 	declare p_Year int := SUBSTRING(p_Itinerary_date::text, 3, 2);
-- 	declare p_Symb_Len smallint := length(p_New_Number::text);
-- 	declare p_Loop_Max_Step smallint := 10 - p_Symb_Len;
-- 	declare p_New_Text_Number varchar (21) := '';
-- 	declare p_cl_order_id Int :=  Client_order_id from Client_order_in_itinerary;
-- 	declare p_Form_data date :=  client_order_date from Client_order 
-- 		where id_client_order = p_cl_order_id;
-- 	begin
-- 		for i in 1..p_Loop_Max_Step loop
-- 			p_New_Text_Number := p_New_Text_Number||'0';
-- 		end loop;
-- 		p_New_Text_Number:= 'Д-МЛ-'||p_Year||'-'||p_New_Text_Number||p_New_Number;
-- 		if p_Form_data  - Itinerary_date >0 then
-- 			raise notice 'Дата заказа должна быть в настоящем времени!';
-- 		else
-- 				insert into Itinerary ( Itinerary_number, 
-- 							    Itinerary_date, 
-- 								Itinerary_time, 
-- 								Delivery_man_id, 
-- 								Car_id, 
-- 								Overall_status_id)
-- 		values (p_New_Text_Number, p_Itinerary_date, p_Itinerary_time, p_Delivery_man_id, p_Car_id, 
-- 								p_Overall_status_id);
-- 		end if;
		
-- 	end;
-- $$;



-- create or replace procedure Client_order_in_itinerary_Insert ( p_Itinerary_id Int,
-- 																p_Client_order_id Int,
-- 																p_Packaging_time Time,
-- 																p_Cl_order_to_curier_time Time,
-- 																p_Order_on_way Time,
-- 																p_Cl_order_to_client Time,
-- 																p_Deliv_order_status_id Int )
-- language plpgsql
-- as $$
	
-- 	declare p_Itinerary_time time := Itinerary_time from Itinerary
-- 		where ID_itinerary = p_Itinerary_id;
-- 	begin
-- 	if p_Itinerary_time <= Packaging_time AND p_Itinerary_time <= Cl_order_to_curier_time AND p_Itinerary_time <= Order_on_way AND p_Itinerary_time <= Cl_order_to_client then
-- 		insert into Client_order_in_itinerary (Itinerary_id, Client_order_id, Packaging_time, Cl_order_to_curier_time, Order_on_way, Cl_order_to_client, Deliv_order_status_id)
-- 		values (p_Itinerary_id, p_Client_order_id, p_Packaging_time, p_Cl_order_to_curier_time, p_Order_on_way, p_Cl_order_to_client, p_Deliv_order_status_id);
-- 		else
-- 			raise notice 'Время действия над позицией не может быть раньше даты формирования общего маршрутного листа';
-- 		end if;
-- 	end;
-- $$;
