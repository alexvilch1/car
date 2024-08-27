create or replace PROCEDURE update_service(v_service_car_id IN NUMBER,
                                        v_start_date IN DATE,
                                        v_end_date IN DATE,
                                        v_service_type IN VARCHAR2,
                                        v_status OUT VARCHAR2 )
AS
 WRONG_DATA exception;
BEGIN
IF v_start_date is NULL or v_end_date is NULL THEN
 raise WRONG_DATA;
END IF;
insert into service_status(service_car_id,START_TIME,END_TIME,SERVICE_STATUS_TYPE_ID)
values(v_service_car_id,v_start_date,v_end_date,v_service_type);
v_status:=0;
EXCEPTION
    WHEN WRONG_DATA THEN
     v_status:=1;
    WHEN OTHERS THEN
        -- Propagate exception
        RAISE;
        v_status:=1;
END;
/
