-- Step 1: Create a partitioned Booking table
CREATE TABLE Booking_Partitioned (
    booking_id UUID PRIMARY KEY,
    property_id UUID REFERENCES Property(property_id),
    user_id UUID REFERENCES User(user_id),
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL NOT NULL,
    status ENUM('pending', 'confirmed', 'canceled') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) PARTITION BY RANGE (start_date);

-- Step 2: Create partitions for different date ranges
CREATE TABLE Booking_2023 PARTITION OF Booking_Partitioned
    FOR VALUES FROM ('2023-01-01') TO ('2023-12-31');

CREATE TABLE Booking_2024 PARTITION OF Booking_Partitioned
    FOR VALUES FROM ('2024-01-01') TO ('2024-12-31');

CREATE TABLE Booking_2025 PARTITION OF Booking_Partitioned
    FOR VALUES FROM ('2025-01-01') TO ('2025-12-31');

-- Step 3: Test performance before and after partitioning
EXPLAIN ANALYZE 
SELECT * FROM Booking WHERE start_date BETWEEN '2024-06-01' AND '2024-06-30';

EXPLAIN ANALYZE 
SELECT * FROM Booking_Partitioned WHERE start_date BETWEEN '2024-06-01' AND '2024-06-30';