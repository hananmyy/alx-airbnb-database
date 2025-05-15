## Overview
This report tracks **query performance** using `EXPLAIN ANALYZE` and `SHOW PROFILE`. The goal is to **identify bottlenecks** and optimize the database schema to improve execution speed.

## Step 1: Monitoring Query Performance
**Analyze frequently used queries** to detect inefficiencies.  
**Use `EXPLAIN ANALYZE`** to understand query execution plans.  
**Identify slow-performing queries** that need optimization.  

### **Example Query: Fetch recent bookings**
```sql
EXPLAIN ANALYZE 
SELECT * FROM Booking WHERE start_date > '2024-06-01' ORDER BY start_date DESC;
