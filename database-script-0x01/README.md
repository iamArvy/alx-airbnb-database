# Database Schema – Airbnb Project

## Overview

This file defines the structure of the Airbnb-like relational database using SQL DDL (Data Definition Language). It includes tables, primary keys, foreign keys, constraints, and indexes to ensure data integrity and performance.

## Features

- Uses UUID as the primary key for all entities.
- Defines 8 main entities: Roles, Users, Properties, Bookings, Payment_Methods, Payments, Reviews, and Messages.
- Establishes all necessary foreign key relationships.
- Includes proper constraints (NOT NULL, CHECK, UNIQUE, etc.).
- Uses indexes on key fields for efficient querying.

## Tables Defined

- Roles: Stores the user roles (guest, host, admin etc) making scaling easier
- Users: Stores all platform users
- Properties: Listings created by hosts
- Bookings: Reservations made by users
- Payment_Methods: Store information on payment methods
- Payments: Payment information linked to bookings
- Reviews: User reviews of properties
- Messages: Messages exchanged between users

---

## Getting Started

### Prerequisites

- PostgreSQL (v13+ recommended)
- uuid-ossp extension enabled

### To Run

```bash
psql -U postgres -d airbnb_db -f schema.sql
```
This will execute the SQL script and generate all tables with appropriate constraints.

## Notes

updated_at timestamps can be updated via application logic (e.g., triggers or on update hooks).