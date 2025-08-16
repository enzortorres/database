-- ? É USADO PARA BUSCAR ENTRE UM VALOR MINIMO E UM MÁXIMO
-- ex: valor BETWEEN mínimo AND máximo

-- > é a mesma coisa que dizer:
-- ex: valor >= mínimo AND valor <= máximo;

SELECT *
FROM production.Product
WHERE listPrice BETWEEN 1000 AND 1500;

SELECT *
FROM production.Product
WHERE listPrice NOT BETWEEN 1000 AND 1500;

SELECT *
FROM HumanResources.Employee
WHERE HireDate BETWEEN '2009/01/01' AND '2009/12/31' -- ANO/MES/DIA
ORDER BY HireDate ASC;