CREATE TABLE IF NOT EXISTS clientes (
    nome VARCHAR(255) NOT NULL,
    cpf VARCHAR(255) NOT NULL,
    rg VARCHAR(255) NOT NULL,
    endereco VARCHAR(255) NOT NULL,
    idade INT UNSIGNED NOT NULL,
    data_de_nascimento DATE NOT NULL,
    UNIQUE KEY (rg, cpf)
);


CREATE TABLE IF NOT EXISTS funcionarios (
    nome VARCHAR(255) NOT NULL,
    cpf VARCHAR(255) NOT NULL,
    rg VARCHAR(255) NOT NULL,
    endereco VARCHAR(255) NOT NULL,
    comissao INT UNSIGNED NOT NULL,
    cargo VARCHAR(25) NOT NULL,
    idade INT UNSIGNED NOT NULL,
    data_de_nascimento DATE NOT NULL,
    trabalhando_desde DATE NOT NULL,
    UNIQUE KEY (rg, cpf)
);

CREATE TABLE IF NOT EXISTS carros (
    nome VARCHAR(255) NOT NULL,
    modelo VARCHAR(255) NOT NULL,
    valor DECIMAL(6,2) NOT NULL,
    data_de_fabricacao DATE NOT NULL,
    UNIQUE KEY (modelo)
);

CREATE TABLE IF NOT EXISTS vendas (
    nome_do_funcionario VARCHAR(255) NOT NULL,
    
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    comissao INT UNSIGNED NOT NULL,
    valor_da_venda DECIMAL(6,2) NOT NULL,
    
    nome_do_carro VARCHAR(255) NOT NULL,
    modelo_do_carro VARCHAR(255) NOT NULL,
    
    nome_do_cliente VARCHAR(255) NOT NULL,
    cpf_do_cliente VARCHAR(255) NOT NULL,
    rg_do_cliente VARCHAR(255) NOT NULL,

    PRIMARY KEY (id)
);

SELECT * FROM clientes
SELECT * FROM funcionarios
SELECT * FROM carros
SELECT * FROM vendas


INSERT INTO clientes
    (nome, cpf, rg, endereco, idade, data_de_nascimento)
VALUES
    ("Filipe Lucas da Mata", "35291095849", "107812010", "Avenida Agrícola Paes de Barros", 20, "2003-01-27"),
    ("Tatiane Tatiane Vieira", "86868764634", "233140153", "Rua Congo", 20, "2003-01-10"),
    ("Renata Heloise Figueiredo", "56867370616", "422019999", "Rua Valdeci Vasconcelos", 20, "2003-02-02")


INSERT INTO `funcionarios`
    (nome, cpf, rg, endereco, comissao, cargo, idade, data_de_nascimento, trabalhando_desde)
VALUES
    ("Naka", "46302106950", "126817899", "Rua Pão Doce de Barros", 10, "CEO", 20, "2003-01-27", "1945-12-19"),
    ("Murilo", "46302106950", "126817899", "Rua Pão Doce de Barros", 10, "CEO", 20, "2003-01-27", "1945-12-19"),
    ("João", "46302106950", "126817899", "Rua Pão Doce de Barros", 10, "CEO", 20, "2003-01-27", "1945-12-19"),


INSERT INTO carros
    (nome, modelo, valor, data_de_fabricacao)
VALUES
    ("Toyota", "Corolla", 1200.00, "2022-07-17"),
    ("Ford", "Mustang", 4000.00, "2022-05-10"),
    ("Honda", "Civic", 1250.00, "2022-04-09")

