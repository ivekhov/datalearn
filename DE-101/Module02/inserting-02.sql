
insert into product_dim(product_id, name, category, subcategory)
select distinct product_id, product_name, category, subcategory
from orders;

select *
from product_dim
limit 10;



insert into customers_dim(customer_id, name, segment)
select distinct customer_id, customer_name, segment
from orders;

select *
from customers_dim
limit 10;



insert into geography_dim(postal_code, city, state, country, region)
select distinct postal_code, city, state, country, region
from orders;

select *
from geography_dim
limit 10;


insert into  shipping_dim(shipping_mode)
select distinct  ship_mode
from orders;


;with t as (
    select distinct order_date as date
    from orders
    union
    select distinct ship_date as date
    from orders
),

d as (
    select
        date,
        extract(year from t.date) as year,
        extract(quarter from t.date) as quarter,
        extract(month from t.date) as month,
        extract(week from t.date) as week,
        extract(dow from t.date) as week_day
from t
)

insert into calendar_dim
select *
from d ;


insert into sales_fact(
    order_id
    , ship_id
    , order_date
    , geography_id
    , product_id
    , customer_id
    , sales_amount
    , profit
    , quantity
    , discount
    , postal_code
    , ship_date
)
select
    o.order_id
    , sd.ship_id
    , o.order_date
    , gd.geography_id
    , o.product_id
    , o.customer_id
    , o.sales
    , o.profit
    , o.quantity
    , o.discount
    , o.postal_code
    , o.ship_date
from orders o
    inner join shipping_dim sd on sd.shipping_mode = o.ship_mode
    inner join geography_dim gd on gd.postal_code = o.postal_code


select *
from sales_fact
limit 10;

