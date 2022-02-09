/***
1. Идеи для создания дашборда отчета:

Overview (обзор ключевых метрик)
Total Sales
Total Profit
Profit Ratio
Profit per Order
Sales per Customer
Avg. Discount
Monthly Sales by Segment ( табличка и график)
Monthly Sales by Product Category (табличка и график)
***/


-- Main KPI overall
select 
	sum(sales) as "Total Sales"
	, sum(profit) as "Total Profit"
	, (sum(profit)  / sum(sales)) * 100  as "Profit Ratio"
	, sum(profit) / count(distinct order_id) as "Profit per Order"
	, sum(sales) / count(distinct customer_id) as "Sales per Customer"
	, sum(profit) / count(distinct customer_id) as "Profit per Customer"
	, avg(discount) * 100 as "Avg. Discount"
from orders o 


-- Sales by month
select
extract('year' from order_date)  as "Year"	
, extract('month' from order_date)  as "Month"
	, sum(sales) as "Total Sales"
from orders
group by 1, 2
order by 1 asc, 2 asc;


-- KPI Metrics by month
select
	extract('year' from order_date) as "Year"	
	, extract('month' from order_date)  as "Month"
	, round(sum(sales),1) as "Total Sales"
	, round(sum(profit),1) as "Total Profit"
	, round((sum(profit)  / sum(sales)) * 100,1)  as "Profit Ratio"
	, round(sum(profit) / count(distinct order_id),1) as "Profit per Order"
	, round(sum(sales) / count(distinct customer_id),1) as "Sales per Customer"
	, round(sum(profit) / count(distinct customer_id),1) as "Profit per Customer"
	, round(avg(discount) * 100,1) as "Avg. Discount"
from orders
group by 1, 2
order by 1 asc, 2 asc;


/**
Monthly Sales by Segment ( табличка и график)
Monthly Sales by Product Category (табличка и график)
***/


-- Total Sales by segment
select	
	distinct segment as "Segment"
	, round(sum(sales),1) as "Total Sales"
from orders
group by 1
order by 2 desc;


-- Total Sales by category
select	
	distinct category as "Category"
	, round(sum(sales),1) as "Total Sales"
from orders
group by 1
order by 2 desc;


-- Sales by segment and category by Months
select	
	segment 
	,  category
	,  extract('year' from order_date) as "Year"	
	,  extract('month' from order_date)  as "Month"
	,  round(sum(sales),1) as "Total Sales"
from orders
group by 1, 2, 3, 4
order by 1 asc, 2 asc , 3 asc, 4 asc;



-- Sales by  category by Months
select	
	category
	,  extract('year' from order_date) as "Year"	
	,  extract('month' from order_date)  as "Month"
	,  round(sum(sales),1) as "Total Sales"
from orders
group by 1, 2, 3
order by 1 asc, 2 asc , 3 asc;



-- Average Monthly Sales by segment and category 
select
	segment 
	, category
	, round(sum(sales), 0) as "Total Sales"
	,  round(sum(sales) / (
						select count(*) 
						from (
							select 
								extract('year' from order_date) as "Year"	
								,  extract('month' from order_date)  as "Month"
							from orders
							group by 1, 2
					) as subq), 0)
	as "Monthly Sales"
from orders
group by 1, 2
order by 3 desc;




-- Average Yearly and Monthly Sales by category 
select
	category as "Category"
	, round(sum(sales), 0) as "Total Sales"
	,  round(sum(sales) / (
						select count(*) 
						from (
							select 
								extract('year' from order_date) as "Year"
							from orders
							group by 1
					) as subq), 0)
	as "Yearly Sales"
	,  round(sum(sales) / (
						select count(*) 
						from (
							select 
								extract('year' from order_date) as "Year"	
								,  extract('month' from order_date)  as "Month"
							from orders
							group by 1, 2
					) as subq), 0)
	as "Monthly Sales"
from orders
group by 1
order by 3 desc;



-- Average Yearly and Monthly Sales by segment 
select
	segment as "Segment"
	, round(sum(sales), 0) as "Total Sales"
	,  round(sum(sales) / (
						select count(*) 
						from (
							select 
								extract('year' from order_date) as "Year"
							from orders
							group by 1
					) as subq), 0)
	as "Yearly Sales"
	,  round(sum(sales) / (
						select count(*) 
						from (
							select 
								extract('year' from order_date) as "Year"	
								,  extract('month' from order_date)  as "Month"
							from orders
							group by 1, 2
					) as subq), 0)
	as "Monthly Sales"
from orders
group by 1
order by 3 desc;




/***
2. Product Dashboard (Продуктовые метрики)

Sales by Product Category over time (Продажи по категориям)
Customer Analysis
Sales and Profit by Customer
Customer Ranking
Sales per region

***/


-- Sales by  category by Months
select	
	category as "Category"
	,  extract('year' from order_date) as "Year"	
	,  extract('month' from order_date)  as "Month"
	,  round(sum(sales),1) as "Total Sales"
from orders
group by 1, 2, 3
order by 1 asc, 2 asc , 3 asc;


-- Sales by subcategory by Months
select	
	subcategory as "Subcategory"
	,  extract('year' from order_date) as "Year"	
	,  extract('month' from order_date)  as "Month"
	,  round(sum(sales),1) as "Total Sales"
from orders
group by 1, 2, 3
order by 1 asc, 2 asc , 3 asc;

-- Sales and Profit by Customer

select 
	distinct customer_id 
	, customer_name
	, round(sum(sales)) as "Total Sales"
	, round(sum(profit)) as "Total Profit"
from orders o 
group by 1, 2
order by 3 desc, 4 desc 



-- Customer Ranking

select 
	distinct customer_id 
	, customer_name
	, rank() over (
					order by sales desc
					)
from orders o 
order by 3 asc 


-- Sales per region
select 
	distinct region 
	, round(sum(sales)) as "Total Sales"
from orders o 
group by 1
order by 2 desc





