

--. Identify the total no of products sold

 select sum(quantity) from sales_order

 --. Other than Completed, display the available delivery status's

 select * from sales_order  where status <> 'Completed'

-- . Display the order id, order_date and product_name for all the completed orders.

select order_id, order_date, products.name
from sales_order
inner join products on products.id = sales_order.prod_id
where status = 'Completed'

--Sort the above query to show the earliest orders at the top. Also display the customer who purchased these orders.

select order_id, products.name, order_date, customers.name
from sales_order
inner join customers on customers.id = sales_order.customer_id
inner join products on products.id = sales_order.prod_id
order by order_date

--. Display the total no of orders corresponding to each delivery status

select count(order_id), status from sales_order
group by status
order by count(order_id) desc

--. For orders purchasing more than 1 item, how many are still not completed?

select count(order_id), status from sales_order
where quantity > 1 and status <> 'Completed'
group by status

-- . Write a query to identify the total products purchased by each customer

select sum(quantity), customers.name
from sales_order
inner join customers on customers.id = sales_order.customer_id
group by customers.name
order by sum(quantity) desc

--. Display the total sales and average sales done for each day.

select sum(quantity * price), avg(quantity * price), order_date
from sales_order
inner join products on products.id = sales_order.prod_id
group by order_date

--10. Display the customer name, employee name and total sale amount of all orders which are either on hold or pending.

select status, customers.name, employees.name, sum(quantity*price)
from sales_order
inner join customers on customers.id = sales_order.customer_id
inner join employees on employees.id = sales_order.emp_id
inner join products on products.id = sales_order.prod_id
group by customers.name, employees.name, status
having status = 'On Hold' or status = 'Pending'

--Fetch all the orders which were neither completed/pending or were handled by the employee Abrar. Display employee name and all details or order.

select employees.name, sales_order.*
from sales_order
inner join employees on employees.id = sales_order.emp_id
where (status <> 'Completed' and status <> 'Pending') or employees.name = 'Abrar Khan'

--Fetch the orders which cost more than 2000 but did not include the macbook pro. Print the total sale amount as well.

select sum(quantity*price), products.name, order_id
from sales_order
inner join products on products.id = sales_order.prod_id
group by products.name, order_id
having sum(quantity*price) > 2000 and products.name <> 'Macbook Pro'

--. Identify the customers who have not purchased any product yet.
select customers.name, coalesce(quantity, 0)
from sales_order
right join customers on customers.id = sales_order.customer_id
where quantity is null

--Write a query to identify the total products purchased by each customer.Return all customers irrespective of wether they have made a purchase or not.
--Sort the result with highest no of orders at the top.

select coalesce(sum(quantity),0), customers.name
from sales_order
right join customers on customers.id = sales_order.customer_id
group by customers.name
order by sum(quantity) desc

--Corresponding to each employee, display the total sales they made of all the completed orders. Display total sales as 0 if an employee made no sales yet.

select coalesce(sum(quantity*price),0), employees.name, status
from sales_order
inner join products on products.id = sales_order.prod_id
right join employees on employees.id = sales_order.emp_id and status ='Completed'
group by employees.name, status

-- Re-write the above query so as to display the total sales made by each employee corresponding to each customer.
-- If an employee has not served a customer yet then display "-" under the customer.

select coalesce(sum(quantity*price),0), coalesce(employees.name, '-') as "Employee", coalesce(customers.name, '-') as "Customer"
from sales_order
inner join products on products.id = sales_order.prod_id
inner join customers on customers.id = sales_order.customer_id
right join employees on employees.id = sales_order.emp_id and status ='Completed'
group by employees.name, customers.name

--Re-write above query so as to display only those records where the total sales is above 1000

select coalesce(sum(quantity*price),0), coalesce(employees.name, '-') as "Employee", coalesce(customers.name, '-') as "Customer"
from sales_order
inner join products on products.id = sales_order.prod_id
inner join customers on customers.id = sales_order.customer_id
right join employees on employees.id = sales_order.emp_id and status ='Completed'
group by employees.name, customers.name
having sum(quantity*price) > 1000

--. Identify employees who have served more than 2 customer.
select count(distinct customers.id), employees.name
from sales_order
inner join customers on customers.id = sales_order.customer_Id
inner join employees on employees.id = sales_order.emp_id
group by employees.name
having count(distinct customers.id) > 2


-- Identify the customers who have purchased more than 5 products

select sum(quantity), customers.name
from sales_order
inner join customers on customers.id = sales_order.customer_id
group by customers.name
having sum(quantity) >5


--. Identify customers whose average purchase cost exceeds the average sale of all the orders.

select avg(quantity * price)
from sales_order
inner join products on products.id = sales_order.prod_id

select avg(quantity * price), customers.name
from sales_order
inner join products on products.id = sales_order.prod_id
inner join customers on customers.id = sales_order.customer_id
group by customers.name
having avg(quantity * price) > (select avg(quantity * price)
								from sales_order
								inner join products on products.id = sales_order.prod_id)
