CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- Role Table
CREATE TABLE
  Roles (
    role_id UUID PRIMARY KEY DEFAULT uuid_generate_v4 (),
    name VARCHAR UNIQUE NOT NULL,
  );

CREATE INDEX idx_role_name ON Roles (name);

-- User Table
CREATE TABLE
  Users (
    user_id UUID PRIMARY KEY DEFAULT uuid_generate_v4 (),
    first_name VARCHAR NOT NULL,
    last_name VARCHAR NOT NULL,
    email VARCHAR UNIQUE NOT NULL,
    password_hash VARCHAR NOT NULL,
    phone_number VARCHAR,
    role_id UUID NOT NULL,
    created_at TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP CONSTRAINT fk_role FOREIGN KEY (role_id) REFERENCES Roles (role_id)
  );

CREATE INDEX idx_user_email ON Users (email);

CREATE INDEX idx_user_role ON Users (role_id);

-- Property Table
CREATE TABLE
  Properties (
    property_id UUID PRIMARY KEY DEFAULT uuid_generate_v4 (),
    host_id UUID NOT NULL,
    name VARCHAR NOT NULL,
    description TEXT NOT NULL,
    location VARCHAR NOT NULL,
    price_per_night DECIMAL NOT NULL,
    created_at TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP(3) NOT NULL,
    CONSTRAINT fk_host FOREIGN KEY (host_id) REFERENCES Users (id)
  );

CREATE INDEX idx_property_id ON Properties (property_id);

CREATE INDEX idx_property_host ON Properties (host_id);

-- Booking Table
CREATE TABLE
  Bookings (
    booking_id UUID PRIMARY KEY DEFAULT uuid_generate_v4 (),
    property_id VARCHAR NOT NULL,
    user_id VARCHAR NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL NOT NULL,
    status VARCHAR CHECK (status IN ('pending', 'confirmed', 'canceled')) NOT NULL,
    created_at TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_booking_property FOREIGN KEY (property_id) REFERENCES Properties (id),
    CONSTRAINT fk_booking_user FOREIGN KEY (user_id) REFERENCES Users (id)
  );

CREATE INDEX idx_booking_property ON Bookings (property_id);

CREATE INDEX idx_booking_user ON Bookings (user_id);

CREATE INDEX idx_booking_id ON Bookings (booking_id);

-- Payment Method Table
CREATE TABLE
  Payment_Methods (
    payment_method_id UUID PRIMARY KEY DEFAULT uuid_generate_v4 (),
    name VARCHAR UNIQUE NOT NULL,
  );

CREATE INDEX idx_payment_method_name ON Payment_Methods (name);

-- Payment Table
CREATE TABLE
  Payments (
    payment_id UUID PRIMARY KEY DEFAULT uuid_generate_v4 (),
    booking_id UUID NOT NULL,
    amount DECIMAL NOT NULL,
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    payment_method_id UUID NOT NULL,
    CONSTRAINT fk_payment_booking FOREIGN KEY (booking_id) REFERENCES Bookings (id)
  );

CREATE INDEX idx_payment_booking ON Bookings (property_id);

-- Review Table
CREATE TABLE
  Reviews (
    "id" UUID PRIMARY KEY DEFAULT uuid_generate_v4 (),
    "property_id" UUID NOT NULL,
    "user_id" UUID NOT NULL,
    "rating" INTEGER NOT NULL CHECK (
      rating >= 1
      AND rating <= 5
    ),
    "comment" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_review_property FOREIGN KEY (property_id) REFERENCES Properties (property_id),
    CONSTRAINT fk_review_user FOREIGN KEY (user_id) REFERENCES Users (user_id)
  );

CREATE INDEX idx_property_review ON Reviews (property_id);

CREATE INDEX idx_user_review ON Reviews (user_id);

-- Message Table
CREATE TABLE
  Messages (
    "id" UUID PRIMARY KEY DEFAULT uuid_generate_v4 (),
    "sender_id" UUID NOT NULL,
    "recipient_id" UUID NOT NULL,
    "body" TEXT NOT NULL,
    "sent_at" TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_sender FOREIGN KEY (sender_id) REFERENCES Users (user_id),
    CONSTRAINT fk_recipient FOREIGN KEY (recipient_id) REFERENCES Users (user_id)
  );

CREATE INDEX idx_user_sent_messages ON Messages (sender_id);

CREATE INDEX idx_user_received_messages ON Messages (recipient_id);