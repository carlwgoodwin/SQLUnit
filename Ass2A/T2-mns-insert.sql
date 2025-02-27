--*****PLEASE ENTER YOUR DETAILS BELOW*****
--T2-mns-insert.sql

--Student ID: 34362452
--Student Name: Carl Goodwin
--Unit Code: FIT9132
--Applied Class No: App04

/* Comments for your marker:

--

*/

--------------------------------------
--INSERT INTO emergency_contact
--------------------------------------

INSERT INTO emergency_contact (ec_id, ec_fname, ec_lname, ec_phone) VALUES (1, 'Glen', 'Hinchliffe', '0412345678');

INSERT INTO emergency_contact (ec_id, ec_fname, ec_lname, ec_phone) VALUES (2, 'James', 'Lewis', '0412345679');

INSERT INTO emergency_contact (ec_id, ec_fname, ec_lname, ec_phone) VALUES (3, 'Kyle', 'Jacobs', '0412345680');

INSERT INTO emergency_contact (ec_id, ec_fname, ec_lname, ec_phone) VALUES (4, 'Sam', 'Devin', '0412345681');

INSERT INTO emergency_contact (ec_id, ec_fname, ec_lname, ec_phone) VALUES (5, 'Jake', 'Bigsley', '0412345682');

--------------------------------------
--INSERT INTO patient
--------------------------------------

INSERT INTO patient (patient_no, patient_fname, patient_lname, patient_street, patient_city, 
    patient_state, patient_postcode, patient_dob, patient_contactmobile, patient_contactemail, ec_id)
    VALUES (1, 'Olivia', 'Smith', '50 Sydney Ave', 'Sydney', 'NSW', '3456', DATE '2000-04-15', '0401234567', 'oliviasmith@gmail.com', 1);

INSERT INTO patient (patient_no, patient_fname, patient_lname, patient_street, patient_city, 
    patient_state, patient_postcode, patient_dob, patient_contactmobile, patient_contactemail, ec_id)
    VALUES (2, 'Jenny', 'Goodwin', '50 Brisbane Ave', 'Brisbane', 'QLD', '4069', DATE '2001-04-14', '0401234568', 'jennygoodwin@hotmail.com', 2);
    
INSERT INTO patient (patient_no, patient_fname, patient_lname, patient_street, patient_city, 
    patient_state, patient_postcode, patient_dob, patient_contactmobile, patient_contactemail, ec_id)
    VALUES (3, 'Craig', 'Bonsley', '50 Melbourne Ave', 'Melbourne', 'VIC', '3178', DATE '1998-05-05', '0401234569', 'craigbonsley@yahoo.com', 3);
    
INSERT INTO patient (patient_no, patient_fname, patient_lname, patient_street, patient_city, 
    patient_state, patient_postcode, patient_dob, patient_contactmobile, patient_contactemail, ec_id)
    VALUES (4, 'Alphonso', 'Pierre', '50 Darwin Ave', 'Darwin', 'NT', '3001', DATE '1996-07-07', '0401234570', 'aplphonso@bigpong.com', 4);
    
INSERT INTO patient (patient_no, patient_fname, patient_lname, patient_street, patient_city, 
    patient_state, patient_postcode, patient_dob, patient_contactmobile, patient_contactemail, ec_id)
    VALUES (5, 'Bob', 'Jones', '50 Canberra Ave', 'Canberra', 'ACT', '3002', DATE '1994-03-28', '0401234571', 'bobbyj@gmail.com', 5);
    
INSERT INTO patient (patient_no, patient_fname, patient_lname, patient_street, patient_city, 
    patient_state, patient_postcode, patient_dob, patient_contactmobile, patient_contactemail, ec_id)
    VALUES (6, 'Jordan', 'Wesley', '50 Hobart Ave', 'Tasmania', 'TAS', '3003', DATE '2010-06-28', '0401234572', 'jweas@bigpond.net', 1);
    
INSERT INTO patient (patient_no, patient_fname, patient_lname, patient_street, patient_city, 
    patient_state, patient_postcode, patient_dob, patient_contactmobile, patient_contactemail, ec_id)
    VALUES (7, 'Will', 'Pilkington', '50 Perth Ave', 'Perth', 'WA', '3004', DATE '2010-03-05', '0401234573', 'will_pilks10@hotmail.com', 2);
    
INSERT INTO patient (patient_no, patient_fname, patient_lname, patient_street, patient_city, 
    patient_state, patient_postcode, patient_dob, patient_contactmobile, patient_contactemail, ec_id)
    VALUES (8, 'Joe', 'Kensington', '50 Adelaide Ave', 'Adelaide', 'SA', '3005', DATE '2011-06-19', '0401234574', 'kenno_j@gmail.com', 3);
    
INSERT INTO patient (patient_no, patient_fname, patient_lname, patient_street, patient_city, 
    patient_state, patient_postcode, patient_dob, patient_contactmobile, patient_contactemail, ec_id)
    VALUES (9, 'Rose', 'Kelly', '50 Toorak Ave', 'Toorak', 'VIC', '3006', DATE '2012-07-13', '0401234575', 'r.kelly@bigpond.net', 4);
    
INSERT INTO patient (patient_no, patient_fname, patient_lname, patient_street, patient_city, 
    patient_state, patient_postcode, patient_dob, patient_contactmobile, patient_contactemail, ec_id)
    VALUES (10, 'Charlie', 'Morgan', '50 Fitzroy Ave', 'Fitzroy', 'VIC', '3007', DATE '2013-02-15', '0401234576', 'cptmoogoo@yahoo.com', 5);
    
