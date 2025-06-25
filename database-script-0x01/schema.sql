CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- User Table
CREATE TABLE
  Users (
    user_id UUID PRIMARY KEY DEFAULT uuid_generate_v4 (),
    first_name VARCHAR NOT NULL,
    last_name VARCHAR NOT NULL,
    email VARCHAR UNIQUE NOT NULL,
    password_hash VARCHAR NOT NULL,
    phone_number VARCHAR,
    role VARCHAR CHECK (role IN ('guest', 'host', 'admin')) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
  );

CREATE INDEX idx_user_email ON Users (email);

-- Property Table
CREATE TABLE
  Properties (
    property_id UUID PRIMARY KEY DEFAULT uuid_generate_v4 (),
    host_id UUID NOT NULL,
    name VARCHAR NOT NULL,
    description TEXT NOT NULL,
    location VARCHAR NOT NULL,
    price_per_night DECIMAL NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_host FOREIGN KEY (host_id) REFERENCES Users (user_id)
  );

CREATE INDEX idx_property_id ON Properties (property_id);

-- Booking Table
CREATE TABLE
  Bookings (
    booking_id UUID PRIMARY KEY DEFAULT uuid_generate_v4 (),
    property_id UUID NOT NULL,
    user_id UUID NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL NOT NULL,
    status VARCHAR CHECK (status IN ('pending', 'confirmed', 'canceled')) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_booking_property FOREIGN KEY (property_id) REFERENCES Properties (property_id),
    CONSTRAINT fk_booking_user FOREIGN KEY (user_id) REFERENCES Users (user_id)
  );

CREATE INDEX idx_booking_property_id ON Bookings (property_id);

CREATE INDEX idx_booking_id ON Bookings (booking_id);

-- Payment Table
CREATE TABLE
  Payments (
    payment_id UUID PRIMARY KEY DEFAULT uuid_generate_v4 (),
    booking_id UUID NOT NULL,
    amount DECIMAL NOT NULL,
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    payment_method VARCHAR CHECK (
      payment_method IN ('credit_card', 'paypal', 'stripe')
    ) NOT NULL,
    CONSTRAINT fk_payment_booking FOREIGN KEY (booking_id) REFERENCES Bookings (booking_id)
  );

-- Review Table
CREATE TABLE
  Reviews (
    review_id UUID PRIMARY KEY DEFAULT uuid_generate_v4 (),
    property_id UUID NOT NULL,
    user_id UUID NOT NULL,
    rating INTEGER NOT NULL CHECK (
      rating >= 1
      AND rating <= 5
    ),
    comment TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_review_property FOREIGN KEY (property_id) REFERENCES Properties (property_id),
    CONSTRAINT fk_review_user FOREIGN KEY (user_id) REFERENCES Users (user_id)
  );

-- Message Table
CREATE TABLE
  Messages (
    message_id UUID PRIMARY KEY DEFAULT uuid_generate_v4 (),
    sender_id UUID NOT NULL,
    recipient_id UUID NOT NULL,
    message_body TEXT NOT NULL,
    sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_sender FOREIGN KEY (sender_id) REFERENCES Users (user_id),
    CONSTRAINT fk_recipient FOREIGN KEY (recipient_id) REFERENCES Users (user_id)
  );