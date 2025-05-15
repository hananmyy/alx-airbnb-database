## Overview
This file documents the **performance improvements** observed after adding **indexes** to frequently queried columns in the `User`, `Booking`, and `Property` tables.

## Indexed Columns & Rationale
### **User Table**
✅ `email` → Frequently used in authentication and user lookups; indexing speeds up searches.  
✅ `role` → Used for filtering users by type (guest, host, admin); indexing improves query execution.  

### **Property Table**
✅ `location` → Commonly searched by guests during booking; indexing improves filtering speed.  
✅ `pricepernight` → Frequently used in sorting properties; indexing optimizes ORDER BY performance.  

### **Booking Table**
✅ `status` → Used to filter bookings (`confirmed`, `pending`, `canceled`); indexing reduces scan time.  
✅ `start_date, end_date` → Used in date range queries; indexing speeds up searches for bookings over time.  

## Performance Comparison (Before vs After Indexing)
Performance was **measured using `EXPLAIN ANALYZE`** before and after adding indexes. Results show **significant improvements** in execution time.

### **Query 1: Fetch confirmed bookings for the year**
```sql
EXPLAIN ANALYZE
SELECT * FROM Booking 
WHERE status = 'confirmed' AND start_date BETWEEN '2024-01-01' AND '2024-12-31';