CREATE TABLE IF NOT EXISTS clientes (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,

    nome VARCHAR(255) NOT NULL,
    cpf VARCHAR(255) NOT NULL,
    rg VARCHAR(255) NOT NULL,
    endereco VARCHAR(255) NOT NULL,
    idade INT UNSIGNED NOT NULL,
    data_de_nascimento DATE NOT NULL,

    PRIMARY KEY (id),
    UNIQUE KEY (rg, cpf)
);


CREATE TABLE IF NOT EXISTS funcionarios (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,

    nome VARCHAR(255) NOT NULL,
    cpf VARCHAR(255) NOT NULL,
    rg VARCHAR(255) NOT NULL,
    endereco VARCHAR(255) NOT NULL,
    comissao INT UNSIGNED NOT NULL,
    cargo VARCHAR(25) NOT NULL,
    idade INT UNSIGNED NOT NULL,
    data_de_nascimento DATE NOT NULL,
    trabalhando_desde DATE NOT NULL,

    PRIMARY KEY (id),
    UNIQUE KEY (rg, cpf)
);

CREATE TABLE IF NOT EXISTS carros (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,

    nome VARCHAR(255) NOT NULL,
    modelo VARCHAR(255) NOT NULL,
    valor DECIMAL(6,2) NOT NULL,
    data_de_fabricacao DATE NOT NULL,

    PRIMARY KEY (id),
    UNIQUE KEY (modelo)
);

CREATE TABLE IF NOT EXISTS vendas (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,

    id_funcionario INT UNSIGNED NOT NULL,
    id_carro INT UNSIGNED NOT NULL,
    id_cliente INT UNSIGNED NOT NULL,

    PRIMARY KEY (id),
    FOREIGN KEY (id_funcionario) REFERENCES funcionarios (id),
    FOREIGN KEY (id_carro) REFERENCES carros (id),
    FOREIGN KEY (id_cliente) REFERENCES clientes (id)
);


INSERT INTO clientes
    (nome, cpf, rg, endereco, idade, data_de_nascimento)
VALUES
    ("Filipe Lucas da Mata", "35291095849", "107812010", "Avenida Agrícola Paes de Barros", 20, "2003-01-27"),
    ("Tatiane Tatiane Vieira", "86868764634", "233140153", "Rua Congo", 20, "2003-01-10"),
    ("Renata Heloise Figueiredo", "56867370616", "422019999", "Rua Valdeci Vasconcelos", 20, "2003-02-02")


INSERT INTO `funcionarios`
    (nome, cpf, rg, endereco, comissao, cargo, idade, data_de_nascimento, trabalhando_desde)
VALUES
    ("Naka", "46302106950", "126817899", "Rua Pão Doce de Barros", 99, "CEO", 100, "2005-12-19", "1945-12-19"),
    ("Matheus", "57413217061", "237928900", "Rua Barros", 50, "Gerente", 60, "2004-02-27", "1945-02-27"),
    ("Jonathan", "57413217061", "348039011", "Rua Pão", 10, "Vendedor", 21, "2004-01-20", "1945-01-20")


INSERT INTO carros
    (nome, modelo, valor, data_de_fabricacao)
VALUES
    ("Toyota", "Corolla", 1200.00, "2022-07-17"),
    ("Ford", "Mustang", 4000.00, "2022-05-10"),
    ("Honda", "Civic", 1250.00, "2022-04-09")

INSERT INTO `vendas`
    (id_funcionario, id_carro, id_cliente)
VALUES
    (
        (SELECT id FROM `funcionarios` WHERE cargo = "CEO"),
        (SELECT id FROM `carros` WHERE nome = "Ford"),
        (SELECT id FROM `clientes` WHERE rg = "107812010")
    ),
    (
        (SELECT id FROM `funcionarios` WHERE cargo = "Gerente"),
        (SELECT id FROM `carros` WHERE nome = "Toyota"),
        (SELECT id FROM `clientes` WHERE rg = "233140153")
    ),
    (
        (SELECT id FROM `funcionarios` WHERE cargo = "Vendedor"),
        (SELECT id FROM `carros` WHERE nome = "Honda"),
        (SELECT id FROM `clientes` WHERE rg = "422019999")
    )

SELECT * FROM clientes
SELECT * FROM funcionarios
SELECT * FROM carros
SELECT * FROM vendas

DROP TABLE `clientes`
DROP TABLE `vendas`
DROP TABLE `funcionarios`
DELETE FROM vendas WHERE id = 1;

SELECT nome, comissao FROM `funcionarios` WHERE id = (SELECT id_funcionario FROM `vendas` WHERE id = 1)
SELECT nome, modelo, valor FROM `carros` WHERE id = (SELECT id_carro FROM `vendas` WHERE id = 1)
SELECT * FROM `clientes` WHERE id = (SELECT id_cliente FROM `vendas` WHERE id = 1)

SELECT f.nome AS nome_funcionario, c.modelo, c.valor, cl.nome AS nome_cliente 
FROM vendas v 
INNER JOIN funcionarios f ON f.id = v.id_funcionario 
INNER JOIN carros c ON c.id = v.id_carro 
INNER JOIN clientes cl ON cl.id = v.id_cliente 
WHERE v.id = 1;


