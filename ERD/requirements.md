# Airbnb Clone - Database Design

This document outlines the core entities and relationships used in the backend database schema for the Airbnb Clone project.

---

## 📘 Entity Overview

### 🧑‍💼 User
Represents a person using the platform (guest, host, or admin).

**Attributes:**
- `user_id` (PK)
- `first_name`
- `last_name`
- `email` (UNIQUE)
- `password_hash`
- `phone_number`
- `role` (ENUM: guest, host, admin)
- `created_at`

---

### 🏠 Property
Represents a listing posted by a host.

**Attributes:**
- `property_id` (PK)
- `host_id` (FK → User.user_id)
- `name`
- `description`
- `location`
- `pricepernight`
- `created_at`
- `updated_at`

---

### 📅 Booking
Represents a reservation made by a guest.

**Attributes:**
- `booking_id` (PK)
- `property_id` (FK → Property.property_id)
- `user_id` (FK → User.user_id)
- `start_date`
- `end_date`
- `total_price`
- `status` (ENUM: pending, confirmed, canceled)
- `created_at`

---

### 💳 Payment
Represents payment details for a booking.

**Attributes:**
- `payment_id` (PK)
- `booking_id` (FK → Booking.booking_id)
- `amount`
- `payment_date`
- `payment_method` (ENUM: credit_card, paypal, stripe)

---

### ⭐ Review
Represents feedback left by a guest for a property.

**Attributes:**
- `review_id` (PK)
- `property_id` (FK → Property.property_id)
- `user_id` (FK → User.user_id)
- `rating` (1–5)
- `comment`
- `created_at`

---

### 💬 Message
Represents communication between users.

**Attributes:**
- `message_id` (PK)
- `sender_id` (FK → User.user_id)
- `recipient_id` (FK → User.user_id)
- `message_body`
- `sent_at`

---

## 🔗 Relationships Summary

| Entity A     | Entity B     | Type         | Description                           |
|--------------|--------------|--------------|---------------------------------------|
| User         | Property     | 1-to-Many    | A host owns multiple properties       |
| User         | Booking      | 1-to-Many    | A guest can make many bookings        |
| Property     | Booking      | 1-to-Many    | A property can be booked many times   |
| Booking      | Payment      | 1-to-1       | Each booking has one payment          |
| Property     | Review       | 1-to-Many    | A property can have many reviews      |
| User         | Review       | 1-to-Many    | A user can post many reviews          |
| User ↔ User  | Message      | Many-to-Many | Users can message each other          |

---

## 📊 Entity-Relationship Diagram

To visualize the relationships described above, refer to the ERD diagram below:

[ERD Diagram](ERD.PNG)
