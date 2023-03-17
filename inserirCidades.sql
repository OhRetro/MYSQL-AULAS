SELECT * FROM `estados`

INSERT INTO `cidades`
    (nome, area, estado_id)
VALUES
    ("Rio Branco", 230.99, 1),
    ("Joinville", 187.44, 2)

SELECT * FROM `cidades`

INSERT INTO `cidades`
    (nome, area, estado_id)
VALUES
    (
        "Caruaru", 
        920.06, 
        (SELECT id FROM `estados` WHERE sigla = "PE")
    )

INSERT INTO `cidades`
    (nome, area, estado_id)
VALUES
    (
        "Juarez do Norte", 
        948.06, 
        (SELECT id FROM `estados` WHERE sigla = "CE")
    ),
    (
        "Mogi das Cruzes", 
        948.06, 
        (SELECT id FROM `estados` WHERE sigla = "SP")
    )