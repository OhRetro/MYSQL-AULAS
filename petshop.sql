CREATE TABLE IF NOT EXISTS petshop (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,

  nome VARCHAR(255) NOT NULL,
  data_de_crição DATE NOT NULL,
  cnpj VARCHAR(14) NOT NULL,
  endereço VARCHAR(255) NOT NULL,
  
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
);

CREATE TABLE IF NOT EXISTS produtos (
);

CREATE TABLE IF NOT EXISTS vendas (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,

    id_cliente INT UNSIGNED NOT NULL,
    id_funcionario INT UNSIGNED NOT NULL,
    id_servicos INT UNSIGNED,
    id_produtos INT UNSIGNED,

    PRIMARY KEY (id),
    FOREIGN KEY (id_cliente) REFERENCES clientes (id),
    FOREIGN KEY (id_funcionario) REFERENCES funcionarios (id),
    FOREIGN KEY (id_servicos) REFERENCES servicos (id),
    FOREIGN KEY (id_produtos) REFERENCES produtos (id)
);