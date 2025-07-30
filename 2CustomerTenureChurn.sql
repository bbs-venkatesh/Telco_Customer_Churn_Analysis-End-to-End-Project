-- 2. Customer Tenure & Churn
select * from churn_data;
-- What is the average tenure for customers who have churned? What about for those who have not?
SELECT 
    Churn, COUNT(*) AS Churn_Count, AVG(tenure) AS AvgTenure
FROM
    churn_data
GROUP BY Churn;

-- How many customers are there in each of the tenure groups you created (e.g., 0-12 months, 13-24 months, etc.)?
SELECT 
    tenure_bins, COUNT(*) AS Customers_Count
FROM
    churn_data
GROUP BY tenure_bins;


-- What is the churn rate for each of these tenure groups?
SELECT 
    tenure_bins,
    COUNT(*) AS Customers_Count,
    SUM(CASE
        WHEN Churn = 'Yes' THEN 1
        ELSE 0
    END) AS Churn_Count,
    (SUM(CASE
        WHEN Churn = 'Yes' THEN 1
        ELSE 0
    END) / COUNT(*)) * 100 AS ChurnRate
FROM
    churn_data
GROUP BY tenure_bins
ORDER BY ChurnRate DESC;


