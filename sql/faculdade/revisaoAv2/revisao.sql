--* EX 1 
--* a)

SELECT codFunc, nome FROM Funcionário
    WHERE salario = 3000;

--* b)
SELECT nome, salario FROM Funcionário
    INNER JOIN Setor as st
        ON Setor.codSetor = Funcionário.codSetor
    WHERE Setor.nome = 'Estoque';

--* c)
SELECT DISTINCT nome FROM Funcionário
    INNER JOIN trabalha_em
        ON Funcionário.codFunc = trabalha_em.codFunc
    WHERE dedicacao < 100;

--* d)
SELECT nome FROM Funcionário as fnc
    INNER JOIN trabalha_em as tbe
        ON fnc.codFunc = tbe.codFunc
    INNER JOIN Projeto as pjt
        ON tbe.codProjeto = pjt.codProjeto
    WHERE pjt.nome = 'Governança';

--* EX 3
--* a)
SELECT COUNT(*) as qtdsetores
    FROM setor;


--* EX1  PRODUTO MAIS CARO
SELECT MAX(preco) FROM produto;

--* EX2
SELECT MIN(qtd) AS menorqtd FROM compras;

--* EX3
SELECT ROUND(AVG(qtd),2) AS mediaqtd FROM compras;
	
--* EX4 
SELECT COUNT(*) as qtdclienterj FROM cliente
	WHERE estado = 'Rio de Janeiro';

--* EX5 
SELECT ROUND(AVG(preco), 2) AS mediapreco FROM produto;

--* EX6 
SELECT COUNT(*) AS qtdprodutobomprato FROM compras AS cp
	INNER JOIN produto AS pdt
		ON cp.idproduto = pdt.idproduto
	INNER JOIN marca AS ma
		ON pdt.idmarca = ma.idmarca
	WHERE ma.nomemarca = 'Bom Prato';

--* EX7
SELECT COUNT(*) AS qtdprodutovaleverde FROM compras as cp
	INNER JOIN loja AS lj
		ON cp.idloja = lj.idloja
	WHERE lj.nomeloja = 'Vale Verde';

--* EX8
SELECT SUM(qtd) AS qtdprodutomg FROM compras AS cp
	INNER JOIN loja AS lj
		ON cp.idloja = lj.idloja 
	WHERE lj.uf = 'MG';

--* EX9 
SELECT SUM(qtd) AS qtdmacarrao FROM compras AS cp
	INNER JOIN produto AS pdt
		ON cp.idproduto = pdt.idproduto
	WHERE pdt.nomeproduto = 'Macarrão';

UPDATE produto
	SET nomeproduto = 'Macarrão'
	WHERE nomeproduto = 'Marcarrão';

--* EX10
SELECT SUM(qtd) AS qtdtotalvendas FROM compras AS cp;

--* EX11 
SELECT estado, COUNT(*) AS qtdcliente FROM cliente
	GROUP BY estado
	ORDER BY qtdcliente DESC;

--* EX12
SELECT uf, COUNT(*) AS qtdloja FROM loja
	GROUP BY uf 
	ORDER BY qtdloja DESC;

--* EX13 
SELECT nomemarca, COUNT(*) AS qtdproduto FROM produto AS pdt
	INNER JOIN marca AS ma
		ON pdt.idmarca = ma.idmarca
	GROUP BY ma.nomemarca
	ORDER BY qtdproduto DESC;

--* EX14
SELECT nomemarca, SUM(pdt.preco * cp.qtd) AS valortotal FROM produto AS pdt
	INNER JOIN compras AS cp
		ON pdt.idproduto = cp.idproduto
	INNER JOIN marca AS ma
		ON pdt.idmarca = ma.idmarca
	GROUP BY nomemarca
	ORDER BY valortotal DESC;

--* EX15
SELECT nomeproduto, ROUND(AVG(qtd), 2) AS qtdmediavendas 
	FROM compras AS cp
	INNER JOIN produto AS pdt
		ON cp.idproduto = pdt.idproduto
	GROUP BY nomeproduto
	ORDER BY qtdmediavendas DESC;

--* EX16
SELECT nomeloja, ROUND(SUM(pdt.preco * cp.qtd), 2) AS faturamento
	FROM compras AS cp
	INNER JOIN loja AS lj
		ON cp.idloja = lj.idloja
	INNER JOIN produto AS pdt
		ON cp.idproduto = pdt.idproduto
	GROUP BY nomeloja
	ORDER BY faturamento DESC;

--* EX17
SELECT nomecliente, SUM(qtd) AS qtdprodutos
	FROM compras AS cp
	INNER JOIN cliente AS cli
		ON cp.idcliente = cli.idcliente
	GROUP BY nomecliente
	ORDER BY qtdprodutos DESC;

--* EX18
SELECT cidade, COUNT(*) AS qtdcliente
	FROM cliente as cli
	GROUP BY cidade
	ORDER BY qtdcliente DESC
	LIMIT 5;

--* EX19
SELECT nomeproduto, SUM(qtd) AS qtdvendido
	FROM produto AS pdt
	INNER JOIN compras AS cp
		ON pdt.idproduto = cp.idproduto
	GROUP BY nomeproduto
	ORDER BY qtdvendido DESC;

--* EX20
SELECT nomecliente, SUM(cp.qtd * pdt.preco) AS total
	FROM cliente AS cli
	INNER JOIN compras AS cp
		ON cli.idcliente = cp.idcliente
	INNER JOIN produto AS pdt
		ON cp.idproduto = pdt.idproduto
	GROUP BY nomecliente
	ORDER BY total DESC
	LIMIT 5;

--* EX21
SELECT estado, COUNT(*) as qtdcliente
	FROM cliente AS cli
	GROUP BY estado
	HAVING COUNT(*) > 50
	ORDER BY qtdcliente DESC;

--* EX22
SELECT nomemarca, SUM(cp.qtd * pdt.preco) AS faturamento
	FROM marca AS ma
	INNER JOIN produto AS pdt
		ON ma.idmarca = pdt.idmarca
	INNER JOIN compras AS cp
		ON pdt.idproduto = cp.idproduto
	GROUP BY nomemarca
	HAVING SUM(cp.qtd * pdt.preco) < 25000
	ORDER BY faturamento DESC;

--* EX23
SELECT nomecliente, COUNT(*) AS qtdcompras
	FROM compras AS cp
	INNER JOIN cliente AS cli
		ON cp.idcliente = cli.idcliente
	GROUP BY nomecliente
	HAVING COUNT(*) < 5
	ORDER BY qtdcompras DESC;

--* EX LEFT JOIN
SELECT nomecliente FROM cliente AS cli
	LEFT JOIN compras AS cp
		ON cli.idcliente = cp.idcliente;

--* EX RIGHT JOIN
SELECT nomemarca FROM marca AS lj
	RIGHT JOIN produto AS pdt
		ON lj.idmarca = pdt.idmarca;

--* EX FULL OUTER JOIN
SELECT nomecliente, nomemarca
	FROM cliente AS cli
	FULL OUTER JOIN compras AS cp
		ON cli.idcliente = cp.idcliente
	FULL OUTER JOIN produto AS pdt
		ON cp.idproduto = pdt.idproduto
	FULL OUTER JOIN marca AS ma
		ON pdt.idmarca = ma.idmarca;