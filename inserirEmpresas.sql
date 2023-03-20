ALTER TABLE empresas MODIFY cnpj VARCHAR(14)

INSERT INTO empresas 
    (nome, cnpj)
VALUES
    ("Bradesco", "9813729323"),
    ("Vale", "3234123444"),
    ("Cielo", "23232434233")

SELECT * FROM empresas
SELECT * FROM empresas_unidades
SELECT * FROM cidades

INSERT INTO `empresas_unidades`
    (empresa_id, cidade_id, sede)
VALUES
    (1, 1, 0),
    (2, (SELECT id FROM cidades WHERE nome = "Caruaru"), 1),
    (3, 1, 1)
