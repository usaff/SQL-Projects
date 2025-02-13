🧹 Data Cleaning – Layoffs Data 2022
📌 Project Overview
This project focuses on cleaning and standardizing a dataset containing information on company layoffs worldwide. The dataset includes details like company names, industries, locations, layoff numbers, and funding. The goal is to ensure the data is accurate, consistent, and ready for analysis.

📂 Dataset
Source: Kaggle - Layoffs Dataset (2022)
Columns: Company, Location, Industry, Total Laid Off, Percentage Laid Off, Date, Stage, Country, Funds Raised
🔧 Key Data Cleaning Steps
1️⃣ Handling Duplicates
Created a staging table (layoffs_staging2) to work on the data without altering the raw dataset.
Identified duplicate records based on company, location, industry, and layoff numbers.
Removed duplicate rows to keep only unique entries.
2️⃣ Standardizing Data
Converted blank values to NULL for easier processing.
Standardized industry names (e.g., "Crypto Currency" → "Crypto").
Fixed country names inconsistencies (e.g., "United States." → "United States").
Converted date formats from text to DATE type for proper analysis.
3️⃣ Handling Null Values
Reviewed missing values in critical columns like Total Laid Off, Percentage Laid Off, and Funds Raised.
Retained NULL values where necessary to preserve dataset integrity.
4️⃣ Removing Unnecessary Data
Dropped rows where both Total Laid Off and Percentage Laid Off were NULL.
Removed extra columns (row_num) that were used temporarily during data cleaning.
📊 Final Outcome
A cleaned and structured dataset, free from duplicates and inconsistencies.
Ready for further Exploratory Data Analysis (EDA) and visualization.
🚀 Created by: Muhammad Yousaf