CREATE TABLE IF NOT EXISTS produtos (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    desconto DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TRIGGER tr_desconto BEFORE INSERT
ON produtos
FOR EACH ROW
SET NEW.desconto = (NEW.preco * 0.90)

INSERT INTO produtos
    (nome, preco)
VALUES
    ("Televisão", 120.00),
    ("PS5", 450.00)

SELECT * FROM `produtos`