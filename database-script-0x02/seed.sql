
-- Sample data for User table
INSERT INTO users (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES
  ('uuid-user-1', 'Alice', 'Smith', 'alice@example.com', 'hash1', '1234567890', 'guest'),
  ('uuid-user-2', 'Bob', 'Jones', 'bob@example.com', 'hash2', '0987654321', 'host'),
  ('uuid-user-3', 'Charlie', 'Brown', 'charlie@example.com', 'hash3', NULL, 'admin');

-- Sample data for Property table
INSERT INTO properties (property_id, host_id, name, description, location, pricepernight)
VALUES
  ('uuid-property-1', 'uuid-user-2', 'Cozy Cottage', 'A beautiful cottage in the woods.', 'Nairobi', 75.00),
  ('uuid-property-2', 'uuid-user-2', 'City Apartment', 'Modern apartment in the city center.', 'Mombasa', 120.00);

-- Sample data for Booking table
INSERT INTO bookings (booking_id, property_id, user_id, start_date, end_date, total_price, status)
VALUES
  ('uuid-booking-1', 'uuid-property-1', 'uuid-user-1', '2025-06-01', '2025-06-05', 300.00, 'confirmed'),
  ('uuid-booking-2', 'uuid-property-2', 'uuid-user-1', '2025-07-10', '2025-07-12', 240.00, 'pending');

-- Sample data for Payment table
INSERT INTO payments (payment_id, booking_id, amount, payment_method)
VALUES
  ('uuid-payment-1', 'uuid-booking-1', 300.00, 'credit_card'),
  ('uuid-payment-2', 'uuid-booking-2', 240.00, 'paypal');

-- Sample data for Review table
INSERT INTO reviews (review_id, property_id, user_id, rating, comment)
VALUES
  ('uuid-review-1', 'uuid-property-1', 'uuid-user-1', 5, 'Amazing experience! Highly recommended.'),
  ('uuid-review-2', 'uuid-property-2', 'uuid-user-1', 4, 'Very clean and well located.');

-- Sample data for Message table
INSERT INTO messages (message_id, sender_id, recipient_id, message_body)
VALUES
  ('uuid-message-1', 'uuid-user-1', 'uuid-user-2', 'Is the cottage available in August?'),
  ('uuid-message-2', 'uuid-user-2', 'uuid-user-1', 'Yes, it is available from Aug 5-15.');
