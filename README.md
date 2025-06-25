# Airbnb Database Schema – ALX Project

## Overview

This project is part of the **ALX Airbnb Database Module**, designed to simulate a production-level database system for an Airbnb-like platform. It includes:

- Schema creation (`schema.sql`)
- Sample data population (`seed.sql`)
- Entity-Relationship design (see ERD folder)
- Normalization documentation up to 3NF

---

## Entities

1. **Users**: Hosts, guests, and admins.
2. **Properties**: Listings created by hosts.
3. **Bookings**: Reservation records for properties.
4. **Payments**: Payment details linked to bookings.
5. **Reviews**: Feedback left by users for properties.
6. **Messages**: Internal communication between users.

---

## Files

| File        | Description                                |
|-------------|--------------------------------------------|
| `schema.sql`| SQL DDL for all tables and constraints     |
| `seed.sql`  | Sample data insertion for testing          |
| `normalization.md` | Explains how 3NF was applied         |
| `ERD/requirements.md` | Contains ER diagram instructions |

---

## Getting Started

### Prerequisites

- PostgreSQL 13+
- `uuid-ossp` extension enabled

### To Run

```bash
psql -U postgres -d airbnb_db -f schema.sql
psql -U postgres -d airbnb_db -f seed.sql
```

### Notes
- All UUIDs are generated using uuid_generate_v4() from the uuid-ossp extension.
- ENUMs are implemented via VARCHAR CHECK constraints for flexibility.
- Data is realistic and reflects standard Airbnb-like operations.