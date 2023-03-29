CREATE TABLE IF NOT EXISTS petshop_informacao (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,

    nome VARCHAR(255) NOT NULL,
    data_de_criacao DATE NOT NULL,
    cnpj VARCHAR(14) NOT NULL,
    endereco VARCHAR(255) NOT NULL,

    PRIMARY KEY (id),
    UNIQUE KEY (cnpj)
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

CREATE TABLE IF NOT EXISTS clientes (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,

    nome VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    nome_cachorro VARCHAR(255) NOT NULL,
    raca_cachorro VARCHAR(255) NOT NULL,
    cpf VARCHAR(255) NOT NULL,
    rg VARCHAR(255) NOT NULL,
    endereco VARCHAR(255) NOT NULL,
    idade INT UNSIGNED NOT NULL,
    data_de_nascimento DATE NOT NULL,

    PRIMARY KEY (id),
    UNIQUE KEY (email, cpf, rg)
);

CREATE TABLE IF NOT EXISTS servicos (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,

    nome VARCHAR(255) NOT NULL,
    descricao VARCHAR(255) NOT NULL,
    valor DECIMAL(10,2) NOT NULL,

    PRIMARY KEY (id),
    UNIQUE KEY (nome)
);

CREATE TABLE IF NOT EXISTS produtos (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,

    nome VARCHAR(255) NOT NULL,
    descricao VARCHAR(255) NOT NULL,
    valor DECIMAL(10,2) NOT NULL,

    PRIMARY KEY (id),
    UNIQUE KEY (nome)
);

CREATE TABLE IF NOT EXISTS vendas (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,

    id_cliente INT UNSIGNED NOT NULL,
    id_funcionario INT UNSIGNED NOT NULL,
    id_servico INT UNSIGNED NULL,
    id_produto INT UNSIGNED NULL,

    PRIMARY KEY (id),
    FOREIGN KEY (id_cliente) REFERENCES clientes (id),
    FOREIGN KEY (id_funcionario) REFERENCES funcionarios (id),
    FOREIGN KEY (id_servico) REFERENCES servicos (id),
    FOREIGN KEY (id_produto) REFERENCES produtos (id)
);

INSERT INTO petshop_informacao
    (nome, data_de_criacao, cnpj, endereco)
VALUES
    ("PetShop Heaven's Dog", "2017-06-15", "37185560000178", "Rua Rafael Machado Neto")

INSERT INTO funcionarios
    (nome, cpf, rg, endereco, comissao, cargo, idade, data_de_nascimento, trabalhando_desde)
VALUES
    ("Nathan", "46302106950", "126817899", "Rua Pão Doce de Barros", 99, "Dono", 23, "1997-10-19", "2017-06-15"),
    ("Joana", "57413217061", "237928900", "Rua Barros", 50, "Cuidadora", 21, "2002-02-27", "2017-09-29"),
    ("Jonathan", "57413217061", "348039011", "Rua Pão", 10, "Atendente", 22, "2001-01-20", "2018-05-13")

INSERT INTO clientes
    (nome, email, nome_cachorro, raca_cachorro, cpf, rg, endereco, idade, data_de_nascimento)
VALUES
    ("Filipe Lucas da Mata", "nicolas-dacunha73@diebold.com", "Max", "Golden Retriever", "35291095849", "107812010", "Avenida Agrícola Paes de Barros", 20, "2003-01-27"),
    ("Tatiane Tatiane Vieira", "auroraelianemoraes@sofisticattomoveis.com.br", "Luna", "Poodle", "86868764634", "233140153", "Rua Congo", 20, "2003-01-10"),
    ("Renata Heloise Figueiredo", "gabrielly_teixeira@fabianocosta.com.br", "Charlie", "Bulldog Francês", "56867370616", "422019999", "Rua Valdeci Vasconcelos", 20, "2003-02-02")

INSERT INTO servicos 
    (nome, descricao, valor) 
VALUES
    ("Banho e Tosa", "Serviço de banho, tosa e secagem para cães e gatos. Inclui corte de unhas e limpeza de ouvidos", 80.00),
    ("Consulta Veterinária", "Consulta com médico veterinário para avaliação de saúde do animal de estimação", 150.00),
    ("Adestramento", "Treinamento comportamental para cães, com foco em obediência e sociabilização", 120.00),
    ("Hospedagem", "Serviço de hospedagem para animais de estimação, com alimentação, higiene e monitoramento 24 horas", 50.00),
    ("Passeio", "Passeio diário com cães, em grupo ou individual, com duração de 30 ou 60 minutos", 30.00),
    ("Cirurgia", "Procedimento cirúrgico para animais de estimação, com anestesia e cuidados pós-operatórios", 800.00)

INSERT INTO produtos 
    (nome, descricao, valor) 
VALUES
    ("Ração para Cães", "Ração para cães adultos de porte médio, com sabor de frango, 1kg", 59.90),
    ("Ração para Gatos", "Ração para gatos adultos de raças pequenas, com sabor de salmão, 1kg", 39.90),
    ("Brinquedo para Cães", "Bola de borracha para cães, tamanho médio", 19.90),
    ("Produtos de Higiene", "Shampoo para cães e gatos com pele sensível, 500ml", 29.90),
    ("Acessório para Cães", "Coleira de couro com detalhes em metal, tamanho médio", 49.90),
    ("Cama para Cães", "Cama de espuma com capa removível, tamanho grande", 199.90)

INSERT INTO vendas
    (id_cliente, id_funcionario, id_servico, id_produto)
VALUES
    (3, 1, 3, NULL),
    (1, 2, 1, NULL),
    (2, 3, NULL, 4)

INSERT INTO vendas
    (id_cliente, id_funcionario, id_servico, id_produto)
VALUES
    (3, 2, 1, 1)

SELECT * FROM vendas

SELECT
f.nome "Funcionario", f.comissao "Comissão",
cl.nome "Cliente", cl.cpf "CPF", cl.rg "RG", cl.nome_cachorro "Cachorro", cl.raca_cachorro "Raça",
IFNULL(s.nome, "NENHUM") "Serviço", IFNULL(s.valor, 0) "S. Preço",
IFNULL(p.nome, "NENHUM") "Produto", IFNULL(p.valor, 0) "P. Preço",
SUM(IFNULL(s.valor, 0) + IFNULL(p.valor, 0)) "Preço Total"
FROM vendas v
INNER JOIN funcionarios f ON f.id = v.id_funcionario
INNER JOIN clientes cl ON cl.id = v.id_cliente
LEFT JOIN servicos s ON s.id = v.id_servico
LEFT JOIN produtos p ON p.id = v.id_produto
GROUP BY v.id
