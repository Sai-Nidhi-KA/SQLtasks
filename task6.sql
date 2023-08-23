--task 6
create table customer
(
   customer_id INT  PRIMARY KEY,
    customer_name VARCHAR(100),
    city VARCHAR(50),
    email VARCHAR(100),
    phone_number VARCHAR(15)
);

INSERT INTO customer (customer_id,customer_name, city, email, phone_number)
VALUES (1,'Alice', 'New York', 'alice@example.com', '123-456-7890');
INSERT INTO customer (customer_id,customer_name, city, email, phone_number)
VALUES (2,'Nirmal', 'Mumbai', 'nirmal@example.com', '999-456-7890');
INSERT INTO customer (customer_id,customer_name, city, email, phone_number)
VALUES (3,'Jain', 'USA', 'Jain@example.com', '123-876-7890');

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);

INSERT INTO Orders (order_id, customer_id, order_date, total_amount)
VALUES (101, 1, '2023-08-01', 150.00);
INSERT INTO Orders (order_id, customer_id, order_date, total_amount)
VALUES (102, 2, '2023-08-02', 200.00);
INSERT INTO Orders (order_id, customer_id, order_date, total_amount)
VALUES (103, 3, '2023-08-03', 75.00);

select * from customer;
select * from Orders;

--To combine necessary fields from two different tables by using primary key and foreign key constraints.
--using inner join
Select customer.customer_name,Orders.order_id
from customer
inner join Orders on customer.customer_id=Orders.customer_id;

--using left join
Select customer.customer_name,Orders.order_date
from customer
left join Orders on customer.customer_id=Orders.customer_id;

--right join
Select customer.customer_name,Orders.order_id
from customer
right join Orders on customer.customer_id=Orders.customer_id;

--full outer join
Select *
from customer
full outer join Orders on customer.customer_id=Orders.customer_id;

