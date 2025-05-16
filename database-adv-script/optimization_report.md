## EXPLAIN Analysis for [performance SQL Query](performance.sql)

### Summary Table

| Table       | Access Type             | Key Used         | Rows Examined | Extra Info                              |
|-------------|-------------------------|------------------|----------------|------------------------------------------|
| `p` (properties) | ALL (Full Table Scan)    | None             | 2              | None                                     |
| `b` (bookings)   | ALL (Full Table Scan)    | None (indexes possible) | 2      | Using where; Using join buffer (hash join) |
| `u` (users)      | eq_ref (Primary Key Lookup) | PRIMARY       | 1              | None                                     |
| `pay` (payments) | ALL (Full Table Scan)    | None (index possible) | 2       | Using where; Using join buffer (hash join) |

---

### 🔍 Key Observations

- **Full table scans on `properties`, `bookings`, and `payments`:**  
  The query is scanning the entire tables, indicating that indexes are not being utilized effectively. This becomes a performance issue as data volume increases.

- **Possible indexes not used:**  
  Although `possible_keys` include helpful indexes for `bookings` and `payments`, MySQL did not use them (`key: null`). This may be due to outdated statistics or insufficient selectivity of the indexed columns.

- **Efficient use of primary key for `users`:**  
  The `users` table is accessed using an `eq_ref` join with the primary key, which is optimal.

- **Join buffer with hash join:**  
  The `Extra` field for `bookings` and `payments` mentions `"Using join buffer (hash join)"`. This means MySQL is using a hash join strategy in memory, which is generally less efficient than indexed joins.

---
