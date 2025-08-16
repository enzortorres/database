SELECT COUNT(*)
FROM TABELA;

SELECT COUNT(DISTINCT coluna)
FROM TABELA;

SELECT COUNT(DISTINCT title) 
FROM person.Person;

-- production.product
-- 1) Quantos produtos temos cadastrados em nossa tabela de prodoutos
SELECT COUNT(*) AS qtd_produtos
FROM production.product;
-- result =504

-- 2) Quantos tamanhos de produtos temos cadastrado em nossa tabela
SELECT COUNT(size) as qtd
FROM production.product;
-- result = 211

-- 3) Quantos tamanhos diferentes eu tenho cadastrado em nossa tabela
SELECT COUNT(DISTINCT size) AS qtd_tamanhos
FROM production.product;
-- result = 18

SELECT DISTINCT size 
FROM production.product
WHERE size IS NOT NULL;
