-- Drop existing table if needed (backup first)
DROP TABLE IF EXISTS Bookings;

-- Create a partitioned Bookings table
CREATE TABLE
  Bookings (
    id INT NOT NULL,
    user_id INT NOT NULL,
    property_id INT NOT NULL,
    payment_id INT,
    start_date DATE NOT NULL,
    end_date DATE,
    PRIMARY KEY (id, start_date) -- Partition key must be part of primary key
  )
PARTITION BY
  RANGE (YEAR (start_date)) (
    PARTITION p2022
    VALUES
      LESS THAN (2023),
      PARTITION p2023
    VALUES
      LESS THAN (2024),
      PARTITION p2024
    VALUES
      LESS THAN (2025),
      PARTITION pmax
    VALUES
      LESS THAN MAXVALUE
  );