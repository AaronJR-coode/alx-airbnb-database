SELECT u.user_id, u.username
FROM users u
WHERE (
    SELECT COUNT(*)
    FROM bookings b
    WHERE b.user_id = u.user_id
) > 3;

SELECT u.user_id, u.username
FROM users u
JOIN bookings b ON u.user_id = b.user_id
GROUP BY u.user_id, u.username
HAVING COUNT(b.booking_id) > 3;

