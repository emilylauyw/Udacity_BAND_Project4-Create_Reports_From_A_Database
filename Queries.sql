/* Query 1 - Top 5 customers with the most purchases */
SELECT c.CompanyName, c.Country, SUM(od.Quantity) As QuantityPurchased
FROM Customers c
JOIN Orders o ON c.CustomerId = o.CustomerId
JOIN OrderDetails od ON o.OrderId = od.OrderId
GROUP BY c.CustomerId
ORDER BY  QuantityPurchased DESC
LIMIT 5

/* Query 2 - Top 5 countries with the most purchases */
SELECT c.Country, SUM(od.Quantity) As QuantityPurchased
FROM Customers c
JOIN Orders o ON c.CustomerId = o.CustomerId
JOIN OrderDetails od ON o.OrderId = od.OrderId
GROUP BY c.Country
ORDER BY  QuantityPurchased DESC
LIMIT 5

/* Query 3 - Top 10 best products */
SELECT ProductName, SUM(Quantity) AS TotalQuantity
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN OrderDetails od ON o.OrderId = od.OrderId
JOIN Products p ON od.ProductId = p.ProductId
JOIN Categories cat ON p.CategoryID = cat.CategoryID
GROUP BY p.ProductName
ORDER BY TotalQuantity DESC
LIMIT 10

/* Query 4 - Top 5 popular category */
SELECT CategoryName, SUM(Quantity) AS TotalQuantity
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN OrderDetails od ON o.OrderId = od.OrderId
JOIN Products p ON od.ProductId = p.ProductId
JOIN Categories cat ON p.CategoryID = cat.CategoryID
GROUP BY cat.CategoryName
ORDER BY TotalQuantity DESC
LIMIT 5
