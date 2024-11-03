CREATE DOMAIN dom_sexo AS char(1)
NOT NULL
CHECK (VALUE IN ('M', 'F', 'O'));

CREATE TABLE departamento(
	coddepto INTEGER PRIMARY KEY, 
	NOMEDEPTO VARCHAR(50) NOT NULL
);

INSERT INTO departamento (coddepto, nomedepto)
VALUES
(1, 'RH'), 
(2, 'Contabilidade'),
(3, 'TI');

SELECT * FROM departamento;

CREATE TABLE funcionario(
	matricula INTEGER PRIMARY KEY,
	nome VARCHAR(50) NOT NULL,
	sexo dom_sexo,
	nascimento DATE CHECK(nascimento < '2006-01-1'),
	salario REAL CHECK(salario >= 1412),
	coddepto INTEGER,
	FOREIGN KEY(coddepto) REFERENCES departamento(coddepto)
);

-- EX01 - TESTAR RESTRIÇÃO DE CHAVE
INSERT INTO departamento(coddepto, nomedepto)
VALUES
(2, 'Financeiro'); 
-- FERE A RESTRIÇÃO DE CHAVE

--EX02 - TESTAR RESTRIÇÃO DE ENTIDADE
INSERT INTO departamento(coddepto, nomedepto) -- FERE A RESTRIÇÃO DE ENTIDADE
VALUES
(NULL, 'Financeiro');
-- FERE A RESTRIÇÃO DE ENTIDADE

INSERT INTO funcionario(matricula, nome, sexo, nascimento, salario, coddepto) VALUES
(1, 'Ana', 'F', '1976-05-01', 5000, 3);

SELECT * FROM funcionario;

--EX04 - TESTAR RESTRIÇÃO DE DOMÍNIO
INSERT INTO funcionario(matricula, nome, sexo, nascimento, salario, coddepto) VALUES
(2, 'Optimus Prime', 'T', '0076-01-01', 3425000, 3);
-- FERE RESTRIÇÃO DE INTEGRIDADE REFERENCIAL

--EX05 
INSERT INTO funcionario(matricula, nome, sexo, nascimento, salario, coddepto) VALUES
(2, 'Ana', 'F', '1976-05-01', 1000, 3);
-- FERE RESTRIÇÃO DE SEMÂNTICA