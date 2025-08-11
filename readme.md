# Ecommerce Sales Database

This project contains SQL scripts to create and analyze a simple ecommerce sales database. It includes table creation, sample data insertion, and useful queries for business insights.

## Contents

- **ecommerce.sql**: Main SQL script for database setup and analysis.

## Setup Instructions

### Requirements

- MySQL Server (recommended: MySQL 8+)
- MySQL Workbench or command-line access

### Steps

1. **Install MySQL**  
   Download and install MySQL from [dev.mysql.com/downloads](https://dev.mysql.com/downloads/installer/).

2. **Run the Script**  
   - Open MySQL Workbench, connect to your server.
   - Open `ecommerce.sql`.
   - Execute the script (click the lightning bolt).

   **Or using command line:**
  ```shell
mysql -u root -p
```
Then run:
```sql
source /path/to/ecommerce_sales_database/ecommerce.sql;
```
Replace `/path/to/ecommerce_sales_database/` with the actual path where you saved the project on your system.

## What the Script Does

1. **Creates Database and Tables**
   - `Customers`: Stores customer info.
   - `Products`: Stores product details.
   - `Orders`: Stores order records.

2. **Inserts Sample Data**
   - Adds example customers, products, and orders.

3. **Provides Analysis Queries**
   - View all orders with details
   - Calculate total revenue
   - Find most purchased product
   - Orders per customer
   - Revenue by city
   - Top customer by spending
   - Product category sales
   - Daily sales summary
   - Customers with no orders

## Usage

- Modify or extend the sample data as needed.
- Use the queries for reporting or analytics.

## License

This project is for educational/demo purposes.