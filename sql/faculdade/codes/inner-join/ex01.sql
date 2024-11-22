-- EX 1 – Recupere o valor do produto mais caro
SELECT MAX(preco) AS maiorpreco -- PEGAR O MAIOR VALOR DA COLUNA PREÇO
	FROM produto;
	
-- EX 2 – Recupere a menor quantidade comprada
SELECT MIN(qtd) AS menorqtd -- PEGAR O MENOR VALOR DA COLUNA QUANTIDADE
	FROM compras;

-- EX 3 – Recupere a média de quantidade compradas
SELECT ROUND(AVG(qtd), 2) AS mediaqtd -- PEGAR A MEDIA ARREDONDADA EM 2 CASA DECIMAIS
	FROM compras;

-- EX 4 – Recupere a quantidade de clientes do estado do Rio de Janeiro
SELECT COUNT(*) AS qtdrio  -- CONTAR A QUANTIDADE DE CLIENTES DO RIO DE JANEIRO (SEMPRE USAR * OU CHAVE PRIMÁRIA)
	FROM cliente
	WHERE estado = 'Rio de Janeiro';

-- EX 5 – Recupere o valor médio dos produtos
SELECT ROUND(AVG(preco),2) AS mediapreco -- PEGAR 
	FROM produto;
	
-- EX 6 - Recupere a quantidade de vendas de produtos da marca bom prato
SELECT COUNT(*) AS vendasbomprato
	FROM compras AS co
	INNER JOIN produto AS pdt 
		ON co.idproduto = pdt.idproduto
	INNER JOIN marca AS ma 
		ON pdt.idmarca = ma.idmarca
	WHERE ma.nomemarca = 'Bom Prato';
	
-- EX07 – Recupere a quantidade de produtos comprados na loja Vale Verde
SELECT SUM(qtd) AS qtdprodutovaleverde
	FROM produto AS pdt
	INNER JOIN compras AS cm 
		ON pdt.idproduto = cm.idproduto
	INNER JOIN loja AS lj 
		ON cm.idloja = lj.idloja
	WHERE nomeloja = 'Vale Verde';
	
-- EX 8 – Recupere a soma dos produtos comprados em lojas localizadas em Minas Gerais
SELECT SUM(qtd) AS qtdprodutomg
	FROM produto AS pdt
	INNER JOIN compras AS cm
		ON pdt.idproduto = cm.idproduto
	INNER JOIN loja AS lj
		ON cm.idloja = lj.idloja
	WHERE lj.uf = 'MG';
	
-- EX09 – Recupere o quantidade total vendida de Macarrão
UPDATE produto
	SET nomeproduto = 'Macarrão'
	WHERE nomeproduto = 'Marcarrão';

SELECT SUM(qtd) AS qtdmacarrao
	FROM produto AS pdt
	INNER JOIN compras AS cm
		ON pdt.idproduto = cm.idproduto
	WHERE pdt.nomeproduto LIKE 'Macarrão';


-- EX10 – Recupere a quantidade total de todas as vendas
SELECT SUM(qtd) AS qtdtotal, COUNT(*) AS qtdvenda
	FROM compras as cm;
	
-- EX11 – Recupere a quantidade de cliente por estado
SELECT COUNT(*) AS qtdcliente, estado
	FROM cliente
	GROUP BY estado
	ORDER BY qtdcliente DESC;
	
-- EX12 - Recupere a quantidade de lojas por estado
SELECT COUNT(*) AS qtdloja, uf
	FROM loja
	GROUP BY uf
	ORDER BY qtdloja DESC;
	
-- EX13 - Recupere a quantidade de produtos por marca
SELECT COUNT(*) AS qtdpdt, nomemarca
	FROM produto AS pdt
	INNER JOIN marca AS ma
		ON pdt.idmarca = ma.idmarca
	GROUP BY nomemarca
	ORDER BY qtdpdt DESC;
	
-- EX14 – Recupere o valor total de compras por marca
SELECT ma.nomemarca, SUM(cp.qtd * pdt.preco) AS valortotal
	FROM produto AS pdt
	INNER JOIN compras AS cp
		ON pdt.idproduto = cp.idproduto
	INNER JOIN marca AS ma
		ON pdt.idmarca = ma.idmarca
	GROUP BY nomemarca
	ORDER BY valortotal DESC;
	
