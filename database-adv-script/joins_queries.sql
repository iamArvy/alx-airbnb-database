SELECT
  Bookings.id AS booking_id,
  Bookings.date,
  Users.id AS user_id,
  Users.name,
  Users.email
FROM
  Bookings
  INNER JOIN Users ON Bookings.user_id = Users.id;

-- This query retrieves booking details along with user information by joining the Bookings and Users tables.
SELECT
  Properties.id AS property_id,
  Properties.name,
  Reviews.id AS review_id,
  Reviews.rating,
  Reviews.comment
FROM
  Properties
  LEFT JOIN Reviews ON Properties.id = Reviews.property_id;

-- This query retrieves all properties and their associated reviews, including properties that have no reviews.

SELECT
  Users.id AS user_id,
  Users.name,
  Bookings.id AS booking_id,
  Bookings.date
FROM
  Users
  FULL OUTER JOIN Bookings ON Users.id = Bookings.user_id;

-- This query retrieves all users and their bookings, including users with no bookings and bookings with no associated users.