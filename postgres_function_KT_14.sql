-- create or replace function Get_Worker_Data (p_Worker_Login text, p_Worker_Password text)
-- returns text
-- language plpgsql
-- as $$
-- 	-- declare p_Worker_id int := id_worker from worker 
-- 	-- 	where worker_login = p_Worker_Login and Worker_Password = p_Worker_Password;
-- 	declare p_Worker text;
-- 	begin
-- 		if (select count(*) from Worker
-- 			where 
-- 		   		worker_login = p_Worker_Login and Worker_Password = p_Worker_Password) = 0 then
-- 			p_Worker := 'Сотрудник не найден!';
-- 		else
-- 			if (select 
-- 					count(client_order_number)
-- 			   from client_order
-- 			   		inner join worker on
-- 					   id_worker = worker_id
-- 			   		where 
-- 			   	      worker_login = p_Worker_Login and Worker_Password = p_Worker_Password) = 0 
-- 						 then
-- 				p_Worker :=  'ФИО: '||worker_surname||' '||worker_name||' '||worker_second_name||', должность: '||position_name||', '||string_agg(DISTINCT request_number, ', ')
-- 				from worker
-- 						inner join position on
-- 							id_position = position_id
-- 						inner join request on
-- 							id_worker = worker_id
-- 						where
-- 							worker_login = p_Worker_Login and Worker_Password = p_Worker_Password
-- 						group by
-- 							worker_surname, worker_name, worker_second_name, position_name;
-- 				-- Иванов Иван Иванович, должность: Старший кассир, ЗяП-00000002, ЗяП-00000003
-- 			else
-- 				p_Worker := 'ФИО: '||worker_surname||' '||worker_name||' '||worker_second_name||', должность: '||position_name||', '||string_agg(DISTINCT client_order_number, ', ')
-- 				from worker
-- 						inner join position on
-- 							id_position = position_id
-- 						inner join client_order on
-- 							id_worker = worker_id
-- 						where
-- 							worker_login = p_Worker_Login and Worker_Password = p_Worker_Password
-- 						group by
-- 							worker_surname, worker_name, worker_second_name, position_name;
-- 			end if;
-- 		end if;
-- 		return p_Worker;
-- 	end;
-- $$;


-- select Get_Worker_Data('wk_IvanovII', 'Pa$$w0rd');
-- select Get_Worker_Data('wk_GlebovGG', 'Pa$$w0rd');
-- select Get_Worker_Data('wk_PavlovPP', 'Pa$$w0rd');
-- select Get_Worker_Data('wk_AlekseevAA', 'Pa$$w0rd');
-- select Get_Worker_Data('wk_FedorovFF', 'Pa$$w0rd');
-- select Get_Worker_Data('User1', 'Password');






-- create or replace function Get_Product_in_Shop(p_Shop_Name text)
-- returns text
-- language plpgsql
-- as $$
-- 	declare p_Products text;
-- 	begin
-- 	if (p_Shop_Name is Null) then
-- 		p_Products := STRING_AGG( article_number||', вид одежды: '||product_type, ',')
-- 		from product
-- 			inner join product_in_shop on
-- 				id_product = product_id
-- 			inner join shop on
-- 				id_shop = shop_id;
-- 	else 
-- 		if (select count(product_id) from product_in_shop
-- 			inner join shop on
-- 				id_shop = shop_id
-- 				where 
-- 					shop_name = p_Shop_Name)=0
-- 			then p_Products := 'Тогровая точка не найдена!';
-- 		else
-- 			p_Products := STRING_AGG( article_number||', вид одежды: '||product_type, ',')
-- 			from product
-- 				inner join product_in_shop on
-- 					id_product = product_id
-- 				inner join shop on
-- 					id_shop = shop_id
-- 					where 
-- 						shop_name = p_Shop_Name;
-- 		end if;
-- 	end if;
-- 		return p_Products;
-- 	end;
-- $$;

