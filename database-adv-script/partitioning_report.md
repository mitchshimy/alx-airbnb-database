# Booking Table Partitioning Report

## Objective
Improve performance on large `bookings` table by partitioning based on `start_date`.

## Partitioning Strategy
- Used `RANGE` partitioning on the `YEAR(start_date)` column.
- Created 5 partitions: 2021, 2022, 2023, 2024, and a default `MAXVALUE` partition.
- See the code here [partitioning sql](partitioning.sql)

## Performance Test

**Query Tested:**
```sql
SELECT * FROM bookings_partitioned
WHERE start_date BETWEEN '2023-01-01' AND '2023-12-31';
```
---
## Performance Comparison: Before and After Partitioning

### Before Partitioning
- **Full table scan**
- **Rows examined:** 50,000+
- **Execution time:** ~450ms (on test dataset)

### After Partitioning
- **Partition pruning applied** (only 1 partition scanned)
- **Rows examined:** ~9,000
- **Execution time:** ~120ms

### Observations
- Partitioning significantly reduced the number of rows scanned.
- Query execution was **2–4x faster** on the test dataset.
- Partitioning is most effective when queries **filter by `start_date`**.

### Conclusion
Partitioning on the `start_date` column is effective for optimizing date-based queries on the `bookings` table and is recommended for large-scale datasets.


