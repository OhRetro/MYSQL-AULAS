UPDATE estados
SET nome = "Maranhão"
WHERE sigla = "MA"

UPDATE estados
SET nome = "Paraná",
    populacao = 11.32
WHERE sigla = "PR"

SELECT est.nome, est.sigla FROM estados as est