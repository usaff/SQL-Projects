CREATE SCHEMA cars;
USE cars;

SELECT *  
FROM `car dekho`;

SELECT count(*) FROM `car dekho`;

-- HOW MANY CARS WILL BE AVALAIBLE IN 2023 --
SELECT count(*)
FROM `car dekho`
WHERE `year` = 2023; #6

-- HOW MANY CARS ARE AVALAIVBLE IN 2020, 2021, 2022 --
SELECT count(*)
FROM `car dekho`
WHERE year IN ( 2020, 2021, 2022) GROUP BY `year`; #7,#7,#74

-- PRINT THE TOTAL OF ALL CARS BY YEAR --
SELECT `year`, count(*)        
FROM `car dekho`
GROUP BY `year`;

-- HOW MANY DIESEAL CARS WILL BE AVALIBLE IN 2020 --
SELECT  count(*)
FROM `car dekho`
WHERE `fuel` = 'diesel' and year = 2020; #20

-- HOW MANY PETROL CARS WILL BE AVALIBLE IN 2020 --
SELECT  count(*)
FROM `car dekho`
WHERE `fuel` = 'petrol' and year = 2020; #51

-- PRINT ALL THE FUEL CARS (PETROL, DIESEL, CNG) COME BY ALL YEAR
SELECT `fuel`, `year`, COUNT(*)
FROM `car dekho`
GROUP BY `fuel`, `year`
ORDER BY `fuel`, `year`;

-- FIND THE YEAR WHICH HAD MORE THEN 100 CARS--
SELECT `year`, COUNT(*) AS total_cars
FROM `car dekho`
GROUP BY `year`
HAVING total_cars > 100;

-- ALL CARS COUNT DETAILS BETWEEN 2015 AND 2023--
SELECT `year`, COUNT(*) 
FROM `car dekho`
WHERE `year` BETWEEN 2015 AND 2023
GROUP BY `year`
ORDER BY `year`;

-- Which car brands (e.g., Maruti, Hyundai, BMW) have the highest average selling price?--

SELECT Name, AVG(selling_price) AS avg_selling_price
FROM `car dekho`
GROUP BY Name ;


-- What is the average selling price of cars by fuel type and transmission type (automatic vs manual)?--

SELECT  fuel, transmission, AVG(selling_price) AS avg_selling_price
FROM `car dekho`
GROUP BY fuel, transmission
ORDER BY fuel, transmission;
 
-- List cars manufactured in 2020 or later with km_driven less than 20,000, sorted by selling_price descending--

SELECT `Name`, selling_price, km_driven, `year`
FROM `car dekho`
WHERE `year` >= 2020 AND km_driven < 20000
ORDER BY selling_price DESC;

-- Calculate the year-wise depreciation rate (difference between 2023 models vs older models) for diesel cars-

SELECT `year`, AVG(selling_price) AS avg_selling_price
FROM `car dekho`
WHERE fuel = 'Diesel'
GROUP BY `year`
HAVING `year` < 2023 OR year = 2023;

-- Identify the top 5 cars with the highest max_power (in bhp) and their corresponding mileage--

SELECT `Name`, max_power, mileage 
FROM `car dekho`
ORDER BY max_power DESC
LIMIT 5;


-- For cars sold by "Dealer" vs "Individual" sellers, compare the average km_driven and selling_price--

SELECT seller_type, AVG(km_driven) AS avg_km_driven, AVG(selling_price) AS avg_selling_price
FROM `car dekho`
GROUP BY seller_type;

-- Create a view that combines engine size, seats, and fuel type to categorize cars as "Premium", "Family", or "Budget"--

CREATE VIEW car_category AS
SELECT Name,
       `engine`,
       `seats`,
       `fuel`,
       CASE
           WHEN `engine` > 2.5 AND seats > 5 AND `fuel` = 'Petrol' THEN 'Premium'
           WHEN `engine` BETWEEN 1.5 AND 2.5 AND seats BETWEEN 4 AND 5 AND `fuel`IN ('Diesel', 'Petrol') THEN 'Family'
           ELSE 'Budget'
       END AS category
FROM `car dekho`;

-- Trend Analysis (Year-over-Year Comparison) --

SELECT `year`, AVG(selling_price) AS avg_selling_price, AVG(mileage) AS avg_mileage
FROM `car dekho`
GROUP BY `year`
ORDER BY `year` DESC;

-- Top Cars by Mileage and Power--

SELECT `NAME`, mileage , max_power
FROM `car dekho`
ORDER BY mileage DESC, max_power DESC
LIMIT 5;

-- Calculate the depreciation rate of cars from the year they were manufactured to the current year (2025), 
-- grouped by fuel type. You could also incorporate factors like km_driven into the depreciation formul--
 
SELECT  fuel, `year`,
    AVG(selling_price) AS avg_selling_price,
       (MAX(selling_price) - MIN(selling_price)) / (2025 - MIN(year)) AS avg_depreciation_rate
FROM `car dekho`
GROUP BY `year`, fuel;

-- Cars with Best Value (Price per Power)--

SELECT `Name`, selling_price, max_power, (selling_price / max_power) AS price_per_bhp
FROM `car dekho`
ORDER BY price_per_bhp ASC
LIMIT 5;


-- END--
