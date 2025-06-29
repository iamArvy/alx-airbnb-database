-- seed.sql
-- Insert Roles
INSERT INTO
  Roles (name)
VALUES
  ('admin'),
  ('host'),
  ('guest');

-- Insert Users
INSERT INTO
  Users (
    first_name,
    last_name,
    email,
    password_hash,
    phone_number,
    role_id
  )
VALUES
  (
    'John',
    'Doe',
    'john@example.com',
    'hashed_pw_1',
    '1234567890',
    (
      SELECT
        role_id
      FROM
        Roles
      WHERE
        name = 'host'
    )
  ),
  (
    'Jane',
    'Smith',
    'jane@example.com',
    'hashed_pw_2',
    '0987654321',
    (
      SELECT
        role_id
      FROM
        Roles
      WHERE
        name = 'guest'
    )
  ),
  (
    'Admin',
    'User',
    'admin@example.com',
    'hashed_pw_3',
    NULL,
    (
      SELECT
        role_id
      FROM
        Roles
      WHERE
        name = 'admin'
    )
  );

-- Insert Properties
INSERT INTO
  Properties (
    host_id,
    name,
    description,
    location,
    price_per_night
  )
VALUES
  (
    (
      SELECT
        user_id
      FROM
        Users
      WHERE
        email = 'john@example.com'
    ),
    'Beachside Bungalow',
    'A lovely house near the beach.',
    'Lagos, Nigeria',
    150.00
  );

-- Insert Bookings
INSERT INTO
  Bookings (
    property_id,
    user_id,
    start_date,
    end_date,
    total_price,
    status
  )
VALUES
  (
    (
      SELECT
        property_id
      FROM
        Properties
      WHERE
        name = 'Beachside Bungalow'
    ),
    (
      SELECT
        user_id
      FROM
        Users
      WHERE
        email = 'jane@example.com'
    ),
    '2025-07-01',
    '2025-07-05',
    600.00,
    'confirmed'
  );

-- Insert Payment Methods
INSERT INTO
  Payment_Methods (name)
VALUES
  ('paypal'),
  ('stripe'),
  ('apple');

-- Insert Payments
INSERT INTO
  Payments (booking_id, amount, payment_method)
VALUES
  (
    (
      SELECT
        booking_id
      FROM
        Bookings
      LIMIT
        1
    ),
    600.00,
    (
      SELECT
        payment_method_id
      FROM
        Payment_Methods
      WHERE
        name = 'paypal'
    )
  );

-- Insert Reviews
INSERT INTO
  Reviews (property_id, user_id, rating, comment)
VALUES
  (
    (
      SELECT
        property_id
      FROM
        Properties
      LIMIT
        1
    ),
    (
      SELECT
        user_id
      FROM
        Users
      WHERE
        email = 'jane@example.com'
    ),
    5,
    'Fantastic stay with great service!'
  );

-- Insert Messages
INSERT INTO
  Messages (sender_id, recipient_id, message_body)
VALUES
  (
    (
      SELECT
        user_id
      FROM
        Users
      WHERE
        email = 'jane@example.com'
    ),
    (
      SELECT
        user_id
      FROM
        Users
      WHERE
        email = 'john@example.com'
    ),
    'Hi, I wanted to confirm the check-in time.'
  );