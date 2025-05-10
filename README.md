# ALX Airbnb Database

This repository contains the various tasks and steps for building and managing the database of an Airbnb Clone project. The focus is on designing, normalizing, and populating the database with sample data. Below are the main components of the project, along with links to their specific directories and files.

## 1. [Define Entities and Relationships in ER Diagram](ERD/requirements.md)
### Objective:
Create an Entity-Relationship (ER) diagram based on the database specification.

### Instructions:
- Identify all entities (e.g., User, Property, Booking) and their attributes.
- Define the relationships between entities (e.g., User to Booking, Property to Booking).
- Use a tool like Draw.io to create a visual representation of your ER diagram.


---

## 2. [Normalize Your Database Design](normalization.md)
### Objective:
Apply normalization principles to ensure the database is in third normal form (3NF).

### Instructions:
- Review your schema and identify any potential redundancies or violations of normalization principles.
- Adjust your database design to achieve 3NF if necessary.
- Provide an explanation of your normalization steps in a Markdown file.

---

## 3. [Design Database Schema (DDL)](database-script-0x01/README.md)
### Objective:
Write SQL queries to define the database schema (create tables, set constraints).

### Instructions:
- Based on the provided database specification, create SQL `CREATE TABLE` statements for each entity.
- Ensure proper data types, primary keys, foreign keys, and constraints.
- Create necessary indexes on columns for optimal performance.


---

## 4. [Seed the Database with Sample Data](database-script-0x02/README.md)
### Objective:
Create SQL scripts to populate the database with sample data.

### Instructions:
- Write SQL `INSERT` statements to add sample data for User, Property, Booking, etc.
- Ensure the sample data reflects real-world usage (e.g., multiple users, bookings, payments).

