# Colmadon El Programador

### SQL Server Database Management Project

## About the Project

Colmadon El Programador is a relational database project developed using Microsoft SQL Server. It simulates the operations of a Dominican convenience store, including inventory management, sales, purchases, customers, and suppliers.

The project demonstrates database design, data normalization, SQL queries, and database automation.

## Technologies Used

- Microsoft SQL Server
- SQL (T-SQL)
- Visual Studio Code
- GitHub

## Database Structure

The database contains nine tables:

1. Cliente
2. Categoria
3. Producto
4. Proveedor
5. Ventas
6. Detalle_Venta
7. Compras
8. Detalle_Compra
9. Detalle_Proveedor

These tables are linked by primary and foreign keys to maintain data integrity.

## Main Features

- Customer and supplier management
- Product inventory tracking
- Sales and purchase registration
- Inventory valuation
- Financial reporting using SQL views
- Stored procedures for customer sales queries
- Triggers designed to automatically update inventory
- SQL queries using INNER JOIN, LEFT JOIN, FULL OUTER JOIN, aggregation functions, and subqueries

## Project Files

| File | Description |
|---|---|
| `01_ddl.sql` | Database tables and constraints |
| `02_datos.sql` | Sample data |
| `03_consultas.sql` | SQL queries and reports |
| `04_objetos.sql` | Views, stored procedures, and triggers |
| `AR_Colmadon El Programador.jpg` | Entity-Relationship Diagram |

## How to Run

1. Open SQL Server using Visual Studio Code or SQL Server Management Studio.
2. Execute `01_ddl.sql` to create the database structure.
3. Execute `02_datos.sql` to insert sample records.
4. Execute `03_consultas.sql` to explore database queries.
5. Execute `04_objetos.sql` to create the database objects.

## Entity-Relationship Diagram
![Database ER Diagram](AR_Colmadon%20El%20Programador.jpg)

## Author
**Albert Rodriguez**
Computer Science Student — Hostos Community College
Aspiring Full Stack Developer

