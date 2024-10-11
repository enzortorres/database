CREATE TABLE ocorrencia (
    codmulta INTEGER,
    placa CHAR(7),
    datamulta DATE,
    codagente INTEGER,
    PRIMARY KEY(codmulta, placa, datamulta), -- SÓ DEFINE A CHAVE PRIMÁRIA EMBAIXO QUANDO É UMA CHAVE PRIMÁRIA COMPOSTA
    FOREIGN KEY(codmulta) REFERENCES multas(codmulta),
    FOREIGN KEY(placa) REFERENCES carro(placa),
    FOREIGN KEY(codagente) REFERENCES agente(codagente),
);