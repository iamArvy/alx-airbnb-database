# Database Normalization Report – Airbnb Schema

## Objective

To apply normalization principles to the Airbnb database schema to eliminate redundancy, ensure data consistency, and verify that the schema satisfies **Third Normal Form (3NF)**. This report explains the normalization process step-by-step.

---

## Step 1: First Normal Form (1NF)

### ✅ What is 1NF?
A table is in First Normal Form if:
- Each column contains atomic (indivisible) values.
- Each row is uniquely identifiable by a primary key.
- No repeating groups or arrays are allowed.

### 🛠 Application to Schema
- All tables use **UUID-based primary keys** for uniqueness (`user_id`, `property_id`, etc.).
- All attributes hold single values (e.g., `email`, `role_id`, `price_per_night`).
- No multivalued fields or repeating groups exist.

✅ **Conclusion**: All tables meet 1NF.

---

## Step 2: Second Normal Form (2NF)

### ✅ What is 2NF?
A table is in Second Normal Form if:
- It is already in 1NF.
- All non-key attributes are fully functionally dependent on the entire primary key.

### 🛠 Application to Schema
- All tables use **single-column primary keys**, so partial dependencies are not possible.
- Every non-key column depends directly on the primary key (e.g., `email` on `user_id`, `price_per_night` on `property_id`).

✅ **Conclusion**: All tables meet 2NF.

---

## Step 3: Third Normal Form (3NF)

### ✅ What is 3NF?
A table is in Third Normal Form if:
- It is already in 2NF.
- There are no **transitive dependencies**—i.e., non-key attributes do not depend on other non-key attributes.

### 🛠 Application to Schema (Table-by-Table)

#### ✅ `Roles`
- Contains `role_id` and `role_name`.
- No derived or dependent attributes — already in 3NF.

#### ✅ `Users`
- Attributes like `first_name`, `email` describe the user.
- Linked to a role via foreign key `role_id`.
- No attribute depends on another non-key attribute.

#### ✅ `Properties`
- Linked to a user via foreign key `host_id`.
- All other attributes (e.g., `location`, `description`) relate directly to the property.

#### ✅ `Bookings`
- Linked to a user via foreign key `user_id` and property via foreign key `property_id`.
- All other attributes (`start_date`, `total_price`, `status`) relate directly to the booking.

#### ✅ `PaymentMethods`
- Contains `payment_method_id` and `name`.
- Already normalized.

#### ✅ `Payments`
- Linked to a booking via foreign key `booking_id` and a payment method via foreign key `payment_method_id`.
- No transitive dependencies — all attributes directly relate to the payment.

#### ✅ `Reviews`
- Linked to a property via foreign key `property_id` and a user via foreign key `user_id`.
- Attributes like `rating`, `comment`, `created_at` are directly about the review.

#### ✅ `Messages`
- Linked to user via foreign keys (`sender_id` and `recipient_id`).
- Message body and timestamp are only about the message itself.

✅ **Conclusion**: All tables meet 3NF.

---

## Final Verdict

🎉 The Airbnb schema is **fully normalized up to Third Normal Form (3NF)**.  
- No partial dependencies (2NF satisfied).  
- No transitive dependencies (3NF satisfied).  
- Repeating groups and multi-valued fields have been eliminated (1NF satisfied).

The design supports scalability, data consistency, and maintainability — a solid foundation for a production-grade relational database.
