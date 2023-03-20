SELECT e.nome, c.nome
FROM `empresas` as e, `empresas_unidades` as eu, `cidades` as c
WHERE e.id = eu.empresa_id
AND c.id = eu.cidade_id
AND eu.sede