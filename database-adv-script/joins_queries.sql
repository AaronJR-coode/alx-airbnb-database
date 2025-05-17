SELECT bookings.booking_id, bookings.booking_date, users.user_id, users.username
FROM bookings
INNER JOIN users ON bookings.user_id = users.user_id;

SELECT properties.property_id, properties.property_name, reviews.review_id, reviews.review_text
FROM properties
LEFT JOIN reviews ON properties.property_id = reviews.property_id;

SELECT users.user_id, users.username, bookings.booking_id, bookings.booking_date
FROM users
FULL OUTER JOIN bookings ON users.user_id = bookings.user_id;

SELECT property_id, property_name
FROM properties
WHERE property_id IN (
    SELECT property_id
    FROM reviews
    GROUP BY property_id
    HAVING AVG(rating) > 4.0
);

SELECT u.user_id, u.username
FROM users u
WHERE (
    SELECT COUNT(*)
    FROM bookings b
    WHERE b.user_id = u.user_id
) > 3;
