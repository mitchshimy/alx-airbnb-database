--find the total number of bookings made by each user

SELECT u.user_id, u.first_name, u.last_name, COUNT(b.user_id) AS No_of_Bookings
FROM user u
LEFT JOIN bookings b
ON u.user_id = b.user_id
GROUP BY u.user_id;

--rank properties based on the total number of bookings they have received

--rank properties based on the total number of
--bookings they have received
--RANK FUNCTION
SELECT 
    p.property_id,
    p.name AS Property_name,
    COUNT(b.booking_id) AS No_of_Bookings,
    RANK() OVER (ORDER BY COUNT(b.booking_id) DESC) AS Booking_Rank
FROM properties p
LEFT JOIN bookings b
ON p.property_id = b.property_id
GROUP BY p.property_id, p.name
ORDER BY Booking_Rank;

--ROW_NUMBER FUNCTION
SELECT 
    p.property_id,
    p.name AS property_name,
    COUNT(b.booking_id) AS total_bookings,
    ROW_NUMBER() OVER (ORDER BY COUNT(b.booking_id) DESC) AS booking_rank
FROM properties p
LEFT JOIN bookings b
ON p.property_id = b.property_id