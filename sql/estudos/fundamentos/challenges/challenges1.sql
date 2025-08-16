-- 1) Quantos produtos temos cadastrado no sistema que custam mais que 1500 dolares
SELECT COUNT(*) AS QTD
FROM Production.Product
WHERE ListPrice > 1500;
-- RESULT = 39

-- 2) Quantas pessoas temos com o sobrenome que inicia com a letra P

SELECT COUNT(*) AS QTD
FROM Person.Person
WHERE LastName LIKE 'P%';
-- RESULT = 1187

-- 3) Em quantas cidades únicas estão cadastrados nossos clientes
SELECT COUNT(DISTINCT city) AS QTD
FROM Person.Address;
-- RESULT = 575

-- 4) Quais são as cidades únicas que temos cadastrados em nosso sistema?
SELECT DISTINCT city
FROM Person.Address
ORDER BY city ASC;

-- 5) Quantos produtos vermelhos tem preço entre 500 a 1000 doláres?
SELECT COUNT(*)
FROM Production.Product
WHERE color = 'Red'
AND ListPrice BETWEEN 500 AND 1000;
-- RESULT = 11

-- 6) Quantos produtos cadastrados tem a palavra 'road' no nome deles?
SELECT COUNT(*)
FROM Production.Product
WHERE name LIKE '%road%';
-- RESULT = 103
