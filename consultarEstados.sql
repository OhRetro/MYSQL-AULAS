SELECT * FROM estados

SELECT nome, sigla FROM estados

SELECT nome as "Nome dos Estados", sigla as "Sigla dos Estados" FROM estados

SELECT nome, sigla, regiao FROM estados
    WHERE regiao = "Norte"

SELECT nome, sigla, regiao FROM estados
    WHERE id = 1