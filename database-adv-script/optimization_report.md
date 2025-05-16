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


## Refactored Query for Better Performance

### Optimization Goals

To refactor the given query for better performance, we aim to:

- Minimize full table scans by ensuring indexes are used.
- Avoid unnecessary `LEFT JOIN` if all bookings have a payment.
- Select only needed columns.
- Use explicit `INNER JOIN` where appropriate.
- Leverage indexed columns in `WHERE` or `JOIN` clauses.

---

### 💡 Refactored SQL Query

```sql
-- Ensure indexes exist on: bookings.user_id, bookings.property_id, payments.booking_id

SELECT 
    b.booking_id,
    b.created_at,
    u.user_id,
    u.first_name,
    u.last_name,
    p.property_id,
    p.name AS property_name,
    p.location,
    pay.payment_id,
    pay.amount,
    pay.payment_date
FROM bookings b
INNER JOIN users u ON b.user_id = u.user_id
INNER JOIN properties p ON b.property_id = p.property_id
LEFT JOIN payments pay ON b.booking_id = pay.booking_id
WHERE b.created_at >= CURDATE() - INTERVAL 1 YEAR;  -- optional: filter recent bookings


---
