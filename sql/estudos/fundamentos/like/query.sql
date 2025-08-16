-- ? Non CaseSensitive

SELECT *
FROM person.Person
WHERE firstName LIKE 'ovi%' -- incia com "ovi" e o restante não importa

SELECT *
FROM Person.Person
WHERE FirstName LIKE '%to' -- nome termina com "to', o inicio não importa

SELECT *
FROM Person.Person
WHERE FirstName LIKE '%essa%' -- nome possui "essa", não importa se é no inicio ou no final

SELECT * 
FROM Person.Person
WHERE FirstName LIKE '%ro__' -- nome termina com "ro" e possúi mais um caracter, mas não importa qual é, "_" representa a quantidade de caracteres após

SELECT HireDate
FROM HumanResources.Employee
WHERE HireDate LIKE '2009%'; -- somente no ano 2009

SELECT HireDate
FROM HumanResources.Employee
WHERE HireDate LIKE '%04___'; -- somente no mes 4 (abril)


SELECT HireDate
FROM HumanResources.Employee
WHERE HireDate LIKE '%16'; -- somente no dia 16