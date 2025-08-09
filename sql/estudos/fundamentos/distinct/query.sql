-- | DISTINCT
-- ? retorna os valores sem duplicar
SELECT DISTINCT column1
FROM table

-- ex:

SELECT *
FROM person.Person
WHERE lastName = 'Miller' AND firstName = 'Anna';

SELECT *
FROM production.Product
WHERE color = 'blue' OR color = 'black';

SELECT *
FROM production.Product
WHERE listPrice > 1500 AND listPrice < 5000;

SELECT *
FROM production.Product
WHERE color != 'red';

SELECT name
FROM production.Product
WHERE weight BETWEEN 500 AND 700;

SELECT name
FROM production.Product
WHERE weight > 500 AND weight < 700;

SELECT *
FROM HumanResources.Employee
WHERE MaritalStatus = 'M' AND SalariedFlag = 1;

SELECT * 
FROM person.EmailAddress;

SELECT FirstName, LastName, EmailAddress
FROM person.EmailAddress e, person.Person
WHERE person.EmailAddress.BusinessEntityID = person.Person.BusinessEntityID AND firstName = 'Peter' AND lastName = 'Krebs';