--------------------------------------
--INSERT INTO appointment
--------------------------------------

INSERT INTO appointment (appt_no, appt_datetime, appt_roomno, appt_length, patient_no, 
    provider_code, nurse_no, appt_prior_apptno)
    VALUES (1, TO_DATE('2023-08-27 9:30:00', 'YYYY-MM-DD HH24:MI:SS'), 1, 'S', 1, 'END001', 1, NULL);

INSERT INTO appointment (appt_no, appt_datetime, appt_roomno, appt_length, patient_no, 
    provider_code, nurse_no, appt_prior_apptno)
    VALUES (2, TO_DATE('2023-08-27 9:30:00', 'YYYY-MM-DD HH24:MI:SS'), 2, 'T', 2, 'GEN001', 2, NULL);

INSERT INTO appointment (appt_no, appt_datetime, appt_roomno, appt_length, patient_no, 
    provider_code, nurse_no, appt_prior_apptno)
    VALUES (3, TO_DATE('2023-08-27 11:00:00', 'YYYY-MM-DD HH24:MI:SS'), 3, 'L', 2, 'GEN002', 3, 2);

INSERT INTO appointment (appt_no, appt_datetime, appt_roomno, appt_length, patient_no, 
    provider_code, nurse_no, appt_prior_apptno)
    VALUES (4, TO_DATE('2023-08-27 12:30:00', 'YYYY-MM-DD HH24:MI:SS'), 11, 'S', 1, 'GEN003', 4, 1);

INSERT INTO appointment (appt_no, appt_datetime, appt_roomno, appt_length, patient_no, 
    provider_code, nurse_no, appt_prior_apptno)
    VALUES (5, TO_DATE('2023-08-27 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), 5, 'T', 2, 'ORS001', 5, 3);

INSERT INTO appointment (appt_no, appt_datetime, appt_roomno, appt_length, patient_no, 
    provider_code, nurse_no, appt_prior_apptno)
    VALUES (6, TO_DATE('2023-08-26 9:30:00', 'YYYY-MM-DD HH24:MI:SS'), 1, 'L', 3, 'END001', 1, NULL);

INSERT INTO appointment (appt_no, appt_datetime, appt_roomno, appt_length, patient_no, 
    provider_code, nurse_no, appt_prior_apptno)
    VALUES (7, TO_DATE('2023-08-26 9:30:00', 'YYYY-MM-DD HH24:MI:SS'), 2, 'S', 4, 'GEN001', 2, NULL);

INSERT INTO appointment (appt_no, appt_datetime, appt_roomno, appt_length, patient_no, 
    provider_code, nurse_no, appt_prior_apptno)
    VALUES (8, TO_DATE('2023-08-26 11:30:00', 'YYYY-MM-DD HH24:MI:SS'), 3, 'T', 5, 'GEN002', 3, NULL);

INSERT INTO appointment (appt_no, appt_datetime, appt_roomno, appt_length, patient_no, 
    provider_code, nurse_no, appt_prior_apptno)
    VALUES (9, TO_DATE('2023-08-26 12:30:00', 'YYYY-MM-DD HH24:MI:SS'), 4, 'L', 1, 'GEN003', 4, NULL);

INSERT INTO appointment (appt_no, appt_datetime, appt_roomno, appt_length, patient_no, 
    provider_code, nurse_no, appt_prior_apptno)
    VALUES (10, TO_DATE('2023-08-26 15:00:00', 'YYYY-MM-DD HH24:MI:SS'), 5, 'S', 2, 'ORS001', 5, NULL);

INSERT INTO appointment (appt_no, appt_datetime, appt_roomno, appt_length, patient_no, 
    provider_code, nurse_no, appt_prior_apptno)
    VALUES (11, TO_DATE('2023-08-25 9:30:00', 'YYYY-MM-DD HH24:MI:SS'), 1, 'T', 3, 'END001', 1, NULL);

INSERT INTO appointment (appt_no, appt_datetime, appt_roomno, appt_length, patient_no, 
    provider_code, nurse_no, appt_prior_apptno)
    VALUES (12, TO_DATE('2023-08-25 10:30:00', 'YYYY-MM-DD HH24:MI:SS'), 2, 'L', 4, 'GEN001', 2, NULL);

INSERT INTO appointment (appt_no, appt_datetime, appt_roomno, appt_length, patient_no, 
    provider_code, nurse_no, appt_prior_apptno)
    VALUES (13, TO_DATE('2023-08-25 10:30:00', 'YYYY-MM-DD HH24:MI:SS'), 3, 'S', 5, 'GEN002', 3, NULL);

INSERT INTO appointment (appt_no, appt_datetime, appt_roomno, appt_length, patient_no, 
    provider_code, nurse_no, appt_prior_apptno)
    VALUES (14, TO_DATE('2023-08-25 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 4, 'T', 1, 'GEN003', 4, NULL);

INSERT INTO appointment (appt_no, appt_datetime, appt_roomno, appt_length, patient_no, 
    provider_code, nurse_no, appt_prior_apptno)
    VALUES (15, TO_DATE('2023-08-25 14:30:00', 'YYYY-MM-DD HH24:MI:SS'), 5, 'L', 2, 'ORS001', 5, NULL);
    