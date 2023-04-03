DROP TABLE IF EXISTS alunos
CREATE TABLE IF NOT EXISTS alunos (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,

    nome VARCHAR(255) NOT NULL,
    cpf VARCHAR(11) NOT NULL,
    rg VARCHAR(9) NOT NULL,
    ra VARCHAR(14) NOT NULL,

    PRIMARY KEY (id),
    UNIQUE KEY (cpf, rg, ra)
);

DROP TABLE IF EXISTS professores
CREATE TABLE IF NOT EXISTS professores (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,

    nome VARCHAR(255) NOT NULL,
    cpf VARCHAR(11) NOT NULL,
    rg VARCHAR(9) NOT NULL,

    PRIMARY KEY (id),
    UNIQUE KEY (cpf, rg)
);

DROP TABLE IF EXISTS materias
CREATE TABLE IF NOT EXISTS materias (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,

    nome VARCHAR(255) NOT NULL,

    PRIMARY KEY (id),
    UNIQUE KEY (nome)
);

DROP TABLE IF EXISTS notas
CREATE TABLE IF NOT EXISTS notas (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,

    id_aluno INT UNSIGNED NOT NULL,
    id_professor INT UNSIGNED NOT NULL,
    id_materia INT UNSIGNED NOT NULL,
    nota INT UNSIGNED NOT NULL CHECK (nota >= 0 AND nota <= 10),

    PRIMARY KEY (id),
    FOREIGN KEY (id_aluno) REFERENCES alunos (id),
    FOREIGN KEY (id_professor) REFERENCES professores (id),
    FOREIGN KEY (id_materia) REFERENCES materias (id)
);


INSERT INTO alunos 
    (nome, cpf, rg, ra)
VALUES
    ("Luiza Sophie Jéssica Gonçalves", "16570895508", "229916144", "201910001"),
    ("Jorge Jorge Leandro Figueiredo", "02658872402", "365734706", "202020002"),
    ("Clara Cecília Rayssa Alves", "52320352155", "202286307", "202130003")

INSERT INTO professores
    (nome, cpf, rg)
VALUES
    ("Emanuelly Pietra Isis da Mata", "86782936593", "379410163"),
    ("Martin Emanuel Renato Costa", "97745801338", "191919603"),
    ("Clarice Valentina Cláudia Costa", "44539954318", "248030255")
    
INSERT INTO materias
    (nome)
VALUES
    ("Português"), ("Matemática"), ("Inglês")

INSERT INTO notas
    (id_aluno, id_professor, id_materia, nota)
VALUES
    (2, 1, 3, 8),
    (2, 2, 2, 5),
    (2, 3, 1, 7),
    
    (1, 1, 3, 6),
    (1, 2, 2, 8),
    (1, 3, 1, 10),
    
    (3, 1, 3, 7),
    (3, 2, 2, 10),
    (3, 3, 1, 9)


SELECT
a.nome "Aluno",
SUM(n.nota) "Nota Total"
FROM notas n
INNER JOIN alunos a ON a.id = n.id_aluno
GROUP BY n.id_aluno

SELECT
a.nome "Aluno",
ROUND(AVG(n.nota), 1) "Nota Média"
FROM notas n
INNER JOIN alunos a ON a.id = n.id_aluno
GROUP BY n.id_aluno

SELECT
a.nome "Aluno",
m.nome "Matéria",
n.nota "Nota"
FROM notas n
INNER JOIN alunos a ON a.id = n.id_aluno
INNER JOIN materias m ON m.id = n.id_materia
WHERE n.nota >= 8
GROUP BY a.nome, m.nome, n.nota 
