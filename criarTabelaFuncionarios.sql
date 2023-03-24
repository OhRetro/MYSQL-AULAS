CREATE TABLE IF NOT EXISTS funcionarios (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    salario DECIMAL(10,2) NOT NULL,
    data_inicio DATE,
    data_fim DATE,
    rua VARCHAR(255) NOT NULL,
    cidade VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
)

INSERT INTO funcionarios 
    (nome, salario, data_inicio, data_fim, rua, cidade)
VALUES
    ("Felipe", 12000.00, "2022-06-03", "2024-06-03", "Capitao Lessa", "Guaruja"),
    ("Joao", 5000.00, "2021-07-03", "2022-06-02", "Oswaldo Cruz", "Guaruja"),
    ("Lopes", 2500.00, "2022-07-03", "2022-03-05", "Oswaldo Cruz", "Guaruja"),
    ("Thiago", 7000.00, "2013-06-03", "2022-07-03", "Joana", "Santos"),
    ("Fernanda", 2500.00, "2013-06-03", "2015-09-12", "Jhons", "Santos"),
    ("Paula", 1300.00, "2014-09-04", "2024-09-07", "Joana", "Santos")

INSERT INTO funcionarios 
    (nome, salario, data_inicio, data_fim, rua, cidade)
VALUES
    ("Arial", 12000.00, "2022-06-03", "2024-06-03", "Capitao Lessa", "Guaruja"),
    ("Ara", 5000.00, "2021-07-03", "2022-06-02", "Oswaldo Cruz", "Guaruja")

INSERT INTO funcionarios 
    (nome, salario, data_inicio, data_fim, rua, cidade)
VALUES
    ("Mauricio", 6000.00, "2022-06-03", "2024-06-03", "Capitao Lessa", "Guaruja")

INSERT INTO funcionarios 
    (nome, salario, data_inicio, data_fim, rua, cidade)
VALUES
    ("Fatima", 6000.00, "2022-06-03", "2024-06-03", "Capitao Lessa", "Guaruja"),
    ("Nathan", 5000.00, "2021-06-03", "2022-06-02", "Rua pix", "Rio de Janeiro"),
    ("Antonia", 2500.00, "2022-07-03", "2022-03-05", "Rua rio", "Rio de Janeiro"),
    ("Jose", 12000.00, "2022-07-03", "2022-03-05", "Rua Verde", "Rio de Janeiro")

SELECT * FROM funcionarios
ORDER BY cidade

SELECT * FROM funcionarios
ORDER BY rua DESC

SELECT * FROM funcionarios
ORDER BY rua ASC

SELECT MIN(salario) "Menor Salario" FROM funcionarios

SELECT MAX(salario) "Maior Salario" FROM funcionarios

SELECT COUNT(id) FROM funcionarios

SELECT AVG(salario) "Salario Media" FROM funcionarios

SELECT SUM(salario) FROM funcionarios

SELECT * FROM funcionarios
WHERE nome LIKE "f%"

SELECT * FROM funcionarios
WHERE nome LIKE "%a"

SELECT * FROM funcionarios
WHERE nome LIKE "%au%"

SELECT * FROM funcionarios
WHERE nome LIKE "_a%"

SELECT * FROM funcionarios
WHERE nome LIKE "__l%"

SELECT * FROM funcionarios
WHERE nome LIKE "f%a"

SELECT * FROM funcionarios
WHERE cidade in ("Rio de Janeiro", "Santos")

SELECT * FROM funcionarios
WHERE salario BETWEEN 1000 AND 4000

SELECT SUM(salario), cidade FROM funcionarios
GROUP BY cidade
ORDER BY SUM(salario) DESC

--SELECT DATEDIFF(data_fim, data_inicio) "Duração"
SELECT DATEDIFF(data_inicio, data_fim) "Duração"
FROM funcionarios
WHERE nome = "Felipe"