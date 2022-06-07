{{ config(materialized='view',alias='vw_olo_clientplatform_orders_2022',database='VRIZE', schema='OOC') }}

Select clientplatform, 
case when membershipnumber is null then 'Non-Loyalty' else 'Loyalty' end as LOYALTY_Y_N, 
count (*) as order_count ,
sum(total) as order_total
from OLO.PROD.OLO_ORDERS_CLOSED where  year(timeplaced) ='2022'
group by clientplatform, 
case when membershipnumber is null then 'Non-Loyalty' else 'Loyalty' end 
order by clientplatform,
case when membershipnumber is null then 'Non-Loyalty' else 'Loyalty' end 