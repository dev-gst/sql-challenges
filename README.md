# SQL Challenges

This repository contains a collection of SQL challenges that I have completed. These challenges are designed to test and improve your SQL skills.

## Table of Contents

- [Introduction](#introduction)
- [Challenges](#challenges)
- [Getting Started](#getting-started)
- [Usage](#usage)

## Introduction

The SQL challenges in this repository cover various aspects of SQL, including querying, data manipulation, and database design. Each challenge is accompanied by a description and the expected output.

## Challenges

1. **Challenge Beecrowd 2603**:

   Description: query to find name and addresses of clients that live in Porto Alegre.
   Main SQL terms used:
    ```sql
    SELECT, FROM, WHERE
    ```

2. **Challenge Beecrowd 2609**:

    Description: query to find name and quantity of products in stock from each category.
    Main SQL terms used:
     ```sql
     SELECT, FROM, JOIN, ON, GROUP BY, AS, SUM()
     ```
3. **Challenge Beecrowd 2616**:

   Description: query to find id and name of client that didn't make any location.
   Main SQL terms used:
     ```sql
     SELECT, FROM, AS, WHERE, NOT, IN
     ```

4. **Challenge Beecrowd 2737**:

   Description: query to find name of the lawyer with more clients, name of the lawyer with fewer clients and the average of clients
   Main SQL terms used:
     ```sql
     MAX(), MIN(), AVG(), ROUND(), UNION ALL
     ```

5. **Challenge Beecrowd 2738**:

   Description: query to find name and score of all research candidates 
   Main SQL terms used:
     ```sql
     SELECT, FROM, AS, ROUND(), JOIN, ON, ORDER BY, DESC
     ```

6. **Challenge Beecrowd 2988**:

   Description: query to soccer team, number of matches, number of victories, number of draws, number of defeats and score.
   Main SQL terms used:
     ```sql
     CASE, WHEN, THEN, ELSE, END, JOIN, ON, SUM(),
     ```

7. **Challenge Beecrowd 2989**:

   Description: query to find department, division, average and max salary per division.
   Main SQL terms used:
   ```sql
   LEFT JOIN, GROUP BY, ORDER BY, ROUND(), JOIN, ON, COALESCE(), SUM(), MAX(), AVG()
   ```

8. **Challenge Beecrowd 2991**:

   Description: query to find department, number of employees, average salary, max salary and min salary.
   Main SQL terms used:
     ```sql
     COUNT(), SUM(), COALESCE(), ROUND(), MAX(), MIN(), AVG()
     ```
   
9. **Challenge Beecrowd 2992**:

   Description: query to find department, division with the highest average salary and the highest average salary.
   Main SQL terms used:
   ```sql
    SUM(), COALESCE(), ROUND(), MAX(), AVG(), CASE, WHEN, THEN, ELSE, END
   ```

10. **Challenge Beecrowd 2995**:

   Description: query to find temperature and number of records.
   Main SQL terms used:
   ```sql
   COUNT()... OVER(), PARTITION BY
   ```

11. **Challenge Beecrowd 2997**:

   Description: query to find department, name of employee, raw salary, total of discounts and liquid salary.
   Main SQL terms used:
   ```sql
   SUM(), COALESCE(), LEFT JOIN
   ```

12. **Challenge Beecrowd 2998**:

   Description: query to find name, initial investment, month of payback and return from clients that have a payback.
   Main SQL terms used:
   ```sql
   SUM()... OVER(), WHEN, THEN, ELSE, END, PARTITION BY, ROWS UNBOUNDED PRECEDING, ROW_NUMBER()... OVER().
   ```

13. **More to come**:

   More challenges will be added to this repository soon.

## Getting Started

To get started with these challenges, you will need a SQL database management system (DBMS) such as MySQL, PostgreSQL, or SQLite. You can use any DBMS of your choice to run the SQL queries provided in the challenges.

## Usage

1. Clone the repository:
    ```sh
    git clone git@github.com:dev-gst/sql-challenges.git
    cd sql-challenges
    ```

2. Open the SQL file for the challenge you want to work on.

3. Execute the SQL queries in your DBMS.

4. Verify the output against the expected results provided in the challenge description.
