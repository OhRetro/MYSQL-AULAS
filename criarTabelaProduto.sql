CREATE TABLE IF NOT EXISTS produtos (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    desconto DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    PRIMARY KEY (id)
);
--CREATE TRIGGER tr_desconto BEFORE INSERT
--ON produtos
--FOR EACH ROW
--SET NEW.desconto = (NEW.preco * 0.9)

CREATE TRIGGER tr_desconto BEFORE INSERT
ON produtos
FOR EACH ROW
IF NEW.desconto IS NULL THEN
    SET NEW.desconto = (NEW.preco * 0.9);
END IF;

INSERT INTO produtos
    (nome, preco)
VALUES
    ("Televisão", 120.00),
    ("PS5", 450.00)