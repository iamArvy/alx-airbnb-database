SELECT
  *
FROM
  Properties
WHERE
  id IN (
    SELECT
      property_id
    FROM
      Reviews
    GROUP BY
      property_id
    HAVING
      AVG(rating) > 4.0
  );

-- This query retrieves properties that have an average rating greater than 4.0 by using a subquery to filter properties based on their reviews.
SELECT
  *
FROM
  Users u
WHERE
  (
    SELECT
      COUNT(*)
    FROM
      Bookings b
    WHERE
      b.user_id = u.id
  ) > 3;

-- This query retrieves users who have made more than 3 bookings by using a correlated subquery to count bookings for each user.