-- Queries


--1) Insert a car or a truck. 

INSERT INTO car_table VALUES ('00001','model1','make1',2000,equipment_options_obj('option1','option2','option3'),4);

INSERT INTO truck_table VALUES ('00002','model2','make2',2000,equipment_options_obj('option1','option2','option3'),'cabin1',40);

select * from car_table;

delete from car_table

select * from truck_table;

-- 2) 2. Insert a driving instructor with a particular car or a particular truck

INSERT INTO drivinginst_table VALUES ('d1','abc');
INSERT INTO drivinginst_table VALUES ('d2','def');

select * from drivinginst_table;

delete from drivinginst_table where driver_id in ('d4','d5')

-- inserting into has_car_table



INSERT INTO has_car_table SELECT REF (D), REF (C) FROM drivinginst_table D, car_table C WHERE D.driver_id='1' AND C.licenseplate='00001';

select * from has_car_table

INSERT INTO has_truck_table SELECT REF (D), REF (C) FROM drivinginst_table D, truck_table C WHERE D.driver_id='2' AND C.licenseplate='00002';

select * from has_truck_table

-- query 3 ) Insert a student driver that had a session with a particular driving instructor. 

INSERT INTO student_table VALUES ('s1','shiva',student_address_obj('street1','city1'));

INSERT INTO student_table VALUES ('s2','rama',student_address_obj('street2','city2'));



INSERT INTO hassession_table SELECT hassession_obj ( REF (D), REF (S), date_obj(1,'Jan', 2000)) FROM drivinginst_table D, student_table S 
WHERE D.driver_id='1' AND S.student_id='s1';

INSERT INTO hassession_table SELECT hassession_obj ( REF (D), REF (S), date_obj(2,'Jan', 2000)) FROM drivinginst_table D, student_table S 
WHERE D.driver_id='2' AND S.student_id='s2';

select * from hassession_table

-- query 4) Find all student drivers living in a given city

select * from student_table



SELECT S.student_id, S.student_name FROM student_table S WHERE (S.student_address.city='city3')

-- query5) Find the IDs of the student drivers who had a session with a particular driving instructor.



select S.student_id from student_table S where REF(S) in
(SELECT H.student_id FROM hassession_table H where H.driver_id in (Select REF(D) from drivinginst_table D WHERE D.driver_id='d1'))



-- query6) List the names, IDs and addresses of all the student drivers who had a session on a particular date in a 2-door Honda Civic

select * from hassession_table

select * from has_car_table

select * from car_table



select S.student_id, S.student_name, S.student_address.street,S.student_address.city from student_table S where REF(S) in
(select student_id from hassession_table H where H.driver_id in 
(select driver_id from has_car_table where licenseplate in 
(select REF(c) from car_table c where c.model='model2' and c.make='make2' and c.numdoors=2)));


-- query7) Display the license plates, models, makes and years of all the cars that are equipped with a particular equipment option. 


select C.licenseplate, C.model,C.make,C.year from car_table C where ('option1') in(SELECT * FROM  table(C.EQUIPMENT_OPTIONS))



-- query 8)  List the names of all driving instructors who have trucks that weigh more than a particular number of pounds. 

select D.driver_name from drivinginst_table D where REF(D) in(select driver_id from has_truck_table where licenseplate in (select REF(t) from truck_table t where t.weight>40));


-- query 9) Delete all the cars that have four doors


DELETE FROM has_car_table where licenseplate in ( select REF(C) from car_table C WHERE C.numdoors=4) 

DELETE FROM car_table C WHERE C.numdoors=4;
