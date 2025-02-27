--*****PLEASE ENTER YOUR DETAILS BELOW*****
--T3-mns-dm.sql

--Student ID: 34362452
--Student Name: Carl Goodwin
--Unit Code: FIT9132
--Applied Class No: App04

/* Comments for your marker:

Used lookup statements for nurse rather than entering code
Appt length for 3c not provided, default 'S'

*/

--3(a)

DROP SEQUENCE emergency_contact_seq;

DROP SEQUENCE patient_seq; 

DROP SEQUENCE appointment_seq; 

CREATE SEQUENCE emergency_contact_seq START WITH 100 INCREMENT BY 5;

CREATE SEQUENCE patient_seq START WITH 100 INCREMENT BY 5;

CREATE SEQUENCE appointment_seq START WITH 100 INCREMENT BY 5;

--3(b)

INSERT INTO emergency_contact (ec_id, ec_fname, ec_lname, ec_phone)
    VALUES (emergency_contact_seq.NEXTVAL, 'Jonathan', 'Robey', '0412523122'); 

DECLARE 
    jonathan_robey_ec_id NUMBER;

BEGIN 
    SELECT ec_id INTO jonathan_robey_ec_id FROM emergency_contact 
    WHERE ec_fname = 'Jonathan' AND ec_lname = 'Robey';

    INSERT INTO patient (patient_no, patient_fname, patient_lname, patient_street, patient_city, 
    patient_state, patient_postcode, patient_dob, patient_contactmobile, patient_contactemail, ec_id)
    VALUES (patient_seq.NEXTVAL, 'Laura', 'Robey', '50 Collingwood Ave', 'Collingwood', 
    'VIC', '3045', DATE '2015-03-05', '0412523123', 'jrobey10@hotmail.com', jonathan_robey_ec_id);
    
    INSERT INTO patient (patient_no, patient_fname, patient_lname, patient_street, patient_city, 
    patient_state, patient_postcode, patient_dob, patient_contactmobile, patient_contactemail, ec_id)
    VALUES (patient_seq.NEXTVAL, 'Lachlan', 'Robey', '50 Collingwood Ave', 'Collingwood', 
    'VIC', '3045', DATE '2017-02-06', '0412523123', 'jrobey10@hotmail.com', jonathan_robey_ec_id);   
END;
/

DECLARE
    laura_robey_patient_no NUMBER;
    
    lachlan_robey_patient_no NUMBER;
    
    dr_striplin_provider_code CHAR(6);
    
    nrs_ford_nurse_no NUMBER;

BEGIN
    SELECT patient_no INTO laura_robey_patient_no FROM patient 
    WHERE patient_fname = 'Laura' AND patient_lname = 'Robey';
    
    SELECT patient_no INTO lachlan_robey_patient_no FROM patient 
    WHERE patient_fname = 'Lachlan' AND patient_lname = 'Robey';
    
    SELECT provider_code INTO dr_striplin_provider_code FROM provider
    WHERE provider_lname = 'Striplin';

    SELECT nurse_no INTO nrs_ford_nurse_no FROM nurse WHERE nurse_lname = 'Ford';

    INSERT INTO appointment (appt_no, appt_datetime, appt_roomno, appt_length, 
    patient_no, provider_code, nurse_no, appt_prior_apptno)
    VALUES (appointment_seq.NEXTVAL, TO_DATE('2023-09-04 15:30:00', 'YYYY-MM-DD HH24:MI:SS'), 2, 'S', 
    laura_robey_patient_no, dr_striplin_provider_code, nrs_ford_nurse_no, NULL);

    INSERT INTO appointment (appt_no, appt_datetime, appt_roomno, appt_length, patient_no, 
    provider_code, nurse_no, appt_prior_apptno)
    VALUES (appointment_seq.NEXTVAL, TO_DATE('2023-09-04 16:00:00', 'YYYY-MM-DD HH24:MI:SS'), 2, 'S', 
    lachlan_robey_patient_no, dr_striplin_provider_code, nrs_ford_nurse_no, NULL);
END;
/

--3(c)

DECLARE
    lachlan_robey_patient_no NUMBER;
    
    dr_striplin_provider_code CHAR(6);
    
    nrs_katie_nurse_no NUMBER;
    
    prior_appt_no NUMBER;

BEGIN
    SELECT patient_no INTO lachlan_robey_patient_no FROM patient 
    WHERE patient_fname = 'Lachlan' AND patient_lname = 'Robey';
    
    SELECT provider_code INTO dr_striplin_provider_code FROM provider 
    WHERE provider_lname = 'Striplin';

    SELECT nurse_no INTO nrs_katie_nurse_no FROM nurse 
    WHERE nurse_lname = 'Ford';
    
    SELECT MAX(appt_no) INTO prior_appt_no FROM appointment 
    WHERE patient_no = lachlan_robey_patient_no;
    
    INSERT INTO appointment (appt_no, appt_datetime, appt_roomno, appt_length, 
    patient_no, provider_code, nurse_no, appt_prior_apptno)
    VALUES (appointment_seq.NEXTVAL, TO_DATE('2023-09-14 16:00:00', 'YYYY-MM-DD HH24:MI:SS'), 2, 'S', 
    lachlan_robey_patient_no, dr_striplin_provider_code, nrs_katie_nurse_no, prior_appt_no);
END;
/

--3(d)

DECLARE
    lachlan_robey_patient_no NUMBER;
    
    current_appt_no NUMBER;
    
BEGIN
    SELECT patient_no INTO lachlan_robey_patient_no FROM patient 
    WHERE patient_fname = 'Lachlan' AND patient_lname = 'Robey';
    
    SELECT MAX(appt_no) INTO current_appt_no FROM appointment 
    WHERE patient_no = lachlan_robey_patient_no; 
    
    UPDATE appointment SET appt_datetime = TO_DATE('2023-09-18 16:00:00', 'YYYY-MM-DD HH24:MI:SS')
    WHERE appt_no = current_appt_no;
END;
/

--3(e)

DECLARE
    dr_striplin_provider_code CHAR(6);

BEGIN
    SELECT provider_code INTO dr_striplin_provider_code FROM provider 
    WHERE provider_lname = 'Striplin';
    
    DELETE FROM appointment 
    WHERE appt_datetime BETWEEN TO_DATE('2023-09-15', 'YYYY-MM-DD') AND TO_DATE('2023-09-23', 'YYYY-MM-DD') 
    AND provider_code = dr_striplin_provider_code;
END;
/