-- EX15 – Recupere a quantidade média de vendas por produto
SELECT ROUND(AVG(qtd), 2) AS qtdmediavenda, nomeproduto
	FROM compras AS cp
	INNER JOIN produto AS pdt
		ON pdt.idproduto = cp.idproduto
	GROUP BY nomeproduto
	ORDER BY qtdmediavenda DESC;
	
-- EX16 – Recupere o faturamento por loja
SELECT nomeloja, ROUND(SUM(cm.qtd * pdt.preco), 2) AS faturamento
	FROM loja AS lj
	INNER JOIN compras AS cm
		ON cm.idloja = lj.idloja
	INNER JOIN produto AS pdt
		ON pdt.idproduto = cm.idproduto
	GROUP BY lj.nomeloja
	ORDER BY faturamento DESC;

-- EX17 – Recupere a quantidade de produtos comprados por cliente
SELECT cli.nomecliente, cli.genero, SUM(qtd) AS qtdprodutos
	FROM cliente AS cli
	INNER JOIN compras AS cm
		ON cm.idcliente = cli.idcliente
	GROUP BY nomecliente, genero
	ORDER BY qtdprodutos DESC;

-- EX18 – Recupere a quantidade de clientes por cidade, exibindo as 5 cidades com mais clientes
SELECT cidade, COUNT(*) AS qtdclientes
	FROM cliente AS cli
	GROUP BY cidade
	ORDER BY qtdclientes DESC
	LIMIT 5;
	
-- EX19 – Recupere a quantidade total de produtos vendidos, em ordem de total de vendas por produto
SELECT nomeproduto, SUM(qtd) AS totalvendas
	FROM produto AS pdt
	INNER JOIN compras AS cp
		ON pdt.idproduto = cp.idproduto
	GROUP BY nomeproduto
	ORDER BY totalvendas DESC;
	
-- EX20 – Recupere os 5 clientes que mais gastaram comprando produtos no armazém
SELECT nomecliente, SUM(cm.qtd * pdt.preco) AS gastototal
	FROM cliente AS cli
	INNER JOIN compras AS cm
		ON cli.idcliente = cm.idcliente
	INNER JOIN produto AS pdt
		ON cm.idproduto = pdt.idproduto
	GROUP BY nomecliente
	ORDER BY gastototal DESC
	LIMIT 5;
	
-- EX21 – Recupere quantidade de clientes por estado, mas exiba apenas os estados com mais de 50 clientes
SELECT estado, COUNT(*) AS qtdclientes
	FROM cliente AS cli
	GROUP BY estado
	HAVING COUNT(*) > 50
	ORDER BY qtdclientes DESC;
	
-- EX22 – Recupere o total faturado por marca, mas apenas as empresas que faturaram mais de 25000 Reais
SELECT ma.nomemarca, SUM(cp.qtd * pdt.preco) AS valortotal
	FROM produto AS pdt
	INNER JOIN compras AS cp
		ON pdt.idproduto = cp.idproduto
	INNER JOIN marca AS ma
		ON pdt.idmarca = ma.idmarca
	GROUP BY nomemarca
	HAVING SUM(cp.qtd * pdt.preco) > 25000
	ORDER BY valortotal DESC;
	
-- EX23 – Recupere a quantidade de compras por cliente, mas exiba apenas os clientes com menos de 5 compras realizadas
SELECT nomecliente, COUNT(*) AS qtdcompras
	FROM cliente AS cli
	INNER JOIN compras AS cp
		ON cli.idcliente = cp.idcliente
	GROUP BY nomecliente
	HAVING COUNT(*) < 5
	ORDER BY qtdcompras DESC;
	
-- EX24 – Recupere o nome do produto mais caroo
SELECT nomeproduto
	FROM produto
	WHERE preco = (
		SELECT MAX(preco)
			FROM produto
	);

-- EXEMPLO DE LEFT JOIN
SELECT * FROM marca AS ma
	LEFT JOIN produto AS pdt
		ON ma.idmarca = pdt.idmarca;

-- OQUE VAI CAIR NA AV2
-- DDL (CREATE)
-- DML (INSERT, UPDATE)
-- DQL (TODA)