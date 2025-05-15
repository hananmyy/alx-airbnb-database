## Overview
This report documents the **performance improvements** observed after partitioning the `Booking` table by `start_date`. The goal is to speed up **date range queries** for large datasets.

## Why Partitioning?
**Improves query speed** by limiting scans to relevant partitions.  
**Reduces index size** and optimizes storage.  
**Enhances scalability** for handling large-scale bookings.

## Initial Performance (Before Partitioning)
### **Query: Fetch bookings for June 2024**
```sql
EXPLAIN ANALYZE 
SELECT * FROM Booking WHERE start_date BETWEEN '2024-06-01' AND '2024-06-30';