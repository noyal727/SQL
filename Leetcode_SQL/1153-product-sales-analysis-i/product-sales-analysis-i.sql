# Write your MySQL query statement below
select product_name, year, price from Product join Sales using(product_id);