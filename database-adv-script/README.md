# Airbnb Database Queries – Joins & Subqueries

## Overview
This module focuses on writing **complex SQL queries** using **JOIN operations and Subqueries** for an **Airbnb-style database**. By mastering **data retrieval techniques**, we gain hands-on experience working with structured relational data.

## Learning Objectives
By completing these tasks, we will:
- **Understand SQL Joins** – Utilize INNER JOIN, LEFT JOIN, and FULL OUTER JOIN to connect tables.
- **Master Subqueries** – Implement **correlated and non-correlated subqueries** for advanced data analysis.
- **Enhance Query Performance** – Structure efficient queries to retrieve data meaningfully.

## Database Schema
Below are the main **entities and relationships** within the Airbnb database:

### **User Table**
Stores **user details** (guests, hosts, admins).
- `user_id` (Primary Key)
- `email` (Unique, Indexed)
- `role` (ENUM: guest, host, admin)

### **Property Table**
Stores **property details** listed by hosts.
- `property_id` (Primary Key)
- `host_id` (Foreign Key → User)

### **Booking Table**
Tracks **guest reservations** for properties.
- `booking_id` (Primary Key)
- `property_id` (Foreign Key → Property)
- `user_id` (Foreign Key → User)
- `status` (ENUM: pending, confirmed, canceled)

### **Payment Table**
Stores **payment transactions** for bookings.
- `payment_id` (Primary Key)
- `booking_id` (Foreign Key → Booking)
- `payment_method` (ENUM: credit_card, paypal, stripe)

### **Review Table**
Captures **guest ratings and comments** for properties.
- `review_id` (Primary Key)
- `property_id` (Foreign Key → Property)
- `user_id` (Foreign Key → User)
- `rating` (1–5, CHECK constraint)

### **Message Table**
Handles **communication between users**.
- `message_id` (Primary Key)
- `sender_id` (Foreign Key → User)
- `recipient_id` (Foreign Key → User)

---


### **Complex Queries with Joins**
**Objective:** Retrieve meaningful insights by joining multiple tables.

**Tasks:**
- Retrieve **bookings and respective users** using `INNER JOIN`.
- Retrieve **properties and their reviews**, including those with **no reviews** using `LEFT JOIN`.
- Retrieve **all users and all bookings**, including users **without bookings** using `FULL OUTER JOIN`.

**File:** `joins_queries.sql`

---

### **Practice Subqueries**
**Objective:** Implement correlated and non-correlated subqueries for deeper analysis.

**Tasks:**
- Find **properties** where the **average rating** is greater than `4.0` using a **subquery**.
- Find **users** who have **made more than 3 bookings** using a **correlated subquery**.

**File:** `subqueries.sql`


---

### **Apply Aggregations & Window Functions**
**Tasks:**
- Find the **total number of bookings per user** using `COUNT` and `GROUP BY`.
- Rank properties **based on the total number of bookings** using `ROW_NUMBER` and `RANK`.

**File:** `aggregations_and_window_functions.sql