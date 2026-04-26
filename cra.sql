create database CRA;
use CRA;
  
CREATE TABLE telco_customers (
customerID VARCHAR(50),
gender VARCHAR(10),
SeniorCitizen INT,
Partner VARCHAR(10),
Dependents VARCHAR(10),
tenure INT,
PhoneService VARCHAR(10),
MultipleLines VARCHAR(20),
InternetService VARCHAR(20),
OnlineSecurity VARCHAR(20),
OnlineBackup VARCHAR(20),
DeviceProtection VARCHAR(20),
TechSupport VARCHAR(20),
StreamingTV VARCHAR(20),
StreamingMovies VARCHAR(20),
Contract VARCHAR(20),
PaperlessBilling VARCHAR(10),
PaymentMethod VARCHAR(50),
MonthlyCharges FLOAT,
TotalCharges FLOAT,
Churn VARCHAR(10)
);

 /* 1️. Overall Customer Churn Rate */
 
SELECT 
COUNT(*) AS total_customers,
SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS churn_customers,
ROUND(SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END)*100.0/COUNT(*),2) AS churn_rate
FROM telco_customers;


SELECT 
Contract,
COUNT(*) AS total_customers,
SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS churn_customers,
ROUND(SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END)*100.0/COUNT(*),2) AS churn_rate
FROM telco_customers
GROUP BY Contract
ORDER BY churn_rate DESC;

SELECT 
CASE 
WHEN tenure < 12 THEN 'New Customers'
WHEN tenure BETWEEN 12 AND 24 THEN 'Mid-term Customers'
ELSE 'Long-term Customers'
END AS tenure_group,

COUNT(*) AS total_customers,

SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS churn_customers,

ROUND(SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END)*100.0/COUNT(*),2) AS churn_rate

FROM telco_customers
GROUP BY tenure_group
ORDER BY churn_rate DESC;

SELECT 
Churn,
AVG(MonthlyCharges) AS avg_monthly_charges,
MIN(MonthlyCharges) AS min_charge,
MAX(MonthlyCharges) AS max_charge
FROM telco_customers
GROUP BY Churn;

SELECT 
TechSupport,
OnlineSecurity,
COUNT(*) AS total_customers,
SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS churn_customers,
ROUND(SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END)*100.0/COUNT(*),2) AS churn_rate
FROM telco_customers
GROUP BY TechSupport, OnlineSecurity
ORDER BY churn_rate DESC;

SELECT 
Contract,
InternetService,
PaymentMethod,
COUNT(*) AS total_customers,
SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS churn_customers,
ROUND(SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END)*100.0/COUNT(*),2) AS churn_rate
FROM telco_customers
GROUP BY Contract, InternetService, PaymentMethod
ORDER BY churn_rate DESC;

SELECT *
FROM telco_customers
WHERE Contract='Month-to-month'
AND tenure < 12
AND MonthlyCharges > 70;

SELECT 
InternetService,
COUNT(*) AS total_customers,
SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS churn_customers,
ROUND(SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END)*100.0/COUNT(*),2) AS churn_rate
FROM telco_customers
GROUP BY InternetService
ORDER BY churn_rate DESC;

SELECT 
PaymentMethod,
COUNT(*) AS total_customers,
SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS churn_customers,
ROUND(SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END)*100.0/COUNT(*),2) AS churn_rate
FROM telco_customers
GROUP BY PaymentMethod
ORDER BY churn_rate DESC;