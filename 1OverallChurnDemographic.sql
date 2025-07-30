-- 1. Overall Churn & Demographic Profile
use telco_churn;
-- What is the total number of customers and the overall churn rate?
SELECT 
    COUNT(*) AS Total_Customers,
    SUM(CASE
        WHEN Churn = 'Yes' THEN 1
        ELSE 0
    END) AS churned_customers,
    (SUM(CASE
        WHEN Churn = 'Yes' THEN 1
        ELSE 0
    END) * 1.0 / COUNT(*)) * 100 AS churn_rate
FROM
    churn_data;
    


-- How does the churn rate differ between male and female customers?
SELECT 
    gender,
    COUNT(*) AS Total_Gender_Count,
    SUM(CASE
        WHEN Churn = 'Yes' THEN 1
        ELSE 0
    END) * 1 AS Gender,
    (SUM(CASE
        WHEN Churn = 'Yes' THEN 1
        ELSE 0
    END) * 1 / COUNT(*) * 100) AS GenderChurnRate
FROM
    churn_data
GROUP BY gender;


-- What is the churn rate for senior citizens compared to non-senior citizens?
SELECT 
    COUNT(*) AS Total_Customers,
    SUM(CASE
        WHEN SeniorCitizen = 1 THEN 1
        ELSE 0
    END) AS SenoirCitizenCount,
    (SUM(CASE
        WHEN SeniorCitizen = 1 THEN 1
        ELSE 0
    END) / COUNT(*)) * 100 AS SenoirCitizenChurnRate
FROM
    churn_data;


-- What is the churn rate for customers who are married versus those who are not?
SELECT 
    COUNT(*) AS Total_Customers,
    SUM(CASE
        WHEN Partner = 'Yes' THEN 1
        ELSE 0
    END) AS Married,
    (SUM(CASE
        WHEN Partner = 'Yes' THEN 1
        ELSE 0
    END) * 1 / COUNT(*)) * 100 AS Married_Rate,
    (SUM(CASE
        WHEN (Partner = 'Yes' AND Churn = 'Yes') THEN 1
        ELSE 0
    END) / COUNT(*)) * 100 AS Partner_Churn
FROM
    churn_data;