begin 
insert into service_status_type values(0,'Oil change');
insert into service_status_type values(1,'Tire toration');
commit;
end;
/

declare
 l_car_owner_id car_owner.car_owner_id%TYPE;
 l_car_id car.car_id%TYPE;
 l_service_car_id service_car.service_car_id%TYPE;
begin 
insert into car_owner(first_name,last_name,owner_address_street,owner_address_city,owner_address_zip_code,owner_phone) 
values('alex','last','1234 street','Marietta GA','30066','123456789')
returning car_owner_id into l_car_owner_id;
insert into car(brand,model,vin,car_owner_id,plate_number)
values('Ford','Escape','1234567',l_car_owner_id,'aa23456')
returning car_id into l_car_id;

insert into service_car(start_service,end_service,service_description,car_id)
values('01-AUG-2024','02-AUG-2024','service desc1',l_car_id) 
returning service_car_id into l_service_car_id;

insert into service_detail(service_car_id,item_cost,item_desc)
values(l_service_car_id,'45.00','Oil change');
insert into service_detail(service_car_id,item_cost,item_desc)
values(l_service_car_id,'100.00','Tire toration');
insert into service_status(service_car_id,START_TIME,END_TIME,SERVICE_STATUS_TYPE_ID)
values(l_service_car_id,'01-AUG-2024','02-AUG-2024','0');
insert into service_status(service_car_id,START_TIME,END_TIME,SERVICE_STATUS_TYPE_ID)
values(l_service_car_id,'01-SEP-2024','02-SEP-2024','1');

commit;
end;
/
