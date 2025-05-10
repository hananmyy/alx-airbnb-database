INSERT INTO User (user_id, first_name, last_name, email, password_hash, phone_number, role) 
VALUES 
('uuid1', 'Frieda', 'Kemboi', 'alicek@gmail.com', 'hashed_password', '+254712345678', 'host'),
('uuid2', 'Bob', 'Kimani', 'bob@gmail.com', 'hashed_password', NULL, 'guest');


INSERT INTO Property (property_id, host_id, name, description, location, pricepernight) 
VALUES 
('uuid3', 'uuid1', 'Oceanfront Villa', 'Beautiful sea view property', 'Mombasa, Kenya', 120.00),
('uuid4', 'uuid1', 'Mountain Cabin', 'Cozy cabin in the hills', 'Nyeri, Kenya', 75.00);


INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, created_at)
VALUES 
('uuid5', 'uuid3', 'uuid2', '2023-10-01', '2023-10-07', 840.00, CURRENT_TIMESTAMP),
('uuid6', 'uuid4', 'uuid2', '2023-11-01', '2023-11-05', 300.00, CURRENT_TIMESTAMP);


INSERT INTO Payment (payment_id, booking_id, amount, payment_date, payment_method)
VALUES 
('uuid7', 'uuid5', 840.00, CURRENT_TIMESTAMP, 'credit_card'),
('uuid8', 'uuid6', 300.00, CURRENT_TIMESTAMP, 'paypal');


INSERT INTO Review (review_id, property_id, user_id, rating, comment, created_at)
VALUES 
('uuid9', 'uuid3', 'uuid2', 5, 'Amazing place!', CURRENT_TIMESTAMP),
('uuid10', 'uuid4', 'uuid2', 4, 'Very cozy cabin.', CURRENT_TIMESTAMP);


INSERT INTO Message (message_id, sender_id, recipient_id, message_body, sent_at)
VALUES 
('uuid11', 'uuid2', 'uuid1', 'Hi Frieda, I loved your property!', CURRENT_TIMESTAMP),
('uuid12', 'uuid1', 'uuid2', 'Thanks Bob! Glad you enjoyed it.', CURRENT_TIMESTAMP);