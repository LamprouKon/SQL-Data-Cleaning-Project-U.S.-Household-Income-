# SQL-Data-Cleaning-Project-U.S.-Household-Income-


# 🧹 SQL Data Cleaning Automation – U.S. Household Income

---

## 📌 Project Overview

This SQL automation project implements a structured data cleaning pipeline to prepare U.S. household income data for reliable analytics.

The workflow automates duplicate removal, enforces consistent formatting, and standardizes key fields such as state names, place types, and country values.  
All logic is encapsulated in a reusable **stored procedure**, enabling repeatable and schedulable data hygiene.

---

## ⚙️ Step-by-Step Breakdown

The stored procedure performs the following operations:

1. Creates a cleaned output table (if it does not already exist)  
2. Copies raw data into the cleaned structure  
3. Removes duplicates based on `id + timestamp`  
4. Applies multiple standardization rules across categorical fields  
5. Ensures consistent formatting for downstream analytics  

---

## 🎯 Outcome

By automating data cleaning and standardization, the pipeline ensures:

- Reliable and consistent income data  
- Reduced manual intervention  
- Reproducible cleaning logic  
- Analysis-ready structured datasets  

This modular SQL framework can be adapted to other datasets requiring recurring data hygiene and structural enforcement.
