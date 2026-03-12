# DBMS LAB PROJECT: Placement Management System

This project contains the SQL scripts required to create a Database Management System for a Placement Cell. The database tracks Students, Companies, Jobs, and Applications.

## Files included
- `schema.sql`: The basic table structure.
- `queries.sql`: Mock data insertions and analytical query examples.
- `mysql_setup.sql`: Combined file with MySQL specific structure and queries.
- `step_by_step_queries.sql`: A step-by-step breakdown of database creation, valid for copy-pasting into a SQL shell.
- `execute.sql`: A clean script containing all queries without comments for direct execution.

## How to execute on another computer

### Prerequisites
1. You must have a SQL Database Server installed (MySQL is recommended for these scripts).
2. A command-line interface or a GUI client (like MySQL Workbench, DBeaver, or phpMyAdmin) to run the queries.

### Execution Steps
#### Option 1: Using Command Line (MySQL)
1. Open your terminal or command prompt.
2. Navigate to the folder where you downloaded these `.sql` files.
3. Login to your MySQL server:
   ```bash
   mysql -u your_username -p
   ```
   *(Enter your password when prompted)*
4. Once logged into the `mysql>` prompt, run the execute file:
   ```sql
   source execute.sql;
   ```
   Alternatively, you can run it directly from your terminal without logging into the prompt first:
   ```bash
   mysql -u your_username -p < execute.sql
   ```

#### Option 2: Using a GUI Client (e.g., MySQL Workbench)
1. Open MySQL Workbench and connect to your database server.
2. Go to **File > Open SQL Script...** and select `execute.sql` (or `step_by_step_queries.sql` if you want to run it block by block).
3. Click the lightning bolt icon (Execute) to run the entire script.
4. Refresh your schemas panel to see the newly created `pms` database and its tables.

### Understanding the Data
Once executed, the script will:
- Create a database named `pms`.
- Create tables: `Students`, `Companies`, `Jobs`, `Applications`.
- Insert sample data into all tables.
- Return the results of 5 analytical queries regarding placements and student eligibility.
