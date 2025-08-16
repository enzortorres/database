-- ORDER BY

SELECT coluna1, coluna2
FROM tabela
ORDER BY coluna1 asc/desc

SELECT * FROM person.Person;
SELECT * FROM production.Product;

SELECT firstName, lastName
FROM person.Person
ORDER BY firstName asc, lastName desc

SELECT firstName, lastName
FROM person.Person
ORDER BY BusinessEntityID desc;

SELECT TOP 10 productId, name, listPrice
FROM production.product
ORDER BY listPrice desc;

SELECT name, productnumber
FROM production.product
WHERE productID BETWEEN 1 AND 4;