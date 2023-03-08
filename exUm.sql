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