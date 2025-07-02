-- This query retrieves the total number of bookings made by each user by grouping the Bookings table by user_id and counting the entries.
SELECT
  user_id,
  COUNT(*) AS total_bookings
FROM
  Bookings
GROUP BY
  user_id;

-- This query retrieves the total number of bookings for each property and ranks them in descending order based on the number of bookings.
SELECT
  property_id,
  COUNT(*) AS total_bookings,
  RANK() OVER (
    ORDER BY
      COUNT(*) DESC
  ) AS rank_with_ties,
  ROW_NUMBER() OVER (
    ORDER BY
      COUNT(*) DESC
  ) AS unique_rank
FROM
  Bookings
GROUP BY
  property_id;