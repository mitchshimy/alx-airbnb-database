## 🌱 Database Seeding with Sample Data

To simulate real-world usage and support development and testing, the database is seeded with realistic sample data using SQL `INSERT` statements. This helps verify the correctness of relationships and constraints within the schema.

### ✅ Entities Covered

- **Users**: Includes a guest, a host, and an admin to reflect different roles.
- **Properties**: Multiple properties listed by the host.
- **Bookings**: Bookings made by a guest for different properties.
- **Payments**: Payments linked to bookings using various payment methods.
- **Reviews**: User-generated feedback tied to properties.
- **Messages**: Simulated communication between guest and host.

### 📄 File

- [`airbnb_seed.sql`](seed.sql)

### 🚀 Purpose

- Validates foreign key relationships and constraints.
- Populates the database for frontend/backend integration during development.
- Useful for testing features like booking flows, messaging, and user dashboards.


