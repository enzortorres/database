--EX1
CREATE TABLE aluno (
	matricula INTEGER PRIMARY KEY,	
	nomeAluno VARCHAR(50) NOT NULL,
	sexo VARCHAR(1) CHECK (sexo IN ('M', 'F', 'O')),
	dtNascimento DATE
);

-- EX2
CREATE TABLE departamento (
	codDepto INTEGER PRIMARY KEY,
	nomeDepto VARCHAR(50) NOT NULL
);

-- EX3
CREATE TABLE curso (
	codCurso INTEGER PRIMARY KEY,
	nomeCurso VARCHAR(30) NOT NULL,
	ch INTEGER NOT NULL,
	preco REAL,
	codDepto INTEGER,
	FOREIGN KEY (codDepto) REFERENCES departamento (codDepto)
);

-- EX4
CREATE TABLE matricula(
	matriculaAluno INTEGER,
	codCurso INTEGER, 
	dtMatricula DATE,
	PRIMARY KEY (matriculaAluno,codCurso),
	FOREIGN KEY (matriculaAluno) REFERENCES aluno (matricula),
	FOREIGN KEY (codCurso) REFERENCES curso (codCurso)
);

-- EX4.2 (NAO MUITO RECOMENDADO)
CREATE TABLE matricula(
	codmatricula SERIAL PRIMARY KEY,
	matriculaAluno INTEGER,
	codCurso INTEGER, 
	dtMatricula DATE,
	PRIMARY KEY (matriculaAluno,codCurso),
	FOREIGN KEY (matriculaAluno) REFERENCES aluno (matricula),
	FOREIGN KEY (codCurso) REFERENCES curso (codCurso)
);

-- EX5
CREATE TABLE func (
	codFunc INTEGER PRIMARY KEY,
	nomeFunc VARCHAR(20),
	city VARCHAR(30),
	CBO INTEGER,
	UF CHAR(2),
	codDepto INTEGER,
	FOREIGN KEY (codDepto) REFERENCES departamento (codDepto)
);

-- EX6
ALTER TABLE func RENAME COLUMN city TO cidade;

-- EX7
ALTER TABLE func ADD COLUMN sexo CHAR(1);

-- EX8
ALTER TABLE func ALTER COLUMN nomeFunc TYPE VARCHAR(30);

-- EX9
ALTER TABLE func DROP COLUMN cbo;

-- EX10 
ALTER TABLE func ALTER COLUMN UF SET DEFAULT 'RJ';

-- EX11
ALTER TABLE func RENAME TO funcionario;

-- EX12
ALTER TABLE funcionario ALTER COLUMN nomeFunc SET NOT NULL;

-- EX13
CREATE SEQUENCE funcionarioSequence START WITH 50022000 INCREMENT BY 1;
ALTER TABLE funcionario ALTER COLUMN codFunc SET DEFAULT NEXTVAL('funcionarioSequence');

SELECT * FROM funcionario;