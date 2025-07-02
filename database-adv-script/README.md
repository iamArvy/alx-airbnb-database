# 📂 database-adv-script

This folder contains a collection of advanced SQL scripts and performance optimization reports for the **ALX Airbnb database** project. The scripts in this directory are designed to demonstrate the practical use of SQL in analyzing, optimizing, and scaling relational databases through real-world examples.

The focus is on writing complex queries, implementing indexing, optimizing large datasets, and continuously improving query performance through execution plan analysis and schema design.

---

## 🧠 What You'll Find in This Folder

This folder includes:

- **Advanced SQL queries** using joins, subqueries, and aggregations.
- **Window functions** for ranking and advanced analytics.
- **Indexing strategies** to optimize common query paths.
- **Performance analysis** using `EXPLAIN`, `SHOW PROFILE`, and partitioning.
- **Refactored queries** and schema changes based on query plans.
- **Reports** documenting observed performance improvements.

---

## 🗂 Files Overview

| File Name                                 | Description                                                                 |
|------------------------------------------|-----------------------------------------------------------------------------|
| `joins_queries.sql`                      | SQL queries demonstrating `INNER`, `LEFT`, and `FULL OUTER JOIN` usage.     |
| `subqueries.sql`                         | Contains both correlated and non-correlated subqueries for data filtering.  |
| `aggregations_and_window_functions.sql`  | Aggregations (`COUNT`, `GROUP BY`) and window functions (`RANK`, `ROW_NUMBER`). |
| `database_index.sql`                     | Index creation statements for high-usage columns in core tables.            |
| `index_performance.md`                   | Report analyzing performance improvements after adding indexes.            |
| `perfomance.sql`                         | A complex multi-join query before optimization.                            |
| `optimization_report.md`                 | Refactored version of the query with performance insights from `EXPLAIN`.   |
| `partitioning.sql`                       | SQL script to partition the `Bookings` table by `start_date`.               |
| `partition_performance.md`               | Performance test results of partitioned vs. non-partitioned tables.         |
| `performance_monitoring.md`             | Continuous query monitoring and refinement using query plans.              |

---

## 🔧 Tools & Techniques Used

- SQL (MySQL syntax)
- `EXPLAIN` / `SHOW PROFILE` for query profiling
- `CREATE INDEX` for tuning data access patterns
- `RANGE` partitioning for large tables
- Aggregate and window functions for analytics
- Query rewriting for better performance

---

## 📌 Folder Purpose

This folder serves as a practical reference for writing high-performance SQL for production applications. It reflects the kind of optimization work you’d do to ensure your backend database layer scales efficiently with user and data growth — as seen in applications similar to Airbnb.