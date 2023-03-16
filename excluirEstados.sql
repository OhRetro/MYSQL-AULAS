INSERT INTO `estados`
    (id, nome, sigla, regiao, populacao)
VALUES
    (1000, "novo1", "N1", "Norte", 0.33),
    (1001, "novo2", "N2", "Norte", 0.33),
    (1002, "novo3", "N3", "Norte", 0.33)

DELETE FROM `estados`
WHERE sigla = "N3"

DELETE FROM `estados`
WHERE id >= 1000