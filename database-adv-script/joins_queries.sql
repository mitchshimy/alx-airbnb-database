SELECT 
  u.user_id, 
  u.first_name, 
  u.last_name, 
  b.booking_id, 
  p.name AS property_name
FROM bookings b
INNER JOIN user u ON b.user_id = u.user_id
INNER JOIN properties p ON b.property_id = p.property_id;
