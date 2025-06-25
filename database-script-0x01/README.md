# Database Schema – Airbnb Project

## Overview

This file defines the structure of the Airbnb-like relational database using SQL DDL (Data Definition Language). It includes tables, primary keys, foreign keys, constraints, and indexes to ensure data integrity and performance.

## Features

- Uses UUID as the primary key for all entities.
- Defines 6 main entities: Users, Properties, Bookings, Payments, Reviews, and Messages.
- Establishes all necessary foreign key relationships.
- Includes proper constraints (NOT NULL, CHECK, UNIQUE, etc.).
- Uses indexes on key fields for efficient querying.

## Tables Defined

- Users: Stores all platform users (guest, host, admin)
- Properties: Listings created by hosts
- Bookings: Reservations made by users
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

ENUMs are implemented as VARCHAR with CHECK constraints for extensibility.

updated_at timestamps can be updated via application logic (e.g., triggers or on update hooks).

---

## Author

**Oluwaseyi M. Oke**
**Project:** DataScape - Mastering Database Design (ALX)
**File:** schema.sql