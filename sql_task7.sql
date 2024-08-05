select * from sales

select * from customer

select * from product

--create a report of all state sales, quantity, discount , profit  with following aggregation ,sum , avg, min , max, count        

select c.state, sum(sales) as sum_sales,avg(sales) as avg_sales,
       count(quantity) count_quantity,
       min(discount) as min_discount,max(discount) as max_discount,
       sum(profit) as sum_profit from sales as s
inner join customer as c
on s.customer_id = c.customer_id
group by c.state

--get data of all state and city's avg customer age  

select city,state,avg(age) from customer group by city,state 

--get data of 2017 to 2018  with product name and sales per quantity                   

select product_name,s.order_date,sum(sales)/sum(quantity) as sales_per_quantity
from sales as s
inner join product as p
on s.product_id = p.product_id
where order_date between '2017-01-01' and '2018-12-31'
group by product_name,s.order_date

-- 4 question on your data 
--get data of all Xerox 1967 product ,customer sum of sales 

select p.product_name,customer_name ,sum(sales) from sales as s
inner join customer as c
on s.customer_id = c.customer_id
inner join product as p
on s.product_id=p.product_id
where product_name='Xerox 1967'
group by  p.product_name,customer_name

--get data of customer name with sum of  sales,discount,profit top 10

select customer_name,sum(sales) as sum_sales,sum(discount) as sum_discount,sum(profit) as sum_profit from sales as s
inner join customer as c
on s.customer_id = c.customer_id
group by customer_name
order by c.customer_name desc limit 10

--get data of all product,categoty furniture, technology of avg of sales 

select product_name,p.category,avg(sales) from sales as s
inner join product as p
on s.product_id=p.product_id
where category='furniture' and category='technology'
group by product_name,p.category

--get all data of customer_name,standard class ship_mode ,2011 to 2014

select customer_name,s.ship_mode,s.ship_date from sales as s
inner join customer as c
on s.customer_id = c.customer_id
where ship_mode ='standard class' and ship_date between '2011-01-01' and '2014-12-31'
group by customer_name,s.ship_mode,s.ship_date 