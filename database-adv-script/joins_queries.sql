SELECT 
  u.user_id, 
  u.first_name, 
  u.last_name, 
  b.booking_id, 
  p.name AS property_name
FROM bookings b
INNER JOIN user u ON b.user_id = u.user_id
INNER JOIN properties p ON b.property_id = p.property_id
ORDER BY b.booking_id ASC;

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
JOIN users u ON b.user_id = u.user_id
JOIN properties p ON b.property_id = p.property_id
LEFT JOIN payments pay ON b.booking_id = pay.booking_id
ORDER BY b.created_at DESC;

SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    u.user_id,
    u.first_name,
    u.last_name
FROM users u
RIGHT JOIN bookings b ON u.user_id = b.user_id
ORDER BY b.start_date ASC;


SELECT 
    u.user_id,
    u.first_name,
    u.last_name,
    b.booking_id,
    b.start_date,
    b.end_date
FROM users u
FULL OUTER JOIN bookings b ON u.user_id = b.user_id
ORDER BY u.user_id, b.booking_id;

