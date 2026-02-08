-- Overview of the dataset
SELECT
    COUNT(*) AS total_customers,
    SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        100.0 * SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS churn_rate
FROM customers;

-- --------------------------------------------

-- Churn rate by contract type
SELECT
    contract,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        100.0 * SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS churn_rate
FROM customers
GROUP BY contract
ORDER BY churn_rate DESC;

-- --------------------------------------------

-- Churn by tenure groups
SELECT
    CASE
        WHEN tenure < 12 THEN '0-12 months'
        WHEN tenure BETWEEN 12 AND 24 THEN '12-24 months'
        ELSE '24+ months'
    END AS tenure_group,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        100.0 * SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS churn_rate
FROM customers
GROUP BY tenure_group
ORDER BY churn_rate DESC;

-- --------------------------------------------

-- Business Question:
-- Is there a relationship between monthly charges and customer churn?
--
-- Approach:
-- Customers are grouped into Low, Medium and High monthly charge segments.
-- For each segment, churn rate is calculated as the percentage of customers who churned.
-- Customers are grouped into Low (<=50), Medium (51-80), High (>80) monthly charge segments.
-- Output:
-- Charge group, total customers, churned customers, churn rate (%)

SELECT
    CASE
        WHEN c.MonthlyCharges <= 50 THEN 'Low'
        WHEN c.MonthlyCharges <= 80 THEN 'Medium'
        ELSE 'High'
    END AS charge_group,
    COUNT(*) AS number_of_customers,
    SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        100.0 * SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS churn_rate
FROM customers c
GROUP BY charge_group
ORDER BY churn_rate DESC;

-- --------------------------------------------

-- Business Question:
-- How does the combination of contract type and internet service affect customer churn?
--
-- Approach:
-- Customers are grouped by contract type and internet service.
-- For each group, the churn rate is calculated as the percentage of customers who churned.
--
-- Output:
-- Contract type, internet service, total customers, churned customers, churn rate (%)


SELECT
    c.Contract,
    c.InternetService,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        100.0 * SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS churn_rate
FROM customers c
GROUP BY c.Contract, c.InternetService
ORDER BY churn_rate DESC;
