## 🛠️ SQL-Based Schema Creation

The entire database schema is implemented using standard **SQL Data Definition Language (DDL)** statements.

- `CREATE TABLE` is used to define the structure of each entity.
- Data types like `UUID`, `VARCHAR`, `TEXT`, `DECIMAL`, and `TIMESTAMP` are chosen based on the nature of the data.
- `ENUM` types are defined using `CREATE TYPE` to ensure data consistency for roles, booking status, and payment methods.
- **Primary keys** (`PRIMARY KEY`) uniquely identify records in each table.
- **Foreign keys** (`REFERENCES`) enforce relationships between tables, ensuring referential integrity.
- Constraints like `NOT NULL`, `UNIQUE`, and `CHECK` are used to enforce data rules.
- **Indexes** are added using `CREATE INDEX` to optimize read performance on frequently queried columns such as emails and foreign key fields.

By using SQL, this schema can be easily deployed on any modern relational database system (such as PostgreSQL), ensuring that the structure is precise, optimized, and maintainable.

## 📂 Files

- [`airbnb_schema.sql`](schema.sql): Complete DDL for the schema.