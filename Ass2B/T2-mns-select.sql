--*****PLEASE ENTER YOUR DETAILS BELOW*****
--T2-mns-select.sql

--Student ID: 34362452
--Student Name: Carl Goodwin
--Unit Code: KNB9132
--Applied Class No: App_04

/* Comments for your marker:

For 2g couldn't check whether '-' replacement was working as no results had 0 or null. 
Tried similar query with 2d to test but would still display just dollar sign not dash.
Think something to do with LPAD or || concatenation. Tried putting '$99,999.99 
in TO_CHAR function but got errors. 


*/

/*2(a)*/

SELECT item_id, item_desc, item_stdcost, item_stock FROM mns.item 
WHERE item_stock > 49 AND item_desc LIKE '%composite%'
ORDER BY item_stock DESC, item_id;


/*2(b)*/

SELECT p.provider_code, 
CASE WHEN p.provider_fname IS NOT NULL THEN p.provider_title || ' ' || p.provider_fname || ' ' 
ELSE p.provider_title || ' ' END || p.provider_lname AS pprovider_fullname 
FROM mns.provider p JOIN mns.specialisation s ON p.spec_id = s.spec_id 
WHERE UPPER(s.spec_name) = 'PAEDIATRIC DENTISTRY'
ORDER BY p.provider_lname, p.provider_fname, p.provider_code;


/*2(c)*/

SELECT service_code, service_desc, LPAD('$' || TO_CHAR(service_stdfee, '9999.99'), 50) AS service_stdfee_format 
FROM mns.service WHERE service_stdfee > (SELECT AVG(service_stdfee) FROM mns.service)
ORDER BY service_stdfee DESC, service_code;


/*2(d)*/

SELECT a.appt_no, a.appt_datetime, a.patient_no, 
CASE WHEN p.patient_fname IS NOT NULL THEN p.patient_fname || ' ' 
ELSE '' END || p.patient_lname AS patient_fullname, 
LPAD('$' || TO_CHAR(s.apptserv_fee + s.apptserv_itemcost, '99999.99'), 30) AS appt_serv_total 
FROM mns.appointment a JOIN mns.patient p ON a.patient_no = p.patient_no
JOIN mns.appt_serv s ON a.appt_no = s.appt_no
ORDER BY appt_serv_total DESC, a.appt_no;


/*2(e)*/

SELECT s.service_code, s.service_desc, '$' || TO_CHAR(s.service_stdfee, '9999.99') AS service_stdfee_format, 
TO_CHAR(AVG(a.apptserv_fee) - s.service_stdfee, '9999.99') AS service_feediff
FROM mns.service s JOIN mns.appt_serv a ON s.service_code = a.service_code
GROUP BY s.service_code, s.service_desc, s.service_stdfee ORDER BY s.service_code;


/*2(f)*/

SELECT p.patient_no, CASE WHEN p.patient_fname IS NOT NULL THEN p.patient_fname || ' ' 
ELSE '' END || p.patient_lname AS patientname, 
FLOOR(MONTHS_BETWEEN(SYSDATE, p.patient_dob) / 12) AS current_age, COUNT(a.appt_no) AS numappts,
TO_CHAR(SUM(CASE WHEN a.appt_prior_apptno IS NOT NULL THEN 1 ELSE 0 END) / COUNT(a.appt_no) * 100, '999.99') || '%' AS followups
FROM mns.patient p JOIN mns.appointment a ON p.patient_no = a.patient_no
GROUP BY p.patient_no, p.patient_fname, p.patient_lname, p.patient_dob ORDER BY p.patient_no;


/*2(g)*/

SELECT p.provider_code AS pcode, COUNT(a.appt_no) AS numberappts, 
CASE WHEN SUM(s.apptserv_fee + s.apptserv_itemcost) = 0 THEN '-' 
ELSE LPAD('$' || TO_CHAR(SUM(s.apptserv_fee + s.apptserv_itemcost), '9,999.99'), 30) END AS totalfees,
CASE WHEN SUM(i.as_item_quantity) = 0 THEN '-' ELSE TO_CHAR(SUM(i.as_item_quantity)) END AS noitems
FROM mns.provider p JOIN mns.appointment a ON p.provider_code = a.provider_code
JOIN mns.appt_serv s ON a.appt_no = s.appt_no JOIN mns.apptservice_item i ON a.appt_no = i.appt_no
WHERE a.appt_datetime >= '10/SEP/2023' AND a.appt_datetime <= '14/SEP/2023'
GROUP BY p.provider_code ORDER BY p.provider_code;

