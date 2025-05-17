-- User table
CREATE INDEX idx_user_email ON users (email);
CREATE INDEX idx_user_created_at ON users (created_at);

-- Booking table
CREATE INDEX idx_booking_user_id ON bookings (user_id);
CREATE INDEX idx_booking_property_id ON bookings (property_id);
CREATE INDEX idx_booking_booking_date ON bookings (booking_date);

-- Property table
CREATE INDEX idx_property_location ON properties (location);
CREATE INDEX idx_property_price ON properties (price);

-- Booking table: Frequently queried by user_id and booking_date
CREATE INDEX idx_booking_user_date ON bookings (user_id, booking_date);

-- Property table: Frequently queried by location and price
CREATE INDEX idx_property_location_price ON properties (location, price);

EXPLAIN ANALYZE
SELECT u.user_id, u.email, b.booking_id, p.property_id
FROM users u
JOIN bookings b ON u.user_id = b.user_id
JOIN properties p ON b.property_id = p.property_id
WHERE u.created_at > '2023-01-01'
ORDER BY p.price DESC;

EXPLAIN ANALYZE
SELECT u.user_id, u.email, b.booking_id, p.property_id
FROM users u
JOIN bookings b ON u.user_id = b.user_id
JOIN properties p ON b.property_id = p.property_id
WHERE u.created_at > '2023-01-01'
ORDER BY p.price DESC;

-- database_index.sql

-- User table indexes
CREATE INDEX idx_user_email ON users (email);
CREATE INDEX idx_user_created_at ON users (created_at);

-- Booking table indexes
CREATE INDEX idx_booking_user_id ON bookings (user_id);
CREATE INDEX idx_booking_property_id ON bookings (property_id);
CREATE INDEX idx_booking_booking_date ON bookings (booking_date);
CREATE INDEX idx_booking_user_date ON bookings (user_id, booking_date);

-- Property table indexes
CREATE INDEX idx_property_location ON properties (location);
CREATE INDEX idx_property_price ON properties (price);
CREATE INDEX idx_property_location_price ON properties (location, price);

