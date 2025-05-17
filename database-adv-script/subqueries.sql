
--Write a non-correlated query to find all properties where the average rating is greater than 4.0 using a subquery.

SELECT properties.name AS Property_name
FROM properties
wHERE property_id IN(
    SELECT property_id
    FROM reviews
    GROUP BY  property_id
    HAVING AVG(rating) > 4.0
);

--Write a correlated subquery to find users who have made more than 3 bookings.

SELECT u.first_name, u.last_name
FROM user u
WHERE (
    SELECT COUNT(*)
    FROM bookings b
    WHERE b.user_id = u.user_id
) > 3;

