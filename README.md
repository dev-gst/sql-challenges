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
    ```
    SELECT, FROM, WHERE
    ```

2. **Challenge Beecrowd 2609**:

    Description: query to find name and quantity of products in stock from each category.
    Main SQL terms used:
     ```
     SELECT, FROM, JOIN, ON, GROUP BY, AS, SUM()
     ```
3. **Challenge Beecrowd 2616**:

   Description: query to find id and name of client that didn't make any location.
   Main SQL terms used:
     ```
     SELECT, FROM, AS, WHERE, NOT, IN
     ```

4. **Challenge Beecrowd 2738**:

   Description: query to find name and score of all research candidates 
   Main SQL terms used:
     ```
     SELECT, FROM, AS, ROUND(), JOIN, ON, ORDER BY, DESC
     ```

5. **Challenge Beecrowd 2989**:

   Description: query to find department, division, average and max salary per division.
   Main SQL terms used:
   ```
   LEFT JOIN, GROUP BY, ORDER BY, ROUND(), JOIN, ON, COALESCE(), SUM(), MAX(), AVG()
   ```

6. **Challenge Beecrowd 2998**:

   Description: query to find name, initial investment, month of payback and return from clients that have a payback.
   Main SQL terms used:
     ```
     SUM()... OVER(), WHEN, THEN, ELSE, END, PARTITION BY, ROWS UNBOUNDED PRECEDING, ROW_NUMBER()... OVER().
     ```

7. **More to come**:

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