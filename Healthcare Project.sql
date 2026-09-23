create database hospital_management;
use  hospital_management;

SELECT * FROM patients;

#give me total number of patients.
select count(*) as total_patients from patients;

#give me 1st 10 patients.
select * from patients limit 10;

##give me 2nd patient details.
select * from patients limit 1 offset 1;

 ## how many patients registered in last 30 days.
select * 
from patients
where registration_date >= (select max(registration_date) - interval 30 day from patients)
order by registration_date desc;

SELECT * FROM doctors;

#give me total number of doctors.
select count(*) as total_doctors from doctors;

select distinct specialization from doctors;

select concat(first_name,' ',last_name) as doctor_name,
specialization, years_experience
from doctors
order by years_experience desc;

select first_name from doctors
where first_name like '%is';

## `phone number  ` need to  be used for column without underscore
## e.g select distinct(`phone number`) from doctors_1;

SELECT * FROM appointments;

#total no of appointments
select count(*) from appointments;

## what is appointment status distribution
select status, count(*) 
from appointments
group by status;

##appointment status more than 50
select status, count(*)
from appointments
group by status
having  count(*) > 50;

##find all appoitments in last 7days

select * from appointments
where appointment_date >= (select max(appointment_date) - interval 7 day from appointments)
order by appointment_date desc;

##find date wise count of status
select appointment_date, status, count(*)
from appointments
group by appointment_date,status
order by appointment_date desc;

select * from treatments;

select count(*) from treatments;

##most common treatment type
select treatment_type, count(*) as treatment_count
from treatments
group by treatment_type
order by treatment_count desc;

##find min ,max and avg cost of treatment
select max(cost) as max_cost, min(cost) as min_cost, avg(cost) as avg_cost from treatments;

## roundoff to single digit
select round(max(cost), 1) as max_cost, round(min(cost), 1) as min_cost, round(avg(cost), 1) as avg_cost from treatments;

##anotherway using cast
select cast(cost as signed) from treatments;

select * from billing;

select count(*) from billing;

## payment status distribution
select  payment_status, count(*) as bill_count
from billing
group by payment_status;

-- lect 3  

SELECT * FROM patients;

#give me total number of patients.
select count(*) as total_patients from patients;

 select * from appointments;
 select count(*) as total_appointments from appointments;

-- Appointment status that indicate patient disengagement risk?

select status, count(*) as appointment_count
from appointments
group by status;
-- No show and cancelled> completed,scheduled i.e high disengagement

-- 

with patient_status_summary as(
select p.patient_id,
p._first_name,p.last_name,
count(a.appointment_id) as total_appointments,
sum( case when a.status = 'No-Show' Then 1 else 0 end)* 100.0
/count (a.appointment_id),2
)as no_show_rate
from patient p join appointments on p.patient_id = a.patient_id
group by  p.patient_id, p._first_name,p.last_name)
select * from patient_status_summary
where total_appoitnments >=3
and no_show_rate>=40
order by no_show_rate, no_show_rate desc;


-- are there treatment with unusual high cost that require review. (>1.5 s.d)
select treatment_id,
treatment_type,
cost
from treatments
where cost > (select avg(cost) + 1.5 *stddev(cost) from treatments);

-- rank doctors by total appointments.
select * from doctors;
select * from appointments;

select d.doctor_id, d.first_name as doctor_name, d.specialization , a.doctor_id, count(a.appointment_id) as total_appointments
from doctors d join appointments a on d.doctor_id = a.doctor_id
group by d.doctor_id, doctor_name,d.specialization
order by total_appointments desc limit 5;

-- rank patient by total spending
select p.patient_id, p.first_name as patient_name,
sum(b.amount) as total_spent,
rank() over (order by sum(b.amount) desc) as spending_rank
from patient p
join billing b on p.patient_id = b.patient_id
where b.payment_status='Paid'
group by p.patient_id, patient_name;

-- Monthly appointment trend 
select 
year(appointment_date) as year,
month (appointment_date) as month,
count(*) as appointment_count
from appointments
group by year, month
order by year, month;

-- Appointments by day of week
select dayname(appointment_date) as day_of_week,
count(*) as appointment_count
from appointments
group by day_of_week;

-- Monthly revenue trend
select 
year(bill_date) as year,
month (bill_date) as month,
sum(amount) as total_revenue
from billing
where payment_status ='paid'
group by year, month
order by year, month;

-- appointment sequence per patient
select patient_id, appointment_id, appointment_date,
row_number() over(partition by patient_id order by appointment_date) as visit_number
from appointments;

-- what is the gap between patient visit

select patient_id, appointment_id, appointment_date,
datediff( appointment_date, lag(appointment_date) over (partition by patient_id order by appointment_date)) as days_between_visits
from appointments;


 







 




 




