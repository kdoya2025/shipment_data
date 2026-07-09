select *
from  staging_shipment
limit 10 ;
-- total shipment by type
select type,count(*) as Total_shimpment
from staging_shipment
group by type;

-- total shipment
select sum(Total_shimpment) as total_shipment
from(select type,count(*) as Total_shimpment
from staging_shipment
group by type) as total_shipment;

-- the total shipement is  704 shipment with 340 export and 364 , there importing much than they are exporting

-- shipment by product

select product_category,type,count(*) as total_shipment
from staging_shipment
group by product_category,type
order by product_category, type,total_shipment asc;

select max(total_shipment) as top
from(select product_category,type,count(*) as total_shipment
from staging_shipment
where type='Export'
group by product_category,type
order by product_category, type asc
) as the_top_Product_export;


select min(total_shipment) as bottom
from(select product_category,type,count(*) as total_shipment
from staging_shipment
where type='Export'
group by product_category,type
order by product_category, type asc
) as the_top_Product_export;

select product_category,type,count(*) as total_shipment
from staging_shipment
where type='Export'
group by product_category,type
order by product_category, type,total_shipment asc;

-- consumer goods and Electronics are the top product exported (98 export)
-- the second top product is Industrial Equipment with only 4 less than consumer goods and Electronics
-- the least product exported is Textiles

select year(date),type,count(*) as total_shipment_by_year
from staging_shipment
group by year(date),type
order by year(date), type,total_shipment_by_year asc;

-- 2024 their total shipment in exporte was 170 and import was 182(import was beating export)
-- in 2025 their total shipment in export was 170,and  import was 182 (import was beating export)

select year(date),count(*) as total_shipment_by_year
from staging_shipment
group by year(date)
order by year(date),total_shipment_by_year asc;
-- we have the same total shipment in 2024 and 2025

select * 
from staging_shipment;

select D_Country,type,count(*) as total_shipment
from staging_shipment
where type='Import'
group by D_Country,type
order by D_Country,type asc;
-- India is the country which is importing total import 364



select O_Country,type,count(*) as total_shipment
from staging_shipment
where type='Export'
group by O_Country,type
order by O_Country,type asc;
-- India is thr only country which is exporting 340

select D_Country,type,count(*) as total_shipment
from staging_shipment
where type='Export'
group by D_Country,type
order by total_shipment desc;
-- india top exporting country  from India  is USA with 74 shipment 
-- follow by UK  with 26  shipment
-- others country with 24   shipment

select O_Country,type,count(*) as total_shipment
from staging_shipment
where type='import'
group by O_Country,type
order by total_shipment desc;

-- south korea is the country where India is importing the most(48 importing shipment) 
-- follow by china(26 importing shipment) and gemernay(26 importing shipment)
-- for oyher country with 24 importing shipment
select*
from staging_shipment;

select product_category,type,count(*)  as total
 from staging_shipment
 where type='Import'
 group by product_category,type
 order by total desc;
 -- India was  importing 'Industrial Equipment'(98 import shipment) the most 
 -- follow by consumer goods and 'Electronics' (96 import shipment)
 -- the least was textiles (74) import shipment
 select product_category,type,count(*)  as total
 from staging_shipment
 where type='Export'
 group by product_category,type
 order by total desc;

-- India was  exporting 'Electronics','Consumer Goods'(98 export shipment) the most 
 -- follow by 'Textiles' (96 export shipment)
 -- the least was 'Industrial Equipment' (48 export shipment)
 
 
 select*
from staging_shipment;
 
 select product_category,delivery_status,count(*)  as total,
 sum(count(*) )over (partition by product_category ) as total_shipment_by_category,
 (count(*)/sum(count(*) )over (partition by product_category ))*100 as delivery_ratio
 from staging_shipment
 where type='Export'
 group by product_category,delivery_status
 order by total desc;
-- Electronics: 89.79% export shipment arrived on time and 10.20% was delayed
-- Consumer Goods: 81.63% export shipment arrived on time and  18,36% was delayed
-- Textiles: 83.33% export shipment arrived on time and 16.66% was delayed
-- Industrial Equipment: 87.50% export shipment arrived on time and 12.50 was delayed

 select product_category,delivery_status,count(*)  as total,
 sum(count(*) )over (partition by product_category ) as total_shipment_by_category,
 (count(*)/sum(count(*) )over (partition by product_category ))*100 as delivery_ratio
 from staging_shipment
 where type='Import'
 group by product_category,delivery_status
 order by total desc;
 -- Electronics: 83.33% import shipment arrived on time and 16.66% was delayed
-- Consumer Goods: 83.33% import shipment arrived on time and  18,36% was delayed
-- Textiles: 83.78% import shipment arrived on time and 16.21% was delayed
-- Industrial Equipment: 83.67% import shipment arrived on time and 16.32% was delayed


