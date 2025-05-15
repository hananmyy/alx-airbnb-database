-- Index frequently used columns in the User table
CREATE INDEX idx_user_email ON User(email);
CREATE INDEX idx_user_role ON User(role);

-- Index frequently used columns in the Property table
CREATE INDEX idx_property_location ON Property(location);
CREATE INDEX idx_property_price ON Property(pricepernight);

-- Index frequently used columns in the Booking table
CREATE INDEX idx_booking_status ON Booking(status);
CREATE INDEX idx_booking_dates ON Booking(start_date, end_date);

-- Measure performance before and after indexing
EXPLAIN ANALYZE
SELECT * FROM Booking 
WHERE status = 'confirmed' AND start_date BETWEEN '2024-01-01' AND '2024-12-31';

EXPLAIN ANALYZE
SELECT * FROM User 
WHERE email = 'testuser@example.com';

EXPLAIN ANALYZE
SELECT * FROM Property 
WHERE location = 'New York' ORDER BY pricepernight DESC;