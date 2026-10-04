# Layoffs Data Cleaning Project

## 📌 Project Overview

This project focuses on cleaning and preparing a layoffs dataset using MySQL.

The goal is to identify and remove duplicate records, handle NULL and blank values, standardize inconsistent data, and transform the dataset into a clean format suitable for analysis.

## 🛠️ Tools Used

- MySQL
- MySQL Workbench 8.0 CE
- SQL

## 🧹 Data Cleaning Steps

The project includes:

1. Created a staging table
2. Removed duplicate records using `ROW_NUMBER()`
3. Standardized company names
4. Standardized industry values
5. Cleaned country names
6. Converted date values into proper DATE format
7. Handled NULL and blank values
8. Removed unnecessary records
9. Validated the cleaned dataset

## 🔑 SQL Concepts Used

- `CREATE TABLE`
- `INSERT INTO`
- `SELECT`
- `UPDATE`
- `DELETE`
- `ALTER TABLE`
- `TRIM()`
- `STR_TO_DATE()`
- `ROW_NUMBER()`
- `PARTITION BY`
- `CTE`
- `WHERE`
- `DISTINCT`
- `CASE`
- `JOIN`

## 📂 Project Files

- `layoffs_data_cleaning.sql` — Complete SQL code used for data cleaning.
- `README.md` — Project documentation.

## 🎯 Objective

To transform raw layoffs data into a clean, consistent, and analysis-ready dataset using SQL.

## 👨‍💻 Author

Dudekula Sameera