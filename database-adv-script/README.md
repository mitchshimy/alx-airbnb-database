# ALX Airbnb Database Advanced SQL Tasks

This repository contains a series of advanced SQL tasks designed to enhance your skills in query writing, optimization, and database performance tuning. Each task focuses on a key aspect of working with relational databases and SQL, using an Airbnb-style dataset.

---

## Overview

### 0. Write Complex Queries with Joins
**Objective:** Master SQL joins by writing complex queries using different types of joins.

- Write an **INNER JOIN** query to retrieve all bookings and the users who made those bookings.
- Write a **LEFT JOIN** query to retrieve all properties and their reviews, including those without reviews.
- Write a **FULL OUTER JOIN** query to retrieve all users and bookings, even if no matching records exist on either side.

**Files:**
[joins](joins_queries.sql)

---

### 1. Practice Subqueries
**Objective:** Write both correlated and non-correlated subqueries.

- Query to find all properties where the average rating is greater than 4.0 using a subquery.
- Correlated subquery to find users who have made more than 3 bookings.

**Files:**  
[subqueries](subqueries.sql)

---

### 2. Apply Aggregations and Window Functions
**Objective:** Use SQL aggregation and window functions to analyze data.

- Find total bookings made by each user using `COUNT` and `GROUP BY`.
- Use window functions (`ROW_NUMBER`, `RANK`) to rank properties by total bookings.

**Files:**  
[aggregations](aggregations_and_window_functions.sql)

---

### 3. Implement Indexes for Optimization
**Objective:** Identify and create indexes to improve query performance.

- Identify high-usage columns (e.g., in `WHERE`, `JOIN`, `ORDER BY` clauses).
- Write `CREATE INDEX` commands for those columns.
- Measure query performance before and after indexing using `EXPLAIN` or `ANALYZE`.

**Files:**  
[Indexes](index_performance.md)

---

### 4. Optimize Complex Queries
**Objective:** Refactor complex queries to improve performance.

- Write an initial query retrieving bookings, user details, property details, and payment details.
- Analyze query performance using `EXPLAIN`.
- Refactor the query to reduce execution time.

**Files:**   
[datoptimization](datoptimization_report.md)

---

### 5. Partitioning Large Tables
**Objective:** Implement table partitioning to optimize queries on large datasets.

- Implement partitioning on the `Booking` table based on `start_date`.
- Test query performance on the partitioned table.
- Write a brief report on observed improvements.

**Files:**  
[partition](partition_performance.md)

---

### 6. Monitor and Refine Database Performance
**Objective:** Continuously monitor and refine database performance.

- Use `SHOW PROFILE` or `EXPLAIN ANALYZE` to analyze query performance.
- Identify bottlenecks, suggest and implement changes (e.g., indexes, schema tweaks).
- Report on improvements after changes.

**Files:**  
[performance Monitoring](performance_monitoring.md)

---
