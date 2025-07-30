-- 3. Service Usage & Dependencies
select * from churn_data;
-- What is the churn rate for customers who have phone service versus those who do not?
SELECT 
    PhoneService,
    COUNT(*) AS CustomerCount,
    SUM(CASE
        WHEN Churn = 'Yes' THEN 1
        ELSE 0
    END) AS ChurnCount,
    (SUM(CASE
        WHEN Churn = 'Yes' THEN 1
        ELSE 0
    END) / COUNT(*)) * 100 AS ChurnRate
FROM
    churn_data
GROUP BY PhoneService;


-- For customers with internet service, how does the churn rate vary by InternetService type (DSL, Fiber Optic, No Internet)?
SELECT 
    TechSupport,
    COUNT(*) AS customerCount,
    SUM(CASE
        WHEN churn = 'Yes' THEN 1
        ELSE 0
    END) AS ChurnCount,
    (SUM(CASE
        WHEN churn = 'Yes' THEN 1
        ELSE 0
    END) / COUNT(*)) * 100 AS ChurnRate
FROM
    churn_data
GROUP BY TechSupport;


-- Among customers with multiple lines, is the churn rate higher or lower compared to customers with a single line?
SELECT 
    MultipleLines,
    COUNT(*) AS customerCount,
    SUM(CASE
        WHEN churn = 'Yes' THEN 1
        ELSE 0
    END) AS ChurnCount,
    (SUM(CASE
        WHEN churn = 'Yes' THEN 1
        ELSE 0
    END) / COUNT(*)) * 100 AS ChurnRate
FROM
    churn_data
GROUP BY MultipleLines;


-- What is the churn rate for customers who have tech support versus those who do not?
SELECT 
    MultipleLines,
    COUNT(*) AS customerCount,
    SUM(CASE
        WHEN churn = 'Yes' THEN 1
        ELSE 0
    END) AS ChurnCount,
    (SUM(CASE
        WHEN churn = 'Yes' THEN 1
        ELSE 0
    END) / COUNT(*)) * 100 AS ChurnRate
FROM
    churn_data
GROUP BY MultipleLines;


-- How many customers have a Partner and what is their churn rate? How does this compare to customers who do not have a partner?
SELECT 
    Partner,
    COUNT(*) AS customerCount,
    SUM(CASE
        WHEN churn = 'Yes' THEN 1
        ELSE 0
    END) AS ChurnCount,
    (SUM(CASE
        WHEN churn = 'Yes' THEN 1
        ELSE 0
    END) / COUNT(*)) * 100 AS ChurnRate
FROM
    churn_data
GROUP BY Partner;


