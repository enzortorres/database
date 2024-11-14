-- Questão 01
CREATE TABLE cliente (
    cod_cliente INTEGER PRIMARY KEY,
    nome VARCHAR(50),
    cidade VARCHAR(50),
    estado VARCHAR(2),
    dt_nascimento DATE,
    estadocivil VARCHAR(20)
);

CREATE TABLE compra (
    cod_compra INTEGER PRIMARY KEY,
    hora TIME,
    data DATE,
    cod_cliente INTEGER,
    cod_funcionario INTEGER,
    FOREIGN KEY (cod_cliente) REFERENCES cliente(cod_cliente),
    FOREIGN KEY (cod_funcionario) REFERENCES funcionario(cod_funcionario)
);

CREATE TABLE funcionario (
    cod_funcionario INTEGER PRIMARY KEY,
    nome VARCHAR(50),
    cidade VARCHAR(50),
    estado VARCHAR(2),
    genero CHAR(1),
    cargo VARCHAR(20)
);

CREATE TABLE produto (
    cod_produto INTEGER PRIMARY KEY,
    descricao VARCHAR(100),
    preco DECIMAL(10, 2),
    estoque INTEGER,
    cod_fabricante INTEGER,
    FOREIGN KEY (cod_fabricante) REFERENCES fabricante(cod_fabricante)
);

CREATE TABLE possui (
    cod_compra INTEGER,
    cod_produto INTEGER,
    qtd INTEGER,
    valor_desconto DECIMAL(10, 2),
    PRIMARY KEY (cod_compra, cod_produto),
    FOREIGN KEY (cod_compra) REFERENCES compra(cod_compra),
    FOREIGN KEY (cod_produto) REFERENCES produto(cod_produto)
);

CREATE TABLE fabricante (
    cod_fabricante INTEGER PRIMARY KEY,
    nome VARCHAR(50),
    email VARCHAR(50),
    cidade VARCHAR(50)
);

-- Questão 02
-- a) Recupere o nome, a cidade e o estado dos clientes da região Nordeste

SELECT nomecliente, cidade, estado
    FROM cliente
    WHERE estado IN ('AL', 'BA', 'CE', 'MA', 'PB', 'PE', 'PI', 'RN', 'SE');

-- b) Recupere o nome dos clientes que possuem “Silva” no nome
SELECT nomecliente
    FROM cliente
    WHERE nome LIKE '%Silva%';

-- c) Recupere o nome dos clientes que não realizaram compras no ano de 2024
SELECT nomecliente
    FROM cliente
    WHERE cod_cliente NOT IN (
        SELECT cod_cliente
        FROM compra
        WHERE YEAR(data) = 2024
    );

-- d) Recupere o nome do cliente, o nome do funcionário e o produto que ele comprou
SELECT nomecliente, nomefuncionario, produto
    FROM compra
    INNER JOIN cliente
        ON compra.cod_cliente = cliente.cod_cliente
    INNER JOIN funcionario
        ON compra.cod_funcionario = funcionario.cod_funcionario
    INNER JOIN possui
        ON compra.cod_compra = possui.cod_compra
    INNER JOIN produto
        ON possui.cod_produto = produto.cod_produto;

-- e) Recupere o total de funcionários por cidade cuja a quantidade de compras seja maior que 5

SELECT funcionario.cidade, COUNT(funcionario.cod_funcionario) AS totalfuncionarios
    FROM funcionario
    INNER JOIN compra
        ON funcionario.cod_funcionario = compra.cod_funcionario
    GROUP BY funcionario.cidade
    HAVING COUNT(compra.cod_compra) > 5;
-- f) Recupere os 5 clientes que realizaram mais compras

SELECT cliente.nome, COUNT(compra.cod_compra) AS totalcompras
    FROM cliente
    INNER JOIN compra
        ON cliente.cod_cliente = compra.cod_cliente
    GROUP BY cliente.cod_cliente
    ORDER BY totalcompras DESC
    LIMIT 5;

-- g) Recupere o total de produtos por fabricante
SELECT fabricante.nome, COUNT(produto.cod_produto) AS totalprodutos
    FROM fabricante
        INNER JOIN produto
    ON fabricante.cod_fabricante = produto.cod_fabricante
    GROUP BY fabricante.cod_fabricante;

-- h) Recupere a lista de produtos que nunca foram vendidos
SELECT descricao
    FROM produto
    WHERE cod_produto NOT IN (
        SELECT cod_produto
        FROM possui
    );

-- i) Recupere a quantidade de clientes sem cidade cadastrada
SELECT COUNT(*) AS clientes
    FROM cliente
    WHERE cidade IS NULL OR cidade = '';

-- j) Recupere o valor total de descontos aplicados em produtos cujo o preço é acima do valor médio dos produtos
SELECT SUM(possui.valor_desconto) AS totaldescontos
    FROM possui
    INNER JOIN produto
        ON possui.cod_produto = produto.cod_produto
    WHERE produto.preco > (SELECT AVG(preco) FROM produto);