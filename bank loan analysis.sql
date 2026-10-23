CREATE DATABASE bank_analysis;
USE bank_analysis;
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    city VARCHAR(50),
    income INT,
    credit_score INT
);
CREATE TABLE loans (
    loan_id INT PRIMARY KEY,
    customer_id INT,
    loan_type VARCHAR(30),
    amount INT,
    status VARCHAR(20),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);
CREATE TABLE payments (
    payment_id INT PRIMARY KEY,
    loan_id INT,
    amount_due INT,
    amount_paid INT,
    payment_date DATE,
    FOREIGN KEY (loan_id) REFERENCES loans(loan_id)
);
INSERT INTO customers VALUES
(1, 'Aarav', 25, 'Mumbai', 600000, 720),
(2, 'Priya', 42, 'Pune', 1200000, 650),
(3, 'Rohan', 31, 'Bangalore', 850000, 780),
(4, 'Sneha', 50, 'Delhi', 1500000, 590),
(5, 'Kabir', 28, 'Nagpur', 450000, 680),
(6, 'Ananya', 37, 'Hyderabad', 950000, 740),
(7, 'Ishaan', 46, 'Mumbai', 700000, 610),
(8, 'Meera', 33, 'Pune', 1100000, 800);


INSERT INTO loans VALUES
(101, 1, 'Personal', 150000, 'Active'),
(102, 2, 'Home', 2500000, 'Active'),
(103, 3, 'Vehicle', 600000, 'Closed'),
(104, 4, 'Business', 1800000, 'Defaulted'),
(105, 5, 'Personal', 100000, 'Active'),
(106, 6, 'Home', 2000000, 'Active'),
(107, 7, 'Business', 900000, 'Defaulted'),
(108, 8, 'Vehicle', 450000, 'Closed');

INSERT INTO payments VALUES
(1, 101, 14000, 14000, '2025-02-10'),
(2, 101, 14000, 10000, '2025-03-10'),
(3, 102, 25000, 25000, '2025-02-15'),
(4, 102, 25000, 0, NULL),
(5, 104, 45000, 0, NULL),
(6, 105, 9000, 9000, '2025-06-12'),
(7, 106, 22000, 22000, '2025-03-18'),
(8, 107, 30000, 0, NULL);
SELECT * FROM customers;
SELECT name, city
FROM customers;
SELECT *
FROM customers
WHERE income > 800000;
SELECT *
FROM customers
WHERE credit_score < 700;
SELECT DISTINCT city
FROM customers;
SELECT *
FROM customers
ORDER BY income DESC;
SELECT COUNT(*) AS total_customers
FROM customers;
SELECT AVG(income) AS average_income
FROM customers;
SELECT MAX(income) AS highest_income
FROM customers;

SELECT MIN(income) AS lowest_income
FROM customers;
SELECT city, COUNT(*) AS total_customers
FROM customers
GROUP BY city;

SELECT loan_type, COUNT(*) AS total_loans
FROM loans
GROUP BY loan_type;

SELECT loan_type, SUM(amount) AS total_amount
FROM loans
GROUP BY loan_type;
SELECT *
FROM loans
WHERE status = 'Active';
SELECT *
FROM customers
WHERE name LIKE 'A%';
SELECT *
FROM customers
WHERE income BETWEEN 500000 AND 1000000;
SELECT customers.name, loans.loan_type, loans.amount
FROM customers
INNER JOIN loans
ON customers.customer_id = loans.customer_id;
SELECT customers.name, loans.status
FROM customers
LEFT JOIN loans
ON customers.customer_id = loans.customer_id;
SELECT customers.name, loans.amount
FROM customers
INNER JOIN loans
ON customers.customer_id = loans.customer_id
WHERE loans.status = 'Defaulted';
SELECT customers.name, loans.loan_type, payments.amount_paid
FROM customers
INNER JOIN loans
ON customers.customer_id = loans.customer_id
INNER JOIN payments
ON loans.loan_id = payments.loan_id;
SELECT *
FROM payments
WHERE payment_date IS NULL;
SELECT SUM(amount_due) AS total_due,
SUM(amount_paid) AS total_paid
FROM payments;
SELECT loan_type, AVG(amount) AS average_loan
FROM loans
GROUP BY loan_type;

SELECT status, COUNT(*) AS total
FROM loans
GROUP BY status;




