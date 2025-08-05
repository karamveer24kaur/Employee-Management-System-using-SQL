# Employee Management System - SQL Project

## 📋 Project Overview

This project is a simple SQL-based **Employee Management System** that simulates a real-world HR database. 
It includes table creation, data insertion, and analytical queries to explore key HR metrics like salary structure, departmental strength, gender distribution, and management hierarchies.

## 💡 Objective

- Design and manage a relational employee database
- Use SQL to extract meaningful insights
- Understand organizational structures and compensation trends

## 🛠️ Tech Stack

- **Database**: MySQL
- **Tool**: MySQL Workbench

## 🧱 Schema Design

A single table named `employees` was created with the following fields:

| Column Name   | Data Type    | Description                         |
| ------------- | ------------ | ----------------------------------- |
| employee_id   | INT (PK)     | Unique ID for each employee         |
| first_name    | VARCHAR(50)  | First name                          |
| last_name     | VARCHAR(50)  | Last name                           |
| email         | VARCHAR(100) | Unique email                        |
| gender        | ENUM         | Male / Female / Other               |
| age           | INT          | Employee age                        |
| hire_date     | DATE         | Date of joining                     |
| salary        | INT          | Employee salary                     |
| manager_id    | INT (FK)     | Reports to another employee         |
| department    | VARCHAR(50)  | Department name                     |
| phone_number  | VARCHAR(20)  | Contact number                      |

## 🧪 Sample Queries Included

- Employee count by department
- Average salary by department
- Gender breakdown (overall and for managers)
- Employees with salaries above/below certain thresholds
- Conditional salary updates (10% raise example)

## 📈 Sample Insights

- Departments with the most employees
- Salary ranges across different teams
- Gender disparity in management roles
- Employees deserve salary reviews
- Structured data for further BI or dashboarding

## ⚙️ How to Run

1. Clone this repository
2. Open MySQL Workbench or terminal
3. Run the provided SQL script (`project1.sql`) step by step
4. Review output and modify queries as needed

## 📌 Key Concepts Practiced

- Table creation with constraints
- Primary and foreign key usage
- Aggregate functions (AVG, COUNT)
- Filtering and conditional updates
- Self-referencing foreign keys
