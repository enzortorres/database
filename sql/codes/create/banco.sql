CREATE TABLE cliente (
    codcli INTEGER PRIMARY KEY,
    nomecli VARCHAR(30),
    sexo CHAR,
    dtnasc DATE,
    cidade VARCHAR(30),
    uf VARCHAR(2),
    cpf VARCHAR(11)
);

CREATE TABLE dependente (
    coddep INTEGER PRIMARY KEY,
    nomedep VARCHAR(30),
    sexo CHAR(1),
    dtnasc DATE,
    cidade VARCHAR(30),
    uf CHAR(2),
    cpf VARCHAR(11),
);

CREATE TABLE dependencia (
    codcli INTEGER,
    coddep INTEGER,
    graudependencia VARCHAR(20),
    PRIMARY KEY (codcli, coddep),
    FOREIGN KEY (codcli) REFERENCES cliente(codcli),
    FOREIGN KEY (coddep) REFERENCES dependente(coddep)
);
