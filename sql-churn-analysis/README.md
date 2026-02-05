# SQL – Customer Churn Analysis

This project analyzes customer churn data using SQL.

## Business Questions
- What is the overall churn rate?
- Which contract types have the highest churn?
- Does customer tenure affect churn?

## Key Insights
- Overall churn rate is approximately 26.54%  
- Customers on month-to-month contracts show the highest churn  
- Customers with longer tenure are less likely to churn  
These insights highlight that contract type and customer tenure are key factors in churn.


## Analysis: Churn by Monthly Charges

### Business Question
Is there a relationship between monthly charges and customer churn?

### Method
Customers were grouped into three pricing segments based on monthly charges:  
Low (≤ $50), Medium ($50–$80), High (> $80).  
For each group, the churn rate was calculated as the percentage of customers who churned.

### Key Findings
- Customers in the High monthly charges segment show the highest churn rate 33.98%
- Lower-priced customers are more likely to stay with the company 15.7%

### Business Implications
Customers with higher monthly costs may be more price-sensitive or feel they receive less value.  
This suggests potential actions such as targeted discounts, contract incentives, or service improvements for high-paying customers.
