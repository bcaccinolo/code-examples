
## import schema

sqlite3 mydb.db < schema.sql
sqlite3 mydb.db < data.sql

## launch db

```sh
  sqlite3 test.db
```

## describle tables

```sql
.schema
```

## show tables

```sql
.tables
```

## Responses

1. Select the names of all the products in the store.

```sql
  SELECT Name FROM Products;
```

2. Select the names and the prices of all the products in the store.

```sql
  SELECT Name, Price FROM Products;
```

3. Select the name of the products with a price less than or equal to $200.

```sql
  SELECT Name, Price FROM Products WHERE Price <= 200;
```

4. Select all the products with a price between $60 and $120.

```sql
  SELECT Name, Price FROM Products WHERE Price <= 120 AND Price >= 60;
```

5. Select the name and price in cents (i.e., the price must be multiplied by 100).

```sql
  SELECT Name, CAST(Price * 100 AS INT) FROM Products;
```

6. Compute the average price of all the products.

```sql
  SELECT AVG(Price) FROM Products;
```

7. Compute the average price of all products with manufacturer code equal to 2.

```sql
  SELECT AVG(Price) FROM Products WHERE Manufacturer = 2;
```

8. Compute the number of products with a price larger than or equal to $180.

```sql
  SELECT count(*) FROM Products WHERE Price >= 180;
```

9. Select the name and price of all products with a price larger than or equal to $180, and sort first by price (in descending order), and then by name (in ascending order).

```sql
  SELECT Name , Price  FROM Products WHERE Price >= 180 ORDER By Price DESC, Name ASC;
```

10. Select all the data from the products, including all the data for each product's manufacturer.

```sql
  SELECT *
    FROM Products AS p
    JOIN Manufacturers AS m ON p.Manufacturer = m.Code;
```

11. Select the product name, price, and manufacturer name of all the products.

```sql
  SELECT p.Code, p.Name, p.Price, m.Name
    FROM Products AS p
    JOIN Manufacturers AS m ON p.Manufacturer = m.Code;
```

12. Select the average price of each manufacturer's products, showing only the manufacturer's code.

```sql
  ;; display the prices by Manufacturers to see
  SELECT p.Price, m.Name
    FROM Products AS p
    JOIN Manufacturers AS m ON p.Manufacturer = m.Code
    ORDER BY m.Name;

  ;; the result
  SELECT AVG(p.Price), p.Manufacturer
    FROM Products AS p
    GROUP BY p.Manufacturer;
```

13. Select the average price of each manufacturer's products, showing the manufacturer's name.

```sql
  SELECT AVG(p.Price), m.Name
    FROM Products AS p
    JOIN Manufacturers AS m ON p.Manufacturer = m.Code
    GROUP BY m.Code;
```

14. Select the names of manufacturer whose products have an average price larger than or equal to $150.

```sql
  SELECT AVG(p.Price), m.Name
    FROM Products AS p
    JOIN Manufacturers AS m ON p.Manufacturer = m.Code
    GROUP BY m.Code
    HAVING  AVG(p.Price) >= 150;
```

15. Select the name and price of the cheapest product.

```sql
SELECT Name, Price FROM Products ORDER BY Price ASC LIMIT 1;
```

16. Select the name of each manufacturer along with the name and price of its most expensive product.

```sql
SELECT m.Name, p.Name, p.Price
  FROM Manufacturers AS m
  JOIN Products AS p ON p.Manufacturer = m.Code
  GROUP BY m.Name
  HAVING p.Price = Max(p.Price);
```

17. Add a new product: Loudspeakers, $70, manufacturer 2.

```sql
INSERT INTO Products ('Name', 'Price', 'Manufacturer')
  VALUES ('Loudspeakers', 70, 2);
```

18. Update the name of product 8 to "Laser Printer".

```sql
UPDATE Products
  SET 'Name' = 'Laser Printer'
  WHERE Code = 8;
```

19. Apply a 10% discount to all products.

```sql
UPDATE Products
  SET Price = Price * 0.9;
```

20. Apply a 10% discount to all products with a price larger than or equal to $120.

```sql
UPDATE Products
  SET Price = Price * 0.9
  WHERE Price >= 120;
```
