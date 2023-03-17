ALTER TABLE empresas MODIFY cnpj VARCHAR(14)

INSERT INTO empresas 
    (nome, cnpj)
VALUES
    ("Bradesco", "9813729323"),
    ("Vale", "3234123444"),
    ("Cielo", "23232434233")

SELECT * FROM empresas