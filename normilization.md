# Database Normalization Report – AirBnB Schema

## Objective

To apply normalization principles to the provided AirBnB schema and ensure it satisfies Third Normal Form (3NF). This report identifies any redundancies or violations and proposes adjustments if necessary.

---

## ✅ First Normal Form (1NF)

**Requirement:**  
- Each column contains only atomic (indivisible) values.  
- Each record is unique with a defined primary key.

**Assessment:**  
All tables meet 1NF:
- Attributes are atomic (e.g., no arrays or lists).
- Each table has a primary key using UUIDs.
- No repeating groups or multi-valued fields.

---

## ✅ Second Normal Form (2NF)

**Requirement:**  
- The table must be in 1NF.  
- All non-key attributes must depend on the *entire* primary key (no partial dependency).

**Assessment:**  
All primary keys are single-column (UUID), so partial dependencies are not possible.

All tables satisfy 2NF.

---

## ✅ Third Normal Form (3NF)

**Requirement:**  
- The table must be in 2NF.  
- No transitive dependencies (i.e., non-key attributes should not depend on other non-key attributes).

**Assessment Table-by-Table:**

### User
- All fields directly describe the user.
- No transitive dependencies.
- ✅ In 3NF.

### Property
- Attributes describe the property directly.
- `host_id` is a foreign key to `User(user_id)`.
- ✅ In 3NF.

### Booking
- All fields depend solely on `booking_id`.
- `property_id` and `user_id` are valid foreign keys.
- ✅ In 3NF.

### Payment
- Attributes are fully dependent on `payment_id`.
- `booking_id` is a foreign key.
- `amount`, `payment_date`, `payment_method` are directly related to the payment.
- ✅ In 3NF.

### Review
- Each review relates to a property and a user.
- `rating` and `comment` are dependent on `review_id`.
- ✅ In 3NF.

### Message
- `sender_id` and `recipient_id` are foreign keys.
- `message_body` and `sent_at` are attributes directly related to `message_id`.
- ✅ In 3NF.

---

## Optional Improvements (Beyond 3NF)

While the schema satisfies 3NF, the following improvements are suggested for better scalability:

### 1. Normalize ENUM values into separate tables

**a. `User.role` ENUM (guest, host, admin)**

Create a new `Role` table:
```sql
CREATE TABLE Role (
  role_id UUID PRIMARY KEY,
  role_name VARCHAR UNIQUE NOT NULL
);
```

**b. `Payment.payment_method` ENUM (credit_card, paypal, stripe)**

Create a new `PaymentMethod` table:
```sql
CREATE TABLE PaymentMethod (
  payment_method_id UUID PRIMARY KEY,
  method_name VARCHAR UNIQUE NOT NULL
);
```

This allows easier updates, better data management, and potential localization or metadata for roles and payment methods.

---

## Conclusion

✅ The AirBnB schema is fully normalized to 3NF.  
No modifications are required to meet 3NF, but normalization of ENUMs into separate tables is recommended for extensibility and maintainability.
