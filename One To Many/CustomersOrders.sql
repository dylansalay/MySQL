CREATE TABLE customers(
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(100)
);

CREATE TABLE orders(
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_date DATE,
    amount DECIMAL(8,2),
    customer_id INT,
    FOREIGN KEY(customer_id) REFERENCES customers(id)
);

INSERT INTO customers(first_name, last_name, email)
VALUES ('Boy','George','george@gmail.com'),
       ('George','Michael','gm@gmail.com'),
       ('David','Bowie','david@gmail.com'),
       ('Blue','Steele','blue@gmail.com'),
       ('Bette','Davis','bette@aol.com');

INSERT INTO orders(order_date, amount, customer_id)
VALUES ('2016/02/10','99.99','1'),
       ('2017/11/11','35.5','1'),
       ('2014/12/12','800.67','2'),
       ('2015/01/03','12.5','2'),
       ('1999/04/11','450.25','5');


SELECT * FROM orders WHERE customer_id=1
SELECT * FROM customers WHERE last_name='George'

SELECT * FROM orders WHERE customer_id=
    (
        SELECT id FROM customers 
        WHERE last_name='George'
    );

-- Cross Join 
SELECT * FROM customers, orders;

-- Implicit Inner Join
SELECT * FROM customers, orders 
WHERE customers.id = orders.customer_id;

-- Implicit Inner Join
SELECT first_name, last_name, order_date, amount 
FROM customers, orders 
WHERE customers.id = orders.customer_id;

-- Explicit Inner Join
SELECT * FROM customers
JOIN orders 
    on customers.id = orders.customer_id;

-- Explicit Inner Join
SELECT first_name, last_name, order_date, amount
FROM customers
JOIN orders 
    on customers.id = orders.customer_id;

-- More complex Join
SELECT first_name, last_name, SUM(amount) AS total_spent
FROM customers
JOIN orders 
    on customers.id = orders.customer_id
GROUP BY orders.customer_id
ORDER BY total_spent DESC;

-- Left Join
SELECT 
    first_name, 
    last_name, 
    IFNULL(SUM(amount), 0) AS total_spent
FROM customers
LEFT JOIN orders
    ON customers.id = orders.customer_id
GROUP BY customers.id
ORDER BY total_spent;

-- Right Join
SELECT * FROM customers
RIGHT JOIN orders
    ON customers.id = orders.customer_id;

INSERT INTO orders (order_date, amount, customer_id)
VALUES ('2017/11/05',23.45,45),
       ('2017/04/26',777.77,109);