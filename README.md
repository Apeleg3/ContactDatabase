
# Contact Database - SQL Server Project

This project implements a relational database system for managing contact information using Microsoft SQL Server. The schema is normalized and includes support for managing names, email addresses, phone numbers, and physical addresses, along with relevant metadata and data dictionaries.

## 📁 Project Structure

- **CreateDatabase.sql**  
  Initializes the database and sets configuration options such as recovery mode, compatibility level, and query store settings.

- **Tables.sql**  
  Contains all table creation scripts including `Contact`, `Email`, `Address`, `Phone`, and their supporting dictionary tables (e.g., `GenderDictonary`, `EmailDictonary`).

- **Views.sql**  
  Includes views for consolidated data reporting like `v_FullEmail`, `v_FullPhone`, and `v_FullAddress`.

- **StoredProcedures.sql**  
  Provides procedures for inserting, editing, deleting, and querying data, such as `AddContact`, `EditEmail`, and `ShowContactDetails`.

- **Constraints.sql**  
  Applies all necessary foreign key and default constraints to enforce data integrity.

- **SampleData.sql**  
  Includes insert statements to populate the database with sample records for testing and demonstration purposes.

## ✅ Features

- Normalized schema design with referential integrity
- Parameterized stored procedures for secure and reusable data operations
- Dynamic views for easy data retrieval and visualization
- Sample dataset included for demonstration
- Built-in formatting and validation (e.g., name title-casing, type checking)

## 🚀 How to Deploy

1. Run `CreateDatabase.sql` to set up the database and configurations.
2. Run `Tables.sql` to create all schema objects.
3. Apply constraints using `Constraints.sql`.
4. Load supporting views via `Views.sql`.
5. Execute `StoredProcedures.sql` to create all procedures.
6. Populate the database with `SampleData.sql`.

## 🧠 Author

Created by **Ashley Peleg**  
Bachelor of Science in Computer Science  
Pace University – Seidenberg School of CSIS

---

Feel free to fork, clone, or contribute to this project.
