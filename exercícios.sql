CREATE DATABASE dbgeneration_game_online;

USE dbgeneration_game_online;

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
INSERT INTO tbPersonagens(nome, forca, poder, arma, especie, corIdVisual, defesa) 
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
ON tbPersonagens.classe = tbClasses.idClasse;

SELECT * FROM tbPersonagens INNER JOIN tbClasses
ON tbPersonagens.classe = tbClasses.idClasse WHERE especie = "Dragão";




-- ex dois, e-commerce
CREATE DATABASE db_pizaria_legal;
USE db_pizaria_legal;

CREATE TABLE tb_categorias(
	id BIGINT AUTO_INCREMENT,
	produto VARCHAR(45),
    preco DECIMAL(5, 2),
    PRIMARY KEY (id)
    );

INSERT INTO tb_categorias(produto, preco) 
VALUES 
("Pizza S. S.", 25.00),
("Pizza S. R." , 30.00),
("Pizza D. S.", 30.00),
("Pizza D. R.", 35.00),
("Refrigerante", 12.00);

CREATE TABLE tb_pizzas(
	id BIGINT AUTO_INCREMENT,
    nome VARCHAR(45),
	tipo VARCHAR(45),
	borda VARCHAR(45),
    produto BIGINT,
	PRIMARY KEY(id),
    FOREIGN KEY(produto) REFERENCES tb_categorias(id)
    );

INSERT INTO tb_pizzas(nome, tipo, borda, produto) 
VALUES 
("Portuguesa", "Salgada", "Recheada", 4),
("Quatro queijos","Salgada", "Recheada", 4),
("Calabresa", "Salgada", "Recheada", 1),
("Brigadeiro", "Doce", "Simples", 3),
("Chocolate com morango", "Doce", "Simples", 1),
("Coca-cola", null, null, 5),
("Sprite", null, null, 5),
("Fanta laranja", null, null, 5);

SELECT preco FROM tb_categorias WHERE produto < 5 AND preco > 45;
SELECT preco FROM tb_categorias WHERE produto < 5 AND preco BETWEEN 50 AND 100;
SELECT nome FROM tb_pizzas WHERE produto < 5 AND nome LIKE "%M%";

SELECT * from tb_pizzas INNER JOIN tb_categorias
ON tb_pizzas.produto = tb_categorias.id;

SELECT * from tb_pizzas INNER JOIN tb_categorias
ON tb_pizzas.produto = tb_categorias.id WHERE tipo = "Salgada";

SELECT * FROM tb_pizzas;
SELECT * FROM tb_categorias;








-- Exercício 3 - Farmácia Bem-estar.
-- CRIA A DATABASE
CREATE DATABASE db_farmacia;

-- Coloca a database em uso
USE db_farmacia;

-- Cria a tabela tb_categorias e dentro dos parenteses ficarão as colunas.
CREATE TABLE tb_categorias(

	--  Cria a coluna "id", que acopla a id única de cada produto. AUTO_INCREMENT para crescer 
	--  A cada novo produto e nunca se repetir.
	id BIGINT PRIMARY KEY AUTO_INCREMENT,
    -- Indica a categoria (se é remedio, produto de beleza, etc).
    categoria VARCHAR(45),
    -- Indica a necessidade de receita.
    necessidadeReceita VARCHAR(45)
);

-- Cria tabela chamada tb_produtos e dentro dos parenteses ficarão as colunas
CREATE TABLE tb_produtos(

	--  Cria a coluna "id", que acopla a id única de cada produto. AUTO_INCREMENT para crescer 
	--  a cada novo produto e nunca se repetir.
	id BIGINT PRIMARY KEY AUTO_INCREMENT,
    -- Cria a coluna "nome", que abrigará os nomes dos produtos.
    nome VARCHAR(45),
    -- Cria a coluna "preco", que abrigará os preços dos produtos.
	preco DECIMAL(6,2),
    -- Cria a coluna "tipo", que abrigará a foreign key de id da tabela categorias.
    tipo BIGINT,
     -- Cria a coluna "fabricante", que abrigará o fabricante dos produtos.
    fabricante VARCHAR(45),
    FOREIGN KEY fk_categorias_produtos (tipo) REFERENCES tb_categorias (id)
);

-- Insere dados (linhas) na tabela tb_categorias (que possui as colunas categoria, necessidadeReceita).
INSERT INTO tb_categorias (categoria, necessidadeReceita)
-- Insere dados que se encaixem nas colunas categoria e necessidade receita.
VALUES ("Medicamento", "Sim"),
       ("Medicamento", "Não"),
       ("Produtos de beleza", "Não"),
       ("Profutos infantis", "Não"),
       ("Doces", "Não");
       
