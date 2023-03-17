SELECT * FROM `estados` as e, `cidades` as c
WHERE e.id = c.estado_id

SELECT
    e.nome as "Estado",
    c.nome as "Cidade",
    e.regiao as "Região"
FROM `estados` as e, `cidades` as c
WHERE e.id = c.estado_id

SELECT 
    c.nome as Cidade,
    e.nome as Estado,
    e.regiao as Regiao 
FROM estados as e 
INNER JOIN cidades as c on e.id = c.estado_id