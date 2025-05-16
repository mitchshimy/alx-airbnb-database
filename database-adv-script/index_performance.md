# Index Performance Analysis

## Objective
Identify high-usage columns in the `users`, `bookings`, and `properties` tables and create indexes to improve query performance. Measure query execution before and after indexing using `EXPLAIN` or `ANALYZE`.

---

## 1. Identified High-Usage Columns

| Table      | Column         | Usage Context                      |
|------------|----------------|----------------------------------|
| `users`    | `email`        | Used in `WHERE` and `JOIN` clauses for user lookups and authentication |
| `properties` | `host_id`      | Used in `JOIN` with `users` to identify property owners                |
| `bookings` | `property_id`  | Used in `WHERE`, `JOIN`, and filtering bookings per property            |
| `bookings` | `user_id`      | Used in `WHERE` and `JOIN` to find bookings by user                     |
| `payments` | `booking_id`   | Used in `JOIN` to link payments to bookings                             |
| `reviews`  | `property_id`  | Used in filtering and joining reviews to properties                    |
| `reviews`  | `user_id`      | Used to link reviews to users                                          |

---

## 2. Index Creation Statements

View them here 👉 [](database_index.sql)

---

### 3. Query Performance Measurement

#### Before Adding Indexes
- Queries involving joins and filters on the above columns showed full table scans.
- Example output from `EXPLAIN` indicated high cost and large numbers of row scans.
- Queries were slower, especially on larger datasets.

#### After Adding Indexes
- Queries started using index scans instead of full scans.
- `EXPLAIN` output showed reduced cost and fewer rows scanned.
- Faster query execution time observed in `ANALYZE` outputs.
- Joins on indexed columns became more efficient.

---

### 4. How to Interpret EXPLAIN Output

- **Type:** Prefer `ref`, `range`, or `const` over `ALL` (which means full table scan).
- **Key:** Shows which index is being used for the query.
- **Rows:** Estimated number of rows scanned; fewer rows scanned means better performance.
- **Extra:** Look for keywords like `Using index`, `Using where` which indicate efficient query execution.
- **Execution Time:** Lower actual time means better query performance.

---

### 5. Recommendations

- Monitor query logs for slow queries and add indexes accordingly.
- Consider composite indexes if queries filter on multiple columns.
- Regularly analyze and optimize indexes to balance read/write performance.
- Use `ANALYZE TABLE` periodically to update optimizer statistics.


