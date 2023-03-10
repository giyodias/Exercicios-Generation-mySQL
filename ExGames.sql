CREATE DATABASE db_GenerationGameOnline;

USE db_GenerationGameOnline;

CREATE TABLE tbClasses(
	idClasses BIGINT AUTO_INCREMENT,
    especie VARCHAR(30),
    corIdVisual VARCHAR(30),
    PRIMARY KEY(idClasses)
);

INSERT INTO tbClasses (especie, corIdVisual) 
VALUES
	("Elfo", "Azul"),
	("Dragão", "Vermelho"),
	("Polvo", "Roxo"),
	("Cobra", "Verde"),
	("Abelha", "Amarelo");


CREATE TABLE tbPersonagens(
	idPersonagens BIGINT AUTO_INCREMENT,
    nome VARCHAR(30),
    forca INT,
    poder VARCHAR(30),
    arma VARCHAR(30),
    defesa INT,
    classe BIGINT,
    PRIMARY KEY(idPersonagens),
	-- coluna classe vai ser usada pra                  nome da tabela(id dela) -> usado dentro da fk
    FOREIGN KEY (classe) REFERENCES tbClasses(idClasses)
);
INSERT INTO tbPersonagens(nome, forca, poder, arma, defesa, classe) 
VALUES 

("Ana", 500, "Voar", "Espada", 500, 1),
("Yuri", 600, "Queimar", "Fogo", 2500, 2),
("Elvis", 700, "Segurar", "Ventosas", 1000, 3),
("Alien", 550, "Abduzir", "Raios", 800, 2),
("Titi", 690, "Morder", "Chicote", 600, 4),
("Monica", 800, "Força", "Arco e flecha", 1700, 1),
("Bruno", 900, "Envenenar", "Agulha", 1000, 5),
("Giyo", 2500, "Magia", "Machado", 2600, 2);

SELECT * FROM tbClasses;
SELECT * FROM tbPersonagens;
SELECT forca FROM tbPersonagens WHERE forca > 2000;
SELECT defesa FROM tbPersonagens WHERE defesa BETWEEN 1000 AND 2000;
SELECT nome FROM tbPersonagens WHERE nome LIKE "%c%";

SELECT * FROM tbPersonagens INNER JOIN tbClasses
ON tbPersonagens.classe = tbClasses.idClasses;

SELECT * FROM tbPersonagens INNER JOIN tbClasses
ON tbPersonagens.classe = tbClasses.idClasses WHERE especie = "Dragão";