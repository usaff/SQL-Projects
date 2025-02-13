CREATE DATABASE IF NOT EXISTS  OnlineBookstore;
USE OnlineBookstore;

CREATE TABLE Books (
    Book_ID INT AUTO_INCREMENT PRIMARY KEY,
    Title VARCHAR(100),
    Author VARCHAR(100),
    Genre VARCHAR(50),
    Published_Year INT,
    Price DECIMAL(10,2),
    Stock INT 
);
CREATE TABLE Customers (
    Customer_ID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100) UNIQUE,
    Phone VARCHAR(15),
    City VARCHAR(50),
    Country VARCHAR(150)
);
CREATE TABLE Orders (
    Order_ID INT AUTO_INCREMENT PRIMARY KEY,
    Customer_ID INT,
    Book_ID INT,
    Order_Date DATE,
    Quantity INT,
    Total_Amount DECIMAL(10,2),
    FOREIGN KEY (Customer_ID) REFERENCES Customers(Customer_ID),
    FOREIGN KEY (Book_ID) REFERENCES Books(Book_ID)
);
SELECT * FROM customers;
SELECT * FROM books;
SELECT * FROM orders;

-- 1) Retrieve all books in the "Fiction" genre:
SELECT * FROM books
WHERE Genre ='Fiction';

-- 2)Find books published after the year 1950:
SELECT * FROM books
WHERE Published_Year > 1950;


-- 3) List all customers from the Canada:
SELECT * FROM customers
WHERE Country = 'canada';

-- 4) Show orders placed in November 2023:
SELECT * FROM orders
WHERE Order_Date BETWEEN '2023-11-01' AND '2023-11-30';

-- 5) Retrieve the total stock of books available:
SELECT SUM(Stock) AS 'total stock'
FROM books;

-- 6) Find the details of the most expensive book:
SELECT * FROM Books 
ORDER BY Price DESC 
LIMIT 1;


-- 7) Show all customers who ordered more than 1 quantity of a book:
SELECT * FROM Orders 
WHERE quantity>1;

-- 8) Retrieve all orders where the total amount exceeds $20:
SELECT * FROM Orders 
WHERE total_amount>20;


-- 9) Find the book with the lowest stock:
SELECT * FROM Books 
ORDER BY stock 
LIMIT 1;

-- 10) Calculate the total revenue generated from all orders:
SELECT SUM(Total_Amount) AS Total_Revenue FROM Orders;

-- Advance Questions : 

-- 1) Retrieve the total number of books sold for each genre:

SELECT b.Genre, SUM(o.Quantity) AS Total_Books_sold
FROM Orders o
JOIN Books b ON o.book_id = b.book_id
GROUP BY b.Genre;

-- 2) Find the average price of books in the "Fantasy" genre:
SELECT AVG(price) AS Average_Price
FROM Books
WHERE Genre = 'Fantasy';


-- 3) List customers who have placed at least 2 orders:
SELECT o.customer_id, c.name, COUNT(o.Order_id) AS ORDER_COUNT
FROM orders o
JOIN customers c ON o.customer_id=c.customer_id
GROUP BY o.customer_id, c.name
HAVING COUNT(Order_id) >=2;

-- 4) Find the most frequently ordered book:
SELECT o.Book_id, b.title, COUNT(o.order_id) AS ORDER_COUNT
FROM orders o
JOIN books b ON o.book_id=b.book_id
GROUP BY o.book_id, b.title
ORDER BY ORDER_COUNT DESC LIMIT 1;


-- 5) Show the top 3 most expensive books of 'Fantasy' Genre :
SELECT * FROM books
WHERE genre = 'Fantasy'
ORDER BY price DESC LIMIT 3;

-- 6) Retrieve the total quantity of books sold by each author:
SELECT b.author, SUM(o.quantity) AS Total_Books_Sold
FROM orders o
JOIN books b ON o.book_id=b.book_id
GROUP BY b.Author;

-- 7) List the cities where customers who spent over $30 are located:
SELECT DISTINCT c.city, total_amount
FROM orders o
JOIN customers c ON o.customer_id=c.customer_id
WHERE o.total_amount > 30;

-- 8) Find the customer who spent the most on orders:
 SELECT c.customer_id, c.name, SUM(o.total_amount) AS Total_Spent
FROM orders o
JOIN customers c ON o.customer_id=c.customer_id
GROUP BY c.customer_id, c.name
ORDER BY Total_spent Desc LIMIT 1;


-- 9) Calculate the stock remaining after fulfilling all orders:
SELECT b.book_id, b.title, b.stock AS Order_quantity,  
	b.stock AS Remaining_Quantity
FROM books b
LEFT JOIN orders o ON b.book_id=o.book_id
GROUP BY b.book_id ORDER BY b.book_id;


-- Customer Behavior & Market Trends--
-- 1. Which country generates the highest revenue?
SELECT c.Country, SUM(o.Total_Amount) AS Total_Revenue
FROM Orders o
JOIN Customers c ON o.Customer_ID = c.Customer_ID
GROUP BY c.Country
ORDER BY Total_Revenue DESC
LIMIT 1;

-- 2. Which month had the highest book sales in terms of revenue?
SELECT DATE_FORMAT(Order_Date, '%Y-%m') AS Order_Month, 
       SUM(Total_Amount) AS Monthly_Revenue
FROM Orders
GROUP BY Order_Month
ORDER BY Monthly_Revenue DESC
LIMIT 1;


-- Sales & Financial Insights--
-- 3. Find the revenue contribution of each book genre.
SELECT b.Genre,
 SUM(o.Total_Amount) AS revenue
FROM orders o 
JOIN books b ON b.book_id=o.book_id
GROUP BY b.Genre
ORDER BY revenue DESC;

-- 4. Calculate the average order value per customer.
SELECT c.Customer_ID, c.Name, AVG(o.Total_Amount) AS Avg_Order_Value
FROM Orders o
JOIN Customers c ON o.Customer_ID = c.Customer_ID
GROUP BY c.Customer_ID, c.Name
ORDER BY Avg_Order_Value DESC;

-- 5. Predict when a book will run out of stock based on past sales trends.
SELECT b.Book_ID, b.Title, 
       b.Stock / AVG(o.Quantity) AS Estimated_Months_Before_Stockout
FROM Orders o
JOIN Books b ON o.Book_ID = b.Book_ID
GROUP BY b.Book_ID, b.Title, b.Stock
ORDER BY Estimated_Months_Before_Stockout ASC;

-- END--








