create database bank_churn;
use bank_churn;
create table customers(
 CustomerID INT PRIMARY KEY,
    Name VARCHAR(100),
    Gender VARCHAR(10),
    Age INT,
    Geography VARCHAR(50),
    Tenure INT,
    Balance DECIMAL(12,2),
    Products INT,
    CreditScore INT,
    IsActiveMember BOOLEAN,
    EstimatedSalary DECIMAL(12,2),
    HasCrCard BOOLEAN,
    Exited BOOLEAN
);

insert into customers values
(1, 'John Smith', 'Male', 40, 'France', 5, 120000.50, 2, 600, 1, 58000.00, 1, 0),
(2, 'Alice Brown', 'Female', 32, 'Germany', 3, 80000.00, 1, 680, 1, 52000.00, 1, 1),
(3, 'Raj Kumar', 'Male', 29, 'Spain', 2, 50000.00, 2, 700, 0, 48000.00, 0, 1),
(4, 'Sara Lee', 'Female', 45, 'France', 7, 140000.00, 2, 710, 1, 61000.00, 1, 0),
(5, 'Carlos Gomez', 'Male', 36, 'Spain', 4, 90000.00, 1, 590, 1, 50000.00, 0, 1),
(6, 'Linda Jones', 'Female', 50, 'Germany', 10, 150000.00, 2, 740, 1, 70000.00, 1, 0),
(7, 'Daniel Yu', 'Male', 27, 'France', 1, 40000.00, 1, 610, 0, 45000.00, 1, 1),
(8, 'Meera Sharma', 'Female', 38, 'India', 6, 100000.00, 2, 690, 1, 58000.00, 1, 0),
(9, 'George Black', 'Male', 33, 'France', 2, 75000.00, 1, 630, 1, 49000.00, 1, 0),
(10, 'Anita Das', 'Female', 31, 'India', 3, 62000.00, 2, 650, 1, 47000.00, 0, 1);

select * from customers;

##churn by gender##
SELECT Gender, 
       COUNT(*) AS TotalCustomers,
       SUM(Exited) AS Churned,
       ROUND(SUM(Exited)*100.0/COUNT(*), 2) AS ChurnRate
FROM customers
GROUP BY Gender;

##churn by geography##
SELECT Geography,
       COUNT(*) AS Total,
       SUM(Exited) AS Churned,
       ROUND(SUM(Exited)*100/COUNT(*), 2) AS ChurnRate
FROM customers
GROUP BY Geography;


##churn by age group##
SELECT 
  CASE 
    WHEN Age < 30 THEN 'Under 30'
    WHEN Age BETWEEN 30 AND 50 THEN '30-50'
    ELSE '50+'
  END AS AgeGroup,
  COUNT(*) AS Total,
  SUM(Exited) AS Churned,
  ROUND(SUM(Exited)*100/COUNT(*), 2) AS ChurnRate
FROM customers
GROUP BY AgeGroup;



