## 🌱 Database Seeding with Sample Data

To simulate real-world usage and support development and testing, the database is seeded with realistic sample data using SQL `INSERT` statements. This helps verify the correctness of relationships and constraints within the schema.

### ✅ Entities Covered

- **Users**: Includes a guest, a host, and an admin to reflect different roles.
- **Properties**: Multiple properties listed by the host.
- **Bookings**: Bookings made by a guest for different properties.
- **Payments**: Payments linked to bookings using various payment methods.
- **Reviews**: User-generated feedback tied to properties.
- **Messages**: Simulated communication between guest and host.

  # 📊 Sample Data Overview

This section provides example records for each table in the Airbnb Clone database schema.

---

## 🧑‍💼 Users

| user_id       | first_name | last_name | email              | password_hash | phone_number | role  |
|---------------|------------|-----------|--------------------|----------------|---------------|--------|
| uuid-user-1   | Alice      | Smith     | alice@example.com  | hash1          | 1234567890    | guest  |
| uuid-user-2   | Bob        | Jones     | bob@example.com    | hash2          | 0987654321    | host   |
| uuid-user-3   | Charlie    | Brown     | charlie@example.com| hash3          | *(null)*      | admin  |

---

## 🏠 Properties

| property_id      | host_id      | name           | description                          | location | pricepernight |
|------------------|--------------|----------------|--------------------------------------|----------|----------------|
| uuid-property-1  | uuid-user-2  | Cozy Cottage   | A beautiful cottage in the woods.   | Nairobi  | 75.00          |
| uuid-property-2  | uuid-user-2  | City Apartment | Modern apartment in the city center.| Mombasa  | 120.00         |

---

## 📅 Bookings

| booking_id      | property_id     | user_id      | start_date | end_date   | total_price | status    |
|------------------|------------------|--------------|------------|------------|--------------|------------|
| uuid-booking-1   | uuid-property-1  | uuid-user-1 | 2025-06-01 | 2025-06-05 | 300.00       | confirmed  |
| uuid-booking-2   | uuid-property-2  | uuid-user-1 | 2025-07-10 | 2025-07-12 | 240.00       | pending    |

---

## 💳 Payments

| payment_id     | booking_id      | amount | payment_method |
|----------------|------------------|--------|----------------|
| uuid-payment-1 | uuid-booking-1   | 300.00 | credit_card    |
| uuid-payment-2 | uuid-booking-2   | 240.00 | paypal         |

---

## ⭐ Reviews

| review_id     | property_id     | user_id      | rating | comment                               |
|---------------|------------------|--------------|--------|----------------------------------------|
| uuid-review-1 | uuid-property-1  | uuid-user-1 | 5      | Amazing experience! Highly recommended.|
| uuid-review-2 | uuid-property-2  | uuid-user-1 | 4      | Very clean and well located.           |

---

## 💬 Messages

| message_id      | sender_id     | recipient_id  | message_body                                  |
|------------------|----------------|----------------|------------------------------------------------|
| uuid-message-1   | uuid-user-1    | uuid-user-2    | Is the cottage available in August?           |
| uuid-message-2   | uuid-user-2    | uuid-user-1    | Yes, it is available from Aug 5-15.           |

---


### 📄 File

- [`airbnb_seed.sql`](seed.sql)

### 🚀 Purpose

- Validates foreign key relationships and constraints.
- Populates the database for frontend/backend integration during development.
- Useful for testing features like booking flows, messaging, and user dashboards.


