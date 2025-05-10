# Database Normalization – ALX Airbnb Database  

## **Overview**  
Normalization is applied in the design of this **Airbnb-Clone database** to improve efficiency, eliminate redundancy, and ensure data integrity. The schema follows **Third Normal Form (3NF)** principles to create a well-structured, optimized database.  

## **Normalization Steps Applied**  

### **1st Normal Form (1NF)** – Ensuring Atomicity  
To meet 1NF requirements, all attributes store **atomic values**, ensuring each piece of data is individually structured:  
- The `full_name` field is split into **`first_name` and `last_name`** in the **User** table to allow more precise querying.  
- Separate tables are established for **User, Property, Booking, Payment, Review, and Message**, preventing duplication of data across entities.  

### **2nd Normal Form (2NF)** – Removing Partial Dependencies  
To achieve 2NF, non-key attributes are fully dependent on the primary key:  
- In the **Property** table, the direct storage of `host_name` is removed and replaced with a reference to `host_id` from the **User** table. This ensures that host-specific information remains in its relevant table.  
- Attributes that do not directly depend on the primary key are moved into separate tables to maintain relational integrity.  

### **3rd Normal Form (3NF)** – Eliminating Transitive Dependencies  
Transitive dependencies are removed to ensure attributes depend **only** on the primary key:  
- In the **Booking** table, `total_price` is not stored as a fixed attribute but is dynamically derived from **pricepernight × stay duration**, avoiding redundant storage.  
- Foreign keys are properly defined across tables to maintain efficient relationships and ensure data consistency.  

## **Final Optimizations**  
Additional enhancements include:  
✔ Establishing **Primary Keys** and **Foreign Keys** for relational integrity.  
✔ Implementing **Indexes** for faster query execution (e.g., `email`, `property_id`).  
✔ Enforcing **referential integrity** to prevent orphaned records across entities.  

## **Conclusion**  
Applying **Third Normal Form (3NF)** ensures a structured, efficient, and scalable database that adheres to best practices. This approach minimizes redundancy, enhances data integrity, and optimizes performance for real-world applications.  
