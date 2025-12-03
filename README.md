This project analyzes a relational sales dataset using SQL to answer twenty business questions. The goal is to demonstrate practical SQL skills, including joins, aggregation, grouping, filtering logic, and handling incomplete data with outer joins.

The dataset includes four tables:

sales_order

products

customers

employees

The queries progress from basic reporting to more complex analytical tasks commonly used in operations and business intelligence.

Skills Demonstrated
Multi-table joins

Use of inner, left, and right joins depending on whether unmatched rows should be included.

Aggregation and grouping

Use of SUM, COUNT, AVG, GROUP BY, and HAVING to summarize and filter data.

Conditional and boolean logic

Use of AND, OR, NOT, and case-insensitive comparisons to solve business rules.

Handling missing or incomplete data

Use of outer joins and COALESCE to include employees or customers with no sales activity.

Business-focused analysis

Examples of questions answered include:

Listing completed orders with customer and employee details

Counting orders by delivery status

Identifying customers with no purchase history

Calculating total sales per employee

Finding high-value orders above a threshold while excluding specific products

Structure

The repository contains:

A SQL file with all queries

Notes explaining query decisions where relevant

Sample outputs for selected questions

This project highlights the ability to translate business requirements into accurate SQL queries and extract meaningful information from transactional data.
