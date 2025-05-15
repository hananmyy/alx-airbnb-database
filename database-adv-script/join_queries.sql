-- Retrieve bookings along with the respective users who made the booking (INNER JOIN)
SELECT 
    b.booking_id,
    b.property_id,
    u.user_id,
    u.first_name,
    u.last_name,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status
FROM Booking AS b
INNER JOIN User AS u ON b.user_id = u.user_id;

-- Retrieve all properties and their reviews, including properties that have no reviews (LEFT JOIN)
SELECT 
    p.property_id,
    p.name,
    p.location,
    p.pricepernight,
    r.review_id,
    r.rating,
    r.comment
FROM Property AS p
LEFT JOIN Review AS r ON p.property_id = r.property_id;

-- Retrieve all users and all bookings, even if the user has no booking or a booking is not linked to a user (FULL OUTER JOIN)
SELECT 
    u.user_id,
    u.first_name,
    u.last_name,
    b.booking_id,
    b.property_id,
    b.start_date,
    b.end_date
FROM User AS u
FULL OUTER JOIN Booking AS b ON u.user_id = b.user_id;