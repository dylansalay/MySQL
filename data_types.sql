-- WHEN to use CHAR => When we know the exact/fixed length of an entry
-- State Abbreviations

CREATE TABLE inventory (
    item_name VARCHAR(100),
    price DECIMAL(8,2),
    quantity INT
);


-- What is the difference between DATETIME and TIMESTAMP
-- DATETIME supports '1000-01-01 00:00:00' to '9999-12-31 23:59:29'
-- TIMESTAMP supports '1970-01-01 00:00:01' UTC to '2038-01-19 03:14:01' UTC and takes significantly less (about half) space than DATETIME. TIMESTAMP is used for things like meta-data about when something is created or updated.

SELECT CURTIME();

SELECT CURDATE();

SELECT DAYOFWEEK(CURDATE()-1);

SELECT DAYNAME(CURDATE());

SELECT (DATE_FORMAT(NOW(), '%M %D at %h:%s'));


CREATE tABLE tweets (
    content VARCHAR(140),
    username VARCHAR(20),
    created_at TIMESTAMP DEFAULT NOW()
);

