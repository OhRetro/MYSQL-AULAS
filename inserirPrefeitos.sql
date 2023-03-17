SELECT * FROM `cidades`

INSERT INTO prefeitos
    (nome, cidade_id)
VALUES
    ("Marcos Neves", (SELECT id FROM `cidades` WHERE nome = "Mogi das Cruzes")),
    ("Raquel Lyra", (SELECT id FROM `cidades` WHERE nome = "Joinville")),
    ("Gabriella", (SELECT id FROM `cidades` WHERE nome = "Rio Branco"))

SELECT * FROM prefeitos