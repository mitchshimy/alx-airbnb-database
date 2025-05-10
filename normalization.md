# Airbnb Clone Database Schema

## 📘 Overview

This database schema powers an Airbnb-like application with clearly defined entities for users, properties, bookings, payments, reviews, and messages. It is designed for efficiency, clarity, and normalized to **Third Normal Form (3NF)** to eliminate redundancy and maintain data integrity.

---

## 🧱 Entity Tables

### 1. **User**

| Column        | Type                        | Constraints                             |
|---------------|-----------------------------|------------------------------------------|
| user_id       | UUID                        | Primary Key, Indexed                     |
| first_name    | VARCHAR                     | NOT NULL                                 |
| last_name     | VARCHAR                     | NOT NULL                                 |
| email         | VARCHAR                     | UNIQUE, NOT NULL                         |
| password_hash | VARCHAR                     | NOT NULL                                 |
| phone_number  | VARCHAR                     | NULL                                     |
| role          | ENUM (guest, host, admin)   | NOT NULL                                 |
| created_at    | TIMESTAMP                   | DEFAULT CURRENT_TIMESTAMP                |

✅ **3NF Justification:** All attributes depend only on `user_id`. No partial or transitive dependencies.

---

### 2. **Property**

| Column        | Type      | Constraints                          |
|---------------|-----------|---------------------------------------|
| property_id   | UUID      | Primary Key, Indexed                  |
| host_id       | UUID      | Foreign Key → User(user_id)          |
| name          | VARCHAR   | NOT NULL                              |
| description   | TEXT      | NOT NULL                              |
| location      | VARCHAR   | NOT NULL                              |
| pricepernight | DECIMAL   | NOT NULL                              |
| created_at    | TIMESTAMP | DEFAULT CURRENT_TIMESTAMP             |
| updated_at    | TIMESTAMP | ON UPDATE CURRENT_TIMESTAMP           |

✅ **3NF Justification:** No derived or dependent attributes other than `host_id` FK.

---

### 3. **Booking**

| Column        | Type                         | Constraints                             |
|---------------|------------------------------|------------------------------------------|
| booking_id    | UUID                         | Primary Key, Indexed                     |
| property_id   | UUID                         | Foreign Key → Property(property_id)      |
| user_id       | UUID                         | Foreign Key → User(user_id)              |
| start_date    | DATE                         | NOT NULL                                 |
| end_date      | DATE                         | NOT NULL                                 |
| total_price   | DECIMAL                      | NOT NULL                                 |
| status        | ENUM (pending, confirmed, canceled) | NOT NULL                      |
| created_at    | TIMESTAMP                    | DEFAULT CURRENT_TIMESTAMP                |

✅ **3NF Justification:** Every attribute is directly dependent on `booking_id`. While `total_price` is derived, it's explicitly stored for performance and not a transitive dependency.

---

### 4. **Payment**

| Column        | Type                      | Constraints                              |
|---------------|---------------------------|-------------------------------------------|
| payment_id    | UUID                      | Primary Key, Indexed                      |
| booking_id    | UUID                      | Foreign Key → Booking(booking_id)         |
| amount        | DECIMAL                   | NOT NULL                                  |
| payment_date  | TIMESTAMP                 | DEFAULT CURRENT_TIMESTAMP                 |
| payment_method| ENUM (credit_card, paypal, stripe) | NOT NULL                          |

✅ **3NF Justification:** All fields are directly dependent on `payment_id`. No transitive or partial dependencies.

---

### 5. **Review**

| Column      | Type      | Constraints                          |
|-------------|-----------|---------------------------------------|
| review_id   | UUID      | Primary Key, Indexed                  |
| property_id | UUID      | Foreign Key → Property(property_id)   |
| user_id     | UUID      | Foreign Key → User(user_id)           |
| rating      | INTEGER   | CHECK: 1 ≤ rating ≤ 5, NOT NULL       |
| comment     | TEXT      | NOT NULL                              |
| created_at  | TIMESTAMP | DEFAULT CURRENT_TIMESTAMP             |

✅ **3NF Justification:** No derived or redundant data. All fields depend directly on the primary key.

---

### 6. **Message**

| Column       | Type      | Constraints                          |
|--------------|-----------|---------------------------------------|
| message_id   | UUID      | Primary Key, Indexed                  |
| sender_id    | UUID      | Foreign Key → User(user_id)           |
| recipient_id | UUID      | Foreign Key → User(user_id)           |
| message_body | TEXT      | NOT NULL                              |
| sent_at      | TIMESTAMP | DEFAULT CURRENT_TIMESTAMP             |

✅ **3NF Justification:** All fields directly depend on `message_id`, with no derived or transitive dependencies.

---

## ✅ Normalization Summary

| Normal Form | Description                                                               | Status  |
|-------------|----------------------------------------------------------------------------|---------|
| 1NF         | All columns have atomic values and unique records                         | ✅ Passed |
| 2NF         | No partial dependency on a composite primary key                          | ✅ Passed |
| 3NF         | No transitive dependency; all fields depend only on the primary key       | ✅ Passed |

---

## 📌 Notes
- The schema uses UUIDs for all primary keys to ensure global uniqueness.
- ENUMs are used for controlled value constraints (e.g., roles, booking status, payment method).

