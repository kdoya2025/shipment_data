select*
from shipment
limit 10;
create table staging_shipment like shipment;
select*
from staging_shipment
limit 10;

insert into staging_shipment
select*
from shipment;
-- 1 remouving duplicates

select *,row_number() over(partition by date ,type,product_category,
origin,destination,value,freight_cost,delivery_status) as row_num
from staging_shipment;

with sataging as(select *,row_number() over(partition by date ,type,product_category,
origin,destination,value,freight_cost,delivery_status) as row_num
from staging_shipment)
select*
from sataging
where row_num>1;
-- there is no duplicates
-- 2 standardize 
select *
from staging_shipment;
-- standardizing country ,destination,d_country,O_Country,Origin
select distinct  origin
from staging_shipment
order by origin asc;


select distinct  O_Country
from staging_shipment
order by O_Country asc;

select distinct  destination
from staging_shipment
order by destination asc;

select distinct  D_Country
from staging_shipment
order by D_Country asc;

update staging_shipment
set O_Country=trim(O_Country),
origin=trim(origin), destination=trim(destination),
D_Country=trim(D_Country);

-- standardizing product_category, type,delivery_status,
select*
from staging_shipment;

select distinct product_category
from staging_shipment
order by product_category asc;

select distinct type
from staging_shipment
order by type asc;

select distinct delivery_status
from staging_shipment
order by delivery_status asc;

update staging_shipment
set  delivery_status=trim( delivery_status),
	type=trim(type),product_category=trim(product_category);
    
-- standardizing date

select date ,str_to_date(date,'%Y-%m-%d')
from staging_shipment;

update staging_shipment
set date=str_to_date(date,'%Y-%m-%d');

-- 3- handle null values

select *
from staging_shipment
 where customs_clearance_time_days is null or customs_clearance_time_days='';

select *
from staging_shipment
 where date is null or date='';
 
 select *
from staging_shipment
 where freight_cost is null or freight_cost='';
 
  select *
from staging_shipment
 where value is null or value='';
 -- there no null values
 
 select * 


