
-- 1) creating address obj
CREATE TYPE student_address_obj AS OBJECT (
        street VARCHAR2(30),
        city VARCHAR2(20)
);


-- 2) creating student driver obj
CREATE TYPE student_driver_obj AS OBJECT (
        student_id VARCHAR2(6),
        student_name VARCHAR2(40),       
        student_address student_address_obj
);


--3) creating date obj
CREATE TYPE date_obj AS OBJECT (
        day NUMBER(2),
        month VARCHAR2(9),
        year NUMBER(4)
);


--4) creating driving instructor object
CREATE TYPE drivingins_obj AS OBJECT (
        driver_id VARCHAR2(10),
        driver_name VARCHAR2(15)
);


-- 5) creating has_session relation obj

CREATE TYPE hassession_obj AS OBJECT (  
        driver_id REF drivingins_obj,
        student_id REF student_driver_obj,
        sessiondate date_obj
        
);


--6) creating equipment-options object

CREATE TYPE equipment_options_obj AS VARRAY(5) OF VARCHAR2(10);


-- 7)creating vehicle object

CREATE TYPE vehicle_obj AS OBJECT (
        licenseplate varchar2(15),
        model varchar2(7),
        make VARCHAR2(15),
        year Number(4),
        equipment_options equipment_options_obj
)NOT FINAL;


-- 8) creating car object

CREATE TYPE car_obj UNDER vehicle_obj (
        numdoors NUMBER(1));


-- 9) creating truck object

CREATE TYPE truck_obj UNDER vehicle_obj (
        cabin_type varchar2(15),
        weight NUMBER(5));
        

--10) creating has-car relation object

CREATE TYPE has_car_obj AS OBJECT (      
        
        driver_id REF drivingins_obj,
        licenseplate REF vehicle_obj
);


--11) creating has_truck realtion object
CREATE TYPE has_truck_obj AS OBJECT (      
        
        driver_id REF drivingins_obj,
        licenseplate REF vehicle_obj
);



-- DROPPING OBJECTS

DROP TYPE has_truck_obj FORCE;
DROP TYPE has_car_obj FORCE;
DROP TYPE truck_obj FORCE;
DROP TYPE car_obj FORCE;
DROP TYPE vehicle_obj FORCE;
DROP TYPE equipment_options_obj FORCE;
DROP TYPE drivingins_obj FORCE;

DROP TYPE student_driver_obj FORCE;
DROP TYPE student_address_obj FORCE;
DROP TYPE hassession_obj FORCE;
DROP TYPE date_obj FORCE;

-- Creating tables
CREATE TABLE student_table OF student_driver_obj (student_id PRIMARY KEY) OBJECT ID PRIMARY KEY;

CREATE TABLE drivinginst_table OF drivingins_obj (driver_id PRIMARY KEY) OBJECT ID PRIMARY KEY;

CREATE TABLE hassession_table OF hassession_obj (FOREIGN KEY(driver_id) REFERENCES drivinginst_table ON DELETE CASCADE, FOREIGN KEY (student_id) REFERENCES student_table ON DELETE CASCADE);


CREATE TABLE car_table OF car_obj (licenseplate PRIMARY KEY) OBJECT ID PRIMARY KEY;

CREATE TABLE truck_table OF truck_obj (licenseplate PRIMARY KEY) OBJECT ID PRIMARY KEY;

CREATE TABLE has_car_table OF has_car_obj (FOREIGN KEY(driver_id) REFERENCES drivinginst_table ON DELETE CASCADE, FOREIGN KEY (licenseplate) REFERENCES car_table ON DELETE CASCADE);

CREATE TABLE has_truck_table OF has_truck_obj (FOREIGN KEY(driver_id) REFERENCES drivinginst_table ON DELETE CASCADE, FOREIGN KEY (licenseplate) REFERENCES truck_table ON DELETE CASCADE);


drop table has_truck_table;
drop table has_car_table;
drop table truck_table;
drop table car_table;
drop table hassession_table;
drop table drivinginst_table;
drop table student_table;