-- Insere dados (linhas) na tabela tb_produtos (que possui as colunas nome, preco, tipoe fabricante).
   -- A coluna tipo vai conter a id de uma categoria de produto, que trará ainda mais informações sobre
   -- os produtos abaixo.
INSERT INTO tb_produtos (nome, preco, tipo, fabricante)
VALUES ("Amoxicilina", 25.87, 1, "Teuto"),
       ("Dramin", 15.99, 2, "Medley"),
       ("Pregabalina", 40.80, 1, "Medley"),
       ("Batom", 12.90, 3, "Vult"),
       ("Base", 25, 3, "Vult"),
       ("Dipirona", 10.45, 2, "Teuto"),
       ("Kitkat", 4, 5, "Nestlé"),
       ("Fraldas", 50.99, 4, "Huggies");

-- Exibe todos os dados de tb_produtos
SELECT * FROM tb_produtos;
-- Exibe todos os dados de tb_categorias
SELECT * FROM tb_categorias;

-- Exibe as colunas "nome" e "preco" presentes na tb_ produto onde o preõ seja maior que 50.
SELECT nome, preco FROM tb_produtos WHERE preco > 50;
-- Exibe as colunas "nome" e "preco" presentes na tb_produtos onde o preço seja entre 5 e 60.
SELECT nome, preco FROM tb_produtos WHERE preco BETWEEN 5 AND 60;
-- Exibe a coluna "nome" pertencente a tb_produtos onde o nome contenha a letra "C" em qualquer posição.
SELECT nome FROM tb_produtos WHERE nome LIKE "%c%";



-- Exibe todos os itens da tb_produtos em junção a tb_categorias
-- (A ordem antes e depois do INNER JOIN vai determinar a ordem de exibição)
SELECT * FROM tb_produtos INNER JOIN tb_categorias
-- ONDE a coluna "tipo" da tb_produtos vai ser igual a coluna "id" da tb_categorias,
-- ou seja, os itens da tb_categorias serão organizados de acordo com os itens da tb_categorias
-- para que os itens apareçam de acordo com a regra tipo = id.
ON tb_produtos.tipo = tb_categorias.id;

SELECT * FROM tb_produtos INNER JOIN tb_categorias
ON tb_produtos.tipo = tb_categorias.id WHERE tipo = 3;




-- Exercício 4 - Hortifruti
CREATE DATABASE db_cidade_dos_vegetais;
USE db_cidade_dos_vegetais;

CREATE TABLE tb_categorias(
	id BIGINT PRIMARY KEY AUTO_INCREMENT,
	tipo VARCHAR(35),
    epoca VARCHAR(35)
    );

CREATE TABLE tb_produtos(
	id BIGINT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(35),
    preco DECIMAL(6,2),
    quantidade BIGINT,
    categoria BIGINT,
    FOREIGN KEY (categoria) REFERENCES tb_categorias(id)
	);

INSERT INTO tb_categorias (tipo, epoca)
VALUES ("Legume", "Verão"),
       ("Legume", "Outono"),
       ("Legume", "Inverno"),
       ("Legume", "Primavera"),
       ("Legume", "Ano todo"),
       ("Fruta", "Verão"),
       ("Fruta", "Outono"),
       ("Fruta", "Inverno"),
       ("Fruta", "Primavera"),
	   ("Fruta", "Ano todo");

SELECT * FROM tb_categorias;
INSERT INTO tb_produtos(nome, preco, quantidade, categoria)
VALUES ("Abacaxi", 8.99, 1, 6),
       ("Berinjela", 6.99, 5, 3),
       ("Coentro", 1.99, 2, 5),
       ("Abóbora japonesa", 4.87, 1, 2),
       ("Uva", 8.99, 3, 8),
       ("Abobrinha", 5.50, 2, 5),
       ("Pepino japonês", 4.99,  5, 3),
       ("Cebola", 6.77, 3, 5);

SELECT nome,preco FROM tb_produtos WHERE preco > 50;
SELECT nome, preco FROM tb_produtos WHERE preco BETWEEN 50 AND 150;
SELECT nome FROM tb_produtos WHERE nome LIKE "%C%";

SELECT * FROM tb_produtos INNER JOIN tb_categorias
ON tb_produtos.categoria = tb_categorias.id;

SELECT * FROM tb_produtos INNER JOIN tb_categorias
ON tb_produtos.categoria = tb_categorias.id WHERE categoria BETWEEN 6 AND 10;





