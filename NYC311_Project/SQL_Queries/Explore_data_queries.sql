use SQLPractice;

select
	distinct complaint_type
from NYC311data;

select
	distinct location_type
from NYC311data;

select
	location_type, count(*) as num_of_complaints
from NYC311data
group by location_type
order by num_of_complaints desc;

select
	Complaint_Type, count(*) as num_of_complaints
from NYC311data
group by Complaint_Type
order by num_of_complaints desc;

select
	complaint_type, count(*) as cnt
from NYC311data
where location_type = 'Street/Sidewalk'
group by complaint_type
order by cnt desc;


exec location_type_wise_complaints;


select created_date, DATEPART(MONTH, Created_Date) from NYC311data order by Created_Date desc;

select
	city, Complaint_Type, AVG(cast(Request_Closing_Time as bigint)) as avg_closing_time
from NYC311data
where city is not null
group by city, Complaint_Type
order by avg_closing_time desc;

select status, count(*) as cnt
from NYC311data
where closed_Date is not null and city is not null and location is not null and Location_Type is not null
group by status
order by cnt desc;

select Agency_Name, count(*) as cnt
from NYC311data
group by Agency_Name
order by cnt desc;