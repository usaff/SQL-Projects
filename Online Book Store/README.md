# Online Bookstore Analysis Dashboard

This project comprehensively analyzes an online bookstore's sales, customer behavior, and inventory management. By examining historical sales and customer data, we aim to provide actionable insights to help the bookstore optimize its inventory, understand customer preferences, and improve overall sales performance.

## Why We Are Doing This
In the competitive world of online retail, understanding customer behavior and inventory trends is crucial for maximizing sales and enhancing customer satisfaction. By analyzing historical data, this project aims to help the bookstore:
- Identify best-selling genres and authors.
- Understand customer purchase patterns.
- Optimize inventory to reduce overstock and stockouts.

## Purpose of the Project
The primary goal of this project is to create a detailed analysis of the online bookstore's data using SQL, focusing on:
- Identifying top-selling books and genres.
- Analyzing customer purchase patterns.
- Supporting inventory management decisions with data-driven insights.

## Questions Answered and Corresponding Queries
1. **Which books are in the "Fiction" genre?**
```sql
SELECT * FROM books
WHERE Genre = 'Fiction';
```

2. **Which books were published after 1950?**
```sql
SELECT * FROM books
WHERE Published_Year > 1950;
```

3. **Which books are out of stock?**
```sql
SELECT * FROM books
WHERE Stock = 0;
```

4. **Which customer has made the most purchases?**
```sql
SELECT c.Name, COUNT(o.Order_ID) AS Total_Orders
FROM customers c
JOIN orders o ON c.Customer_ID = o.Customer_ID
GROUP BY c.Name
ORDER BY Total_Orders DESC;
```

5. **Which genre has the highest sales?**
```sql
SELECT b.Genre, SUM(o.Quantity) AS Total_Sales
FROM books b
JOIN orders o ON b.Book_ID = o.Book_ID
GROUP BY b.Genre
ORDER BY Total_Sales DESC;
```

6. **What is the total revenue by year?**
```sql
SELECT YEAR(Order_Date) AS Year, SUM(Total_Amount) AS Total_Revenue
FROM orders
GROUP BY Year
ORDER BY Year;
```

## Technologies Used
- **SQL:** For data extraction and querying.
- **MySQL:** Database management and execution of complex queries.

## Data Source
The dataset is sourced from the `OnlineBookstore` database, containing historical sales, customer, and inventory data.

## Future Improvements
- Integrate customer feedback for sentiment analysis.
- Implement predictive analytics to forecast future sales trends.
- Enhance visualization using tools like Power BI or Tableau.

## Contact
For questions or feedback, feel free to reach out via:
- **Email:** yousafawan0000@gmail.com
- **LinkedIn:** Muhammad Yousaf

## Conclusion
This project goes beyond basic data analysis by providing strategic insights to help the online bookstore maximize sales and customer satisfaction. By understanding customer preferences and inventory dynamics, the bookstore can better meet market demands and grow its business sustainably.