-- select Get_Product_in_Shop('FG-01');
-- select Get_Product_in_Shop('FG-02');
-- select Get_Product_in_Shop(Null);
-- select Get_Product_in_Shop('FG-03');








-- create or replace function Get_Itinerary_List(p_Iinerary_number text)
-- returns table (Cl_order_number text, Customer_info text, Actions text, Delivery_man_info text)
-- language plpgsql
-- as $$
-- 	begin
-- 	if (select count(*) from itinerary 
-- 			where itinerary_number = p_Iinerary_number) = 0 then 
-- 		return query select
		
-- 			'Ошибка' as Cl_order_number,
-- 			'Нет данных'as Customer_info,
-- 			'Нет данных' as Actions,
-- 			'Нет данных' as Delivery_man_info;
-- 		else
-- 		return query  select 
-- 						client_order_number::text, 
-- 						customer_surname||' '||customer_name||' '||customer_last_name||', телефон: '||customer_phone_number::text, 
-- 						-- 'Товары заказа собраны, время: '||packaging_time||'; Заказ передан курьеру, время: '||cl_order_to_curier_time||'; Заказ в пути, время: '||order_on_way||'; Заказ передан клиенту, время: '||cl_order_to_client::text,

-- 						case 
-- 	    when cl_order_to_client is null 
-- 	    and (packaging_time is not null or cl_order_to_curier_time is not null or order_on_way is not null)
-- 	    then 'Товары заказа собраны, время: ' || to_char(packaging_time, 'HH24:MI:SS') || 
-- 	         '; Заказа передан курьеру, время: ' || to_char(cl_order_to_curier_time, 'HH24:MI:SS') || 
-- 	         '; Заказа в пути, время: ' || to_char(order_on_way, 'HH24:MI:SS')
-- 	    when packaging_time is null and cl_order_to_curier_time is null and order_on_way is null and cl_order_to_client is null 
-- 	    then 'Нет событий'
-- 	    else 'Товары заказа собраны, время: ' || to_char(packaging_time, 'HH24:MI:SS') || 
-- 	         '; Заказа передан курьеру, время: ' || to_char(cl_order_to_curier_time, 'HH24:MI:SS') || 
-- 	         '; Заказа в пути, время: ' || to_char(order_on_way, 'HH24:MI:SS') || 
-- 	         '; Заказа передан клиенту, время: ' || to_char(cl_order_to_client, 'HH24:MI:SS')
-- 	end,

-- 						delivery_man_surname||' '||delivery_man_name||' '||delivery_man_second_name||',  Телефон: '||delivery_man_phone||', автомобиль: '||car_model||' '||car_number::text
-- 					from itinerary
-- 						inner join client_order_in_itinerary on id_itinerary = itinerary_id
-- 						inner join client_order on id_client_order = client_order_id
-- 						inner join customer on id_customer = customer_id
-- 						inner join delivery_man on id_delivery_man = delivery_man_id
-- 						inner join car on id_car = car_id
-- 						where
-- 							itinerary_number = p_Iinerary_number;
-- 			end if;
-- 	end;
-- $$;

-- select * from Get_Itinerary_List('Д-МЛ-23-0000000001');
-- select * from Get_Itinerary_List('Д-МЛ-23-0000000002');
-- select * from Get_Itinerary_List('Д-МЛ-23-0000000003');
-- select * from Get_Itinerary_List('Д-МЛ-23-0000000004');



-- grant execute on function Get_Itinerary_List to rl_customer;
-- grant execute on function Get_Product_in_Shop  to rl_worker;
-- grant execute on function Get_Worker_Data to rl_administrator;
-- grant execute on function Get_Itinerary_List to rl_administrator;




select 
	routine_name as "Название функции" 
from information_schema.routines
	where 
		routine_type = 'FUNCTION' and routine_schema = 'public'
union all
	select 
		count(specific_name)::text
	from information_schema.routines
		where 
			routine_type = 'FUNCTION' and routine_schema = 'public';

