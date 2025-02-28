# World Layoffs Data Cleaning Project

This project focuses on cleaning and organizing the `world_layoffs` dataset. The primary objective is to prepare the data for further analysis and visualization, ensuring accuracy and consistency.

## Why We Are Doing This

The global workforce landscape is rapidly changing, with layoffs impacting various industries. By cleaning and structuring the layoffs data, this project aims to help stakeholders understand global layoff trends, identify the industries most affected, and make informed decisions on workforce management and economic policies.

## Purpose of the Project

The primary goal of this project is to clean and organize the world layoffs data using SQL, focusing on handling missing or inconsistent data, standardizing data formats for analysis, and preparing the data for visualization and insights extraction.

## Questions Answered and Corresponding Queries

1. **Which industry faced the most layoffs?**
    ```sql
    SELECT industry, SUM(layoffs) AS total_layoffs
    FROM world_layoffs
    GROUP BY industry
    ORDER BY total_layoffs DESC;
    ```
2. **How have layoffs trended over the years?**
    ```sql
    SELECT year, SUM(layoffs) AS yearly_layoffs
    FROM world_layoffs
    GROUP BY year
    ORDER BY year;
    ```
3. **Which country experienced the highest number of layoffs?**
    ```sql
    SELECT country, SUM(layoffs) AS total_layoffs
    FROM world_layoffs
    GROUP BY country
    ORDER BY total_layoffs DESC;
    ```
4. **What is the average number of layoffs per company?**
    ```sql
    SELECT company, AVG(layoffs) AS avg_layoffs
    FROM world_layoffs
    GROUP BY company
    ORDER BY avg_layoffs DESC;
    ```

## Technologies Used

- **SQL:** For data cleaning and transformation.
- **MySQL:** Database management and query execution.

## Data Source

The dataset used in this project is sourced from Kaggle and provides detailed information on layoffs across different industries worldwide.

## Future Improvements

- Include more variables, such as company size and region for a detailed analysis.
- Integrate visualization tools like Power BI or Tableau for better insights.
- Perform predictive analysis to forecast layoff trends.

## Contact

For questions or feedback, feel free to reach out via:
- **Email:** [yousafawan0000@gmail.com](mailto:yousafawan0000@gmail.com)
- **LinkedIn:** [Muhammad Yousaf](https://www.linkedin.com/in/muhammad-usaf/)

## Conclusion

This project provides a clean and well-structured dataset that can be used to gain meaningful insights into global layoff trends. By organizing the data effectively, stakeholders can make informed decisions and understand the economic impact of workforce changes.
