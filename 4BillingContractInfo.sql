-- 4. Billing & Contract Information
select * from churn_data;
-- What is the churn rate for each Contract type (Month-to-month, One year, Two year)?
select Contract, count(*) as CustomerCount, 
sum(case when Churn='Yes' then 1 else 0 end) as ChurnCount,
(sum(case when Churn='Yes' then 1 else 0 end) / count(*)) * 100 as ChurnRate
from churn_data group by Contract;

-- How does the churn rate vary by PaymentMethod (e.g., Electronic Check, Mailed Check, etc.)?
select PaymentMethod, count(*) as CustomerCount, 
sum(case when Churn='Yes' then 1 else 0 end) as ChurnCount,
(sum(case when Churn='Yes' then 1 else 0 end) / count(*)) * 100 as ChurnRate
from churn_data group by PaymentMethod;

-- What are the average MonthlyCharges for customers who have churned versus those who have not?
select Churn, avg(MonthlyCharges) as AvgMonthlyCharges from churn_data group by Churn;

-- What are the average TotalCharges for customers in each Contract type?
select Churn, avg(TotalCharges) as AvgTotalCharges from churn_data group by Churn;

-- How many customers use paperless billing, and what is their churn rate compared to those who don't?
select PaperlessBilling, count(*) as CustomerCount, 
sum(case when Churn='Yes' then 1 else 0 end) as ChurnCount,
(sum(case when Churn='Yes' then 1 else 0 end) / count(*)) * 100 as ChurnRate
from churn_data group by PaperlessBilling;