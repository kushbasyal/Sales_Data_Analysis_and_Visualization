# ProjectSales - Sales Data Analysis

This project demonstrates how to design and analyze a sales database using SQL. The database captures sales transactions, customers, products, sales territories, and calendar data to provide meaningful business insights.

The goal is to practice advanced SQL queries such as aggregations, joins, window functions, ranking, and filtering in a real-world style dataset.

---

## Dataset

The dataset consists of CSV files for each table in the database:

- Customer data
- Product details
- Sales transactions
- Sales territory info
- Geography data
- Calendar dates

You can find all the CSV files inside the [`datasets/`](./datasets) folder.

---

## Project Files

- [`sql_files.sql`](./sql/create_tables.sql): SQL script to create the database schema and define relationships between tables.  
- [`sales_analysis_queries.sql`](./sql/sales_analysis_queries.sql): Sample SQL queries that perform various sales analyses and reporting.  
- [`schema_diagram.png`](./images/schema_diagram.png): Visual diagram showing the relationships between the database tables.

---

## How to Use

1. Create a new database called `ProjectSales` (or any preferred name).  
2. Run the `create_tables.sql` script to create tables and foreign key constraints.  
3. Import the CSV files from the `datasets` folder into their respective tables.  
4. Run the queries from `sales_analysis_queries.sql` to explore and analyze the sales data.  
5. Use the schema diagram as a reference to understand table relationships.

---

## Conclusion

This project offers hands-on experience with database design, data importing, and complex SQL querying on a realistic sales dataset. It is ideal for practicing SQL skills and understanding business data workflows.

Feel free to fork this repository, modify queries, and expand the dataset for deeper analysis!

---

**Enjoy exploring the sales data!**
