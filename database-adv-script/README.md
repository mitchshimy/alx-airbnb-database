# ALX Airbnb Database — Advanced SQL Scripts

This repository contains advanced SQL scripts for the Airbnb database project, focusing on mastering SQL joins with complex queries.

## About the Queries

- The main query demonstrates how to use **INNER JOINs** to retrieve bookings along with the respective users who made those bookings and the properties booked.
- The query uses table aliases for brevity and clarity.
- It selects user details (`user_id`, `first_name`, `last_name`), booking details (`booking_id`), and the name of the property (`property_name`).
- Explicit `INNER JOIN` syntax is used to enhance readability.
- Column aliasing (`AS property_name`) clarifies the output columns.

[Query](joins_queries.sql)
