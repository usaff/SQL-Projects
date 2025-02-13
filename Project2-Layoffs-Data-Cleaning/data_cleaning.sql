-- SQL Project - Data Cleaning

-- https://www.kaggle.com/datasets/swaptr/layoffs-2022

CREATE DATABASE world_layoffs;
USE world_layoffs;
    
SELECT * 
FROM layoffs;

-- 1- first thing we want to do is create a staging table. This is the one we will work in and clean the data.
-- We want a table with the raw data in case something happens--

CREATE TABLE layoffs_staging
LIKE layoffs;

INSERT layoffs_staging
SELECT * FROM layoffs;

SELECT * FROM layoffs_staging;

SELECT *, 
       ROW_NUMBER() OVER (
           PARTITION BY company, location, industry, total_laid_off,percentage_laid_off,`date`,
           stage, country, funds_raised_millions
       ) AS row_num
FROM layoffs_staging;

WITH duplicate_cte AS 
(
SELECT *, 
       ROW_NUMBER() OVER (
           PARTITION BY company, location, industry, total_laid_off,percentage_laid_off,`date`,
           stage, country, funds_raised_millions
       ) AS row_num
FROM layoffs_staging
)
SELECT * 
FROM duplicate_cte 
WHERE row_num > 1 ;

CREATE TABLE `layoffs_staging2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `layoffs_staging2`
SELECT *, 
       ROW_NUMBER() OVER (
           PARTITION BY company, location, industry, total_laid_off,percentage_laid_off,`date`,
           stage, country, funds_raised_millions
       ) AS row_num
FROM layoffs_staging;

SELECT * FROM layoffs_staging2;

SELECT * 
FROM layoffs_staging2
WHERE row_num > 1 ;

DELETE FROM world_layoffs.layoffs_staging2
WHERE row_num >= 2;

                            -- 2. Standardize Data--
                            

SELECT DISTINCT industry
FROM layoffs_staging2
ORDER BY industry;

SELECT *
FROM layoffs_staging2
WHERE industry IS NULL 
OR industry = ''
ORDER BY industry;

-- let's take a look at these
SELECT *
FROM world_layoffs.layoffs_staging2
WHERE company LIKE 'Bally%';
-- nothing wrong here
SELECT *
FROM world_layoffs.layoffs_staging2
WHERE company LIKE 'airbnb%';

-- we should set the blanks to nulls since those are typically easier to work with
UPDATE layoffs_staging2
SET industry = NULL
WHERE industry = '';

-- now if we check those are all null
SELECT *
FROM world_layoffs.layoffs_staging2
WHERE industry IS NULL 
OR industry = ''
ORDER BY industry;

-- I also noticed the Crypto has multiple different variations. We need to standardize that - let's say all to Crypto
SELECT DISTINCT industry
FROM world_layoffs.layoffs_staging2
ORDER BY industry;

UPDATE layoffs_staging2
SET industry = 'Crypto'
WHERE industry IN ('Crypto Currency', 'CryptoCurrency');

-- now that's taken care of:
SELECT DISTINCT industry
FROM layoffs_staging2
ORDER BY industry;

-- everything looks good except apparently we have some "United States" and some "United States." with a period at the end. Let's standardize this.
SELECT DISTINCT country
FROM world_layoffs.layoffs_staging2
ORDER BY country;

UPDATE layoffs_staging2
SET country = TRIM(TRAILING '.' FROM country);

-- now if we run this again it is fixed
SELECT DISTINCT country
FROM world_layoffs.layoffs_staging2
ORDER BY country;

-- Let's also fix the date columns:
SELECT *
FROM layoffs_staging2;

-- we can use str to date to update this field
UPDATE layoffs_staging2
SET `date` = STR_TO_DATE(`date`, '%m/%d/%Y');

-- now we can convert the data type properly
ALTER TABLE layoffs_staging2
MODIFY COLUMN `date` DATE;


SELECT *
FROM layoffs_staging2;

-- 3. Look at Null Values

-- the null values in total_laid_off, percentage_laid_off, and funds_raised_millions all look normal. I don't think I want to change that
-- I like having them null because it makes it easier for calculations during the EDA phase

-- so there isn't anything I want to change with the null values




-- 4. remove any columns and rows we need to

SELECT *
FROM layoffs_staging2
WHERE total_laid_off IS NULL;


SELECT *
FROM layoffs_staging2
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;

-- Delete Useless data we can't really use
DELETE FROM world_layoffs.layoffs_staging2
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;

SELECT * 
FROM layoffs_staging2;

ALTER TABLE layoffs_staging2
DROP COLUMN row_num;


SELECT * 
FROM layoffs_staging2;

