-- Criando a tabela estado

CREATE TABLE estados (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    nome VARCHAR(45) NOT NULL,
    sigla VARCHAR(2) NOT NULL,
    regiao ENUM("Norte", "Nordeste", "Centro-Oeste", "Sudeste", "Sul") NOT NULL,
    populacao DECIMAL(5,2) NOT NULL,
    PRIMARY KEY (id),
    UNIQUE KEY (nome),
    UNIQUE KEY (sigla)
)

-- create table -> criar tabela
-- int -> numeros inteiros
-- unsigned -> sem sinal... apenas ints positivo
-- not null -> não nulo... não permitir campo vazio
-- auto_increment -> auto acrementar a cada criação de item na tabela
-- varchar -> limite de caracteres
-- enum -> apenas valores dentro da lista
-- decimal -> valores
-- primary key -> chave primaria não pode se repetir
-- unique key -> chave unica