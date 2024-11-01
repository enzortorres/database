-- EX 1
SELECT nomecliente, genero FROM cliente; 

-- EX 2
SELECT nomeproduto, preco FROM produto; 

-- EX 3
SELECT idcompra, dtcompra FROM compras; 

-- EX 4
SELECT nomecliente, cidade, estadocivil FROM cliente; 

-- EX 5
SELECT * FROM cliente;

-- EX 6
SELECT nomecliente, estadocivil FROM cliente 
	ORDER BY nomecliente ASC;
	
-- EX 7
SELECT nomeproduto, preco FROM produto 
	ORDER BY preco DESC;
	
-- EX 8
SELECT nomecliente, cidade, estado FROM cliente 
	ORDER BY cidade, estado ASC;
	
-- EX 9
SELECT DISTINCT estado FROM cliente;

-- EX 10
SELECT DISTINCT dtcompra FROM compras; 

-- EX 11 
SELECT nomeproduto FROM produto
	WHERE preco > 5;
	
-- EX 12
SELECT nomecliente, estadocivil FROM cliente
	WHERE genero = 'F';

-- EX 13
SELECT nomecliente, cidade FROM cliente
	WHERE estado = 'Rio de Janeiro';
	
-- EX 14 
SELECT nomecliente, dtnascimento FROM cliente
	WHERE dtnascimento < '2004-01-01';

-- EX 15
SELECT DISTINCT idcliente, dtcompra
	FROM compras
	WHERE dtcompra BETWEEN '2021-01-01' AND '2021-12-31';
	
-- EX 16
SELECT idcliente, dtcompra
	FROM compras 
	WHERE EXTRACT (YEAR FROM dtcompra) = 2020;


