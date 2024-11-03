SELECT * FROM produto;
SELECT * FROM marca;

SELECT produto.nomeproduto, marca.nomemarca -- ASSIM QUE FAZ UM JOIN
	FROM produto, marca
	WHERE produto.idmarca = marca.idmarca
	AND nomemarca = 'Bom Prato'; -- BUSCA MAIS ESPECÍFICA, BUSCANDO OS PRODUTOS DA MARCA "Bom Prato"
	
SELECT cliente.nomecliente, compras.idcompra, compras.idproduto, compras.dtcompra, compras.idloja, compras.qtd --ASSIM JUNTA MAIS DE UMA TABELA NO JOIN
	FROM cliente, compras, loja
	WHERE cliente.idcliente = compras.idcliente AND loja.idloja = compras.idloja