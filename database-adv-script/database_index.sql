-- Measure query performance BEFORE indexing
EXPLAIN ANALYZE
SELECT u.first_name, u.last_name
FROM user u
JOIN bookings b ON u.user_id = b.user_id
WHERE b.booking_date >= '2024-01-01';

-- Index on user_id in the user table (used in joins and filters)
CREATE INDEX idx_user_user_id ON user(user_id);

-- Index on user_id in the bookings table (used in joins and filters)
CREATE INDEX idx_bookings_user_id ON bookings(user_id);

-- Index on property_id in the bookings table
CREATE INDEX idx_bookings_property_id ON bookings(property_id);

-- Index on property_id in the properties table
CREATE INDEX idx_properties_property_id ON properties(property_id);

-- Index on pricepernight for filtering/sorting
CREATE INDEX idx_properties_pricepernight ON properties(pricepernight);

-- Index on booking_date in the bookings table (if used for filtering or ordering)
CREATE INDEX idx_bookings_booking_date ON bookings(booking_date);

-- Measure query performance AFTER indexing
EXPLAIN ANALYZE
SELECT u.first_name, u.last_name
FROM user u
JOIN bookings b ON u.user_id = b.user_id
WHERE b.booking_date >= '2024-01-01';
