CREATE DATABASE db_rh;

USE db_rh;
CREATE TABLE tb_colaboradores(
	id BIGINT AUTO_INCREMENT,
    nomeColaborador VARCHAR(30),
    idadeColaborador INT,
    cargoColaborador VARCHAR(30),
    salarioColaborador DECIMAL(8,2),
    emailColaborador VARCHAR(30),
    PRIMARY KEY(id)
);

SELECT * FROM tb_colaboradores;

INSERT INTO tb_colaboradores(nomeColaborador, idadeColaborador, cargoColaborador, salarioColaborador, emailColaborador) VALUES 
("Giyo", 19, "Dev Jr", 3500.00, "emaildogiyo@gmail.com"), 
("Wallace", 22, "Dev Jr", 3600.00, "emaildowallace@gmail.com"),
("Pedro", 20, "Dev Jr", 3450.00, "emaildopedro@gmail.com"),
("Banha", 1, "Pet", 500.00, "emaildabanha@gmail.com"),
("Rian", 25, "Analista", 1999.00, "emaildoanalista@gmail.com");

SELECT salarioColaborador FROM tb_colaboradores WHERE salarioColaborador > 2000.00;

SELECT salarioColaborador FROM tb_colaboradores WHERE salarioColaborador < 2000.00;

UPDATE tb_colaboradores SET salarioColaborador = 505 WHERE id = 4;


CREATE DATABASE db_ecommerce;

USE db_ecommerce;

CREATE TABLE tb_produtos(
	id BIGINT AUTO_INCREMENT,
	nome VARCHAR(30),
	preco DECIMAL(5,2),
    quantidade INT,
    cor VARCHAR(30),
    necessidadeCompra VARCHAR(30),
    PRIMARY KEY(id)
);

SELECT * FROM tb_produtos;

INSERT INTO tb_produtos(nome, preco, quantidade, cor, necessidadeCompra) 
VALUES
("Tênis", 580.00, 5, "Vermelho", "Sim"),
("Calça", 50.99, 10, "Preto", "Não"),
("Blusa", 40.00, 20, "Amarelo", "Não"),
("Bermuda", 89.99, 7, "Azul", "Sim"),
("Meia", 25.00, 18, "Branco", "Não"),
("Colar", 10.00, 8, "Prata", "Sim"),
("Luva", 5.00, 12, "Bege", "Não"),
("Pulseira", 7.15, 15, "Dourado", "Não");

SELECT preco FROM tb_produtos WHERE preco < 500;

SELECT preco FROM tb_produtos WHERE preco > 500;

UPDATE tb_produtos SET cor = "Roxo" WHERE id = 4;

CREATE DATABASE db_escola;

USE db_escola;
CREATE TABLE tb_alunos(
	id BIGINT AUTO_INCREMENT,
	nome VARCHAR(30),
    nota DECIMAL(4,2),
	idade INT,
    genero VARCHAR(30),
    sala INT,
    PRIMARY KEY(id)
);

INSERT INTO tb_alunos(nome, nota, idade, genero, sala) 
VALUES
("Wallace", 5.0, 21, "Masculino", 1),
("Carol", 10, 20, "Feminino", 2),
("Samantha",7, 22, "Feminino", 2),
("Pedro", 8, 21, "Masculino", 1),
("Letícia", 10.0, 23, "Feminino", 2),
("Jéssica", 9.0, 24, "Feminino", 1),
("Clauber", 8.0, 31, "Masculino", 1),
("Giyo", 6.0, 19, "Masculino", 2);

SELECT * FROM tb_alunos;
SELECT nota FROM tb_alunos WHERE nota > 7;
SELECT nota FROM tb_alunos WHERE nota < 7;

UPDATE tb_alunos SET nota = 8 WHERE id = 4;

