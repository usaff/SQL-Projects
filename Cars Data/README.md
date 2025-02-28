## Car Sales Analysis Dashboard
This project comprehensively analyzes car sales trends, focusing on availability by year and fuel type. By examining historical car data, we aim to provide actionable insights to help car dealerships and manufacturers understand market demand and optimize inventory.

### Why We Are Doing This
The automotive industry is highly competitive and dynamic, with consumer preferences shifting rapidly. By analyzing historical car availability data, this project aims to help stakeholders:
- Identify trends in car availability by year and fuel type.
- Make informed decisions on inventory management.
- Understand market demands for different fuel types (e.g., petrol, diesel, CNG).

### Purpose of the Project
The primary goal of this project is to create a detailed analysis of car sales data using SQL, focusing on:
- Identifying patterns in car availability by year.
- Understanding the impact of fuel type on car availability.
- Supporting dealerships and manufacturers in making data-driven decisions.

### Questions Answered and Corresponding Queries
1. **How many cars will be available in 2023?**
   ```sql
   SELECT count(*)
   FROM `car dekho`
   WHERE `year` = 2023;
   ```
   This query helps stakeholders understand future inventory and plan marketing strategies accordingly.

2. **How many cars were available in 2020, 2021, and 2022?**
   ```sql
   SELECT count(*)
   FROM `car dekho`
   WHERE year IN (2020, 2021, 2022)
   GROUP BY `year`;
   ```
   This provides historical insights, allowing comparison across different years.

3. **What is the total count of all cars by year?**
   ```sql
   SELECT `year`, count(*)
   FROM `car dekho`
   GROUP BY `year`;
   ```
   This gives an overview of the inventory trend over multiple years.

4. **How many diesel cars were available in 2020?**
   ```sql
   SELECT count(*)
   FROM `car dekho`
   WHERE `fuel` = 'diesel' AND year = 2020;
   ```
   This identifies the demand for diesel cars in a specific year.

5. **How many petrol cars were available in 2020?**
   ```sql
   SELECT count(*)
   FROM `car dekho`
   WHERE `fuel` = 'petrol' AND year = 2020;
   ```
   This reveals the market demand for petrol vehicles in 2020.

6. **What is the breakdown of all fuel types by year?**
   ```sql
   SELECT `fuel`, `year`, COUNT(*)
   FROM `car dekho`
   GROUP BY `fuel`, `year`
   ORDER BY `fuel`, `year`;
   ```
   This shows the distribution of fuel types (petrol, diesel, CNG) across different years, helping identify shifts in consumer preferences.

7. **Which year had more than 100 cars?**
   ```sql
   SELECT `year`, COUNT(*) AS total_cars
   FROM `car dekho`
   GROUP BY `year`
   HAVING total_cars > 100;
   ```
   This identifies high-inventory years, which may correlate with market booms or strategic releases.

### Technologies Used
- **SQL:** For data extraction and querying.
- **MySQL:** Database management and execution of complex queries.

### Data Source
The dataset used in this analysis is sourced from the `car dekho` table, containing historical car availability data, including year and fuel type.

### Future Improvements
- Integrate more variables, such as car brand and model for detailed analysis.
- Include predictive analytics to forecast future inventory trends.
- Enhance visualization using tools like Power BI or Tableau.

### Contact
For questions or feedback, feel free to reach out via:
- **Email:** yousafawan0000@gmail.com
- **LinkedIn:** Muhammad Yousaf

### Conclusion
This project goes beyond mere data analysis; it provides valuable insights that can influence strategic decisions in the automotive industry. By understanding trends in car availability and fuel type preferences, dealerships and manufacturers can better meet consumer demands and maximize profitability.

