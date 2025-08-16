-- ? Usamos o IN junto com WHERE, para verificar se um valor correspondem com qualquer valor passado na lista de valores
-- ex: valor IN (valor1, valor2)
-- ex: color IN (blue,  red)
-- ex: valor IN (SELECT valor FROM nomeDaTabela)

SELECT *
FROM person.Person
WHERE BusinessEntityID IN (2,7,13);

SELECT *
FROM person.Person
WHERE BusinessEntityID NOT IN (2,7,13);

-- same thing

SELECT *
FROM Person.Person
WHERE BusinessEntityID = 2 OR BusinessEntityID = 7 OR BusinessEntityID = 13;