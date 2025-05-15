-- Find all properties where the average rating is greater than 4.0 (Non-Correlated Subquery)
SELECT property_id, name, location
FROM Property
WHERE property_id IN (
    SELECT property_id
    FROM Review
    GROUP BY property_id
    HAVING AVG(rating) > 4.0
);

-- Find users who have made more than 3 bookings (Correlated Subquery)
SELECT user_id, first_name, last_name
FROM User AS u
WHERE (
    SELECT COUNT(*) 
    FROM Booking AS b 
    WHERE b.user_id = u.user_id
) > 3;