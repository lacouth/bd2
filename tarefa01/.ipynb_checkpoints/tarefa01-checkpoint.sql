-- Script para a Tarefa 01 - Banco de Dados II 2020.2
-- 12/02/2021
-- Patric Lacouth

-- 1. Crie o BD chamado “Filmes” no Postgres.

-- CREATE DATABASE Filmes

--2.  Crie as tabelas referentes ao modelo lógico (Figura 2) com suas
--    estruturas compostas dos atributos e constraints indicados. 
--    Use o tipo serial quando o atributo chave primária for 
--    único e inteiro (codArt, codFilme, codEst,CodCATEG). 
--    Salve seu script de criação de tabelas e constraints.

CREATE TABLE IF NOT EXISTS Artista (
	codArt SERIAL NOT NULL,
	nomeArt VARCHAR(25),
	cidade VARCHAR(20),
	pais VARCHAR(20),
	dataNasc DATE,
	CONSTRAINT pk_artista PRIMARY KEY(codArt)
);

CREATE TABLE IF NOT EXISTS Estudio (
	codEst SERIAL NOT NULL,
	nomeEst VARCHAR(25),
	CONSTRAINT pk_estudio PRIMARY KEY(codEst)
);
	
CREATE TABLE IF NOT EXISTS Categoria (
	codCateg SERIAL NOT NULL,
	descCateg VARCHAR(25),
	CONSTRAINT pk_categoria PRIMARY KEY(codCateg)
);

CREATE TABLE IF NOT EXISTS Filme(
	codFilme SERIAL NOT NULL,
	titulo VARCHAR(25),
	ano INTEGER,
	duracao INTEGER,
	codCateg INTEGER,
	codEst INTEGER,
	CONSTRAINT pk_codFilme PRIMARY KEY(codFilme),
	CONSTRAINT fk_codEst FOREIGN KEY(codEst) REFERENCES Estudio,
	CONSTRAINT fk_codCateg FOREIGN KEY(codCateg) REFERENCES Categoria
);

CREATE TABLE IF NOT EXISTS Personagem(
	codFilme INTEGER,
	codArt INTEGER,
	nomePers VARCHAR(25),
	cache NUMERIC(15,2),
	CONSTRAINT fk_codFilme FOREIGN KEY(codFilme) REFERENCES Filme,
	CONSTRAINT fk_codArt FOREIGN KEY(codArt) REFERENCES Artista,
	CONSTRAINT pk_personagem PRIMARY KEY (codFilme,codArt)
);

-- 3.    Verifique a estrutura das tabelas após sua criação: ARTISTA, FILME, CATEGORIA, ESTUDIO e PERSONAGEM. 
--		 Estão compatíveis com os modelos?

SELECT 
   table_name, 
   column_name, 
   data_type 
FROM 
   information_schema.columns
WHERE 
   table_name = 'artista';

SELECT 
   table_name, 
   column_name, 
   data_type 
FROM 
   information_schema.columns
WHERE 
   table_name = 'filme';
   
SELECT 
   table_name, 
   column_name, 
   data_type 
FROM 
   information_schema.columns
WHERE 
   table_name = 'categoria';
   
SELECT 
   table_name, 
   column_name, 
   data_type 
FROM 
   information_schema.columns
WHERE 
   table_name = 'estudio';
   
SELECT 
   table_name, 
   column_name, 
   data_type 
FROM 
   information_schema.columns
WHERE 
   table_name = 'personagem';

-- 4.      Faça um select geral para verificar o conteúdo de cada uma.

SELECT * FROM filme;
SELECT * FROM artista;
SELECT * FROM categoria;
SELECT * FROM estudio;
SELECT * FROM personagem;

-- 5.      Rode os scripts de inserção dos dados de cada tabela, conforme scripts passados.


-- 6.      Em seguida, insira mais três registros em cada tabela de sua autoria.

INSERT INTO 
	categoria(codCateg,descCateg)
VALUES
	(default,'Terror'),
	(default,'Documentário'),
	(default,'Infantil');
	
INSERT INTO 
	estudio(codEst,nomeEst)
VALUES
	(default,'Paris Filmes'),
	(default,'Warner'),
	(default,'Globo');
	
INSERT INTO
	artista(codArt,nomeArt,cidade,pais,dataNasc)
VALUES
	(default,'Fulano de Tal','João Pessoa','Brasil','01/01/1970'),
	(default,'Rick Martinez','Anywhere','USA','08/08/1888'),
	(default,'Christopher Plummer','Weston','USA','13/12/1929');


INSERT INTO
	filme(codFilme,titulo,duracao,ano,codEst,codCateg)
VALUES
	(default,'PI',120,1998,1,6),
	(default,'The Matrix',130,1999,5,4),
	(default,'Clube da Luta',140,1999,1,4);
	
INSERT INTO
	personagem(nomePers,cache,codFilme,codArt)
VALUES
	('Neo',150000,8,8),
	('Rick',100,7,9),
	('Tyler Durden',200000,9,3);
	
-- 7. Verifique quais são os artistas cadastrados ordenados pelo nome. 

SELECT codArt,nomeArt FROM artista ORDER BY nomeArt;

-- Os artistas estão inseridos em ordem alfabética? Por quê?
	-- Não, é possível verificar a ordem de inserção pelo codArt de cada artista.
	
-- 8.      Selecione os artistas que têm o nome iniciando com a letra ‘B’.

SELECT * FROM artista WHERE nomeArt LIKE 'B%';

-- 9.      Verifique os filmes que foram lançados em 2019.

SELECT * FROM filme WHERE ano=2019; 

-- 10.  Atualize o cachê dos artistas em 15%.

UPDATE 
	personagem 
SET 
	cache = cache*1.15;

-- 11.  Atualize o país de 3 artistas.

UPDATE 
	artista
SET	
	pais = 'USA'
WHERE 
	pais IS NULL;
	
UPDATE 
	artista
SET	
	pais = 'World'
WHERE 
	nomeart = 'Rick Martinez';
	
-- 12.  Insira 2 artistas brasileiros.

INSERT INTO
	artista(codArt,nomeArt,cidade,pais,dataNasc)
VALUES
	(default,'Alessandra Negrini','Rio de Janeiro','Brasil','01/01/1970'),
	(default,'Fernanda Montenegro','São Paulo','Brasil','01/01/1925');

-- 13.  Delete 1 artista recentemente incluído que não seja brasileiro.

DELETE FROM artista 
  WHERE codart IN (
      SELECT codart
      FROM artista
	  WHERE pais <> 'Brasil'
      ORDER BY codart DESC
      LIMIT 1);