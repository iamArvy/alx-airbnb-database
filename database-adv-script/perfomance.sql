-- Analyze the performance of a complex join query
EXPLAIN
SELECT
  b.id AS booking_id,
  b.date,
  u.id AS user_id,
  u.name AS user_name,
  u.email,
  p.id AS property_id,
  p.name AS property_name,
  p.location,
  pay.id AS payment_id,
  pay.amount,
  pay.status
FROM
  Bookings b
  JOIN Users u ON b.user_id = u.id
  JOIN Properties p ON b.property_id = p.id
  JOIN Payments pay ON b.payment_id = pay.id
WHERE
  pay.status = 'completed'
  AND b.date >= '2024-01-01';