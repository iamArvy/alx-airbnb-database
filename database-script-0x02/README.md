# Database Seeding – Airbnb Project

## Overview

This file contains SQL DML (Data Manipulation Language) statements to populate the Airbnb database with realistic sample data. It supports testing and demonstration of the schema.

## Features
- Seeds roles (guest, host, admin)
- Seeds sample users
- Adds one property listed by a host
- Creates a booking by a guest
- Seeds Available Payment Methods
- Logs a payment for the booking
- Adds a review for the property
- Includes a user-to-user message

---

## Requirements

Before running this file, ensure the schema is set up (see schema for more information on setting up the schema).

## Running

```bash
psql -U postgres -d airbnb_db -f seed.sql
```

---

## Data Sample

- **Roles**
  - Admin
  - Host
  - Guest

- **Users:**
  - John (Host)
  - Jane (Guest)
  - Admin (Admin role)

- **Property:**
  - Beachside Bungalow in Lagos

- **Booking:**
  - From July 1 to July 5, 2025 (Total: $600)

- **Payment_Methods**
  - Paypal
  - Stripe
  - Apple

- **Payment:**
  - Via PayPal

- **Review:**
  - 5-star rating with positive feedback

- **Message:**
  - Jane to John confirming check-in

## Notes

- Role IDs, User IDs, Property IDs and Payment IDs are selected via subqueries for referential integrity.
- Realistic data helps simulate production-like usage for development or demos.
