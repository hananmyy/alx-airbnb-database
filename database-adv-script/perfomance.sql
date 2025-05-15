-- The following query retrieves all bookings along with user details, property details, and payment information.
-- It uses JOIN to combine data from the Booking, User, Property, and Payment tables.

SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status,
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    p.property_id,
    p.name AS property_name,
    p.location AS property_location,
    py.payment_id,
    py.amount,
    py.payment_method
FROM Booking AS b
JOIN User AS u ON b.user_id = u.user_id
AND u.role = 'guest' -- Assuming we want to filter by user role
JOIN Property AS p ON b.property_id = p.property_id
LEFT JOIN Payment AS py ON py.booking_id = b.booking_id;


-- Analyze the performance of the above query using EXPLAIN ANALYZE
-- Potentially, the query can be optimized by creating indexes on the columns used in the JOIN conditions and WHERE clauses.
-- For example, creating indexes on user_id in User and Booking tables, property_id in Property and Booking tables,
-- and booking_id in Payment table can significantly improve the performance of the JOIN operations.
EXPLAIN ANALYZE
SELECT 
    b.booking_id, b.start_date, b.end_date, b.total_price, b.status,
    u.user_id, u.first_name, u.last_name, u.email,
    p.property_id, p.name AS property_name, p.location AS property_location,
    py.payment_id, py.amount, py.payment_method
FROM Booking AS b
JOIN User AS u ON b.user_id = u.user_id
JOIN Property AS p ON b.property_id = p.property_id
LEFT JOIN Payment AS py ON py.booking_id = b.booking_id;




-- Optimized query to Improve Performance
SELECT 
    b.booking_id, b.start_date, b.end_date, b.total_price, b.status,
    u.first_name, u.last_name, u.email,
    p.name AS property_name, p.location AS property_location,
    py.amount, py.payment_method
FROM Booking AS b
JOIN User AS u ON b.user_id = u.user_id
JOIN Property AS p ON b.property_id = p.property_id
LEFT JOIN Payment AS py ON py.booking_id = b.booking_id
WHERE b.status = 'confirmed'
ORDER BY b.start_date DESC;