--*****PLEASE ENTER YOUR DETAILS BELOW*****
--T4-mns-alter.sql

--Student ID: 34362452
--Student Name: Carl Goodwin
--Unit Code: FIT9132
--Applied Class No: App04

/* Comments for your marker:

Create junction table to represent many-to-many relationship
Desc patient 4a, 4b to reflect changes to the patient table
Wanted to stick to similar naming conventions for attributes, 
but also plan for potential provider training (ptrain) entity

*/

--4(a)

ALTER TABLE patient ADD appt_total NUMERIC(3);

COMMENT ON COLUMN patient.appt_total IS
    'Total number of appointments for each patient';

UPDATE patient pat SET appt_total = (SELECT COUNT(appt_no)
    FROM appointment appt WHERE appt.patient_no = pat.patient_no);

DESC patient;

--4(b)

DROP TABLE patient_ec CASCADE CONSTRAINTS;

CREATE TABLE patient_ec (
    patient_no NUMERIC(4) NOT NULL,
    ec_id NUMERIC(4) NOT NULL
    );
    
COMMENT ON COLUMN patient_ec.patient_no IS
    'Patient identifier';
    
COMMENT ON COLUMN patient_ec.ec_id IS
    'Emergency contact identifier';
    
ALTER TABLE patient_ec ADD CONSTRAINT patient_ec_pk PRIMARY KEY ( patient_no, ec_id );

ALTER TABLE patient_ec ADD CONSTRAINT patient_ec_patient_no_fk 
    FOREIGN KEY ( patient_no ) REFERENCES patient ( patient_no );
    
ALTER TABLE patient_ec ADD CONSTRAINT patient_ec_ec_id_fk 
    FOREIGN KEY ( ec_id ) REFERENCES emergency_contact ( ec_id );
        
INSERT INTO patient_ec ( patient_no, ec_id ) 
    SELECT patient_no, ec_id FROM patient;

ALTER TABLE patient DROP COLUMN ec_id;

COMMIT;

DESC patient;

--4(c)

DROP TABLE nurse_training CASCADE CONSTRAINTS;

CREATE TABLE nurse_training (
    nurse_no NUMERIC(3) NOT NULL,
    nurse_trainer_no NUMERIC(3) NOT NULL,
    ntraining_start DATE NOT NULL,
    ntraining_end DATE NOT NULL,
    ntraining_desc VARCHAR(80)
    );
    
COMMENT ON COLUMN nurse_training.nurse_no IS
    'Nurse trainee identifier';
    
COMMENT ON COLUMN nurse_training.nurse_trainer_no IS
    'Nurse trainer identifier';
    
COMMENT ON COLUMN nurse_training.ntraining_start IS
    'Date and time nurse training started';
    
COMMENT ON COLUMN nurse_training.ntraining_end IS
    'Date and time nurse training ended';
    
COMMENT ON COLUMN nurse_training.ntraining_desc IS
    'Description of training';
    
ALTER TABLE nurse_training ADD CONSTRAINT nurse_training_pk 
    PRIMARY KEY (nurse_no, ntraining_start);

ALTER TABLE nurse_training ADD CONSTRAINT nurse_nurse_fk 
    FOREIGN KEY (nurse_no) REFERENCES nurse (nurse_no);

ALTER TABLE nurse_training ADD CONSTRAINT nurse_nurse_trainer_fk 
    FOREIGN KEY (nurse_trainer_no) REFERENCES nurse (nurse_no);
        
ALTER TABLE nurse_training ADD CONSTRAINT unique_nurse_trainer_ntraining_start 
    UNIQUE (nurse_trainer_no, ntraining_start);
      
COMMIT;

DESC nurse_training;