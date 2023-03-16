SELECT
    regiao as "Região",
    sum(populacao) as total
FROM `estados`
GROUP BY regiao
ORDER BY total desc

SELECT * FROM estados