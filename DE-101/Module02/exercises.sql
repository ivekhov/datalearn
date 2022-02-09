select 
	city
	, count(distinct order_id) as number_orders
	, sum(sales) as revenue
from public.orders o 
where category not in ('Furniture')
group by 1
having sum(sales) > 100000
order by revenue  desc;


select distinct 
category
from orders o ;


select count(1)
from orders o ;


select count(1)
from "returns" r ;


select count(*)
	, count(distinct o.order_id)
from orders o 
left join "returns" r on o.order_id = r.order_id 

select 
	count(*)
	, count(distinct o.order_id)
from orders o
where order_id in (
					select distinct order_id 
					from "returns")

select now()


