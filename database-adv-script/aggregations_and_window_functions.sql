-- Find the total number of bookings made by each user using COUNT and GROUP BY
SELECT 
    u.user_id,
    u.first_name,
    u.last_name,
    COUNT(b.booking_id) AS total_bookings
FROM User AS u
LEFT JOIN Booking AS b ON u.user_id = b.user_id
GROUP BY u.user_id, u.first_name, u.last_name;

-- Rank properties based on the total number of bookings they have received using ROW_NUMBER and RANK
SELECT 
    p.property_id,
    p.name,
    p.location,
    COUNT(b.booking_id) AS total_bookings,
    ROW_NUMBER() OVER(ORDER BY COUNT(b.booking_id) DESC) AS row_num,
    RANK() OVER(ORDER BY COUNT(b.booking_id) DESC) AS rank_num
FROM Property AS p
LEFT JOIN Booking AS b ON p.property_id = b.property_id
GROUP BY p.property_id, p.name, p.location
ORDER BY total_bookings DESC;