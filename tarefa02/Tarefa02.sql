-- Script SQL para a Tarefa 02 - Banco de Dados II 2020.2
-- 21/02/2021
-- Patric Lacouth - 20191370047

-- 1. Faça inicialmente a seguinte inserção:

-- insert into filme values(default,'Superman',2018,120,null,3);

INSERT INTO 
    filme(codfilme,titulo,ano,duracao,codcateg,codest)
VALUES
    (default,'Superman',2018,120,null,3);



-- 2. Verifique quais os títulos dos filmes que possuem duração maior que 120 min (0,5)?

SELECT * FROM filme WHERE(duracao > 120);

-- 3. Na tabela ARTISTA, quais artistas possuem cidade nula? Após a consulta, atualize as cidades nulas encontradas para três artistas (0,5).

SELECT * FROM artista WHERE(cidade IS NULL);

-- 4. Qual a descrição da categoria do filme ‘Coringa’ (1,0)?

SELECT c.desccateg AS descrição FROM

    filme f JOIN categoria c ON f.codcateg = c.codcateg

WHERE(f.titulo = 'Coringa');

-- 5. Mostre os títulos de filmes, seus estúdios e suas categorias (1,0).

SELECT f.titulo as título, e.nomeest as estúdio, c.desccateg FROM

    filme f JOIN estudio e ON e.codest = f.codest 

    LEFT JOIN categoria c ON f.codcateg = c.codcateg;


 -- 6. Qual o nome dos artistas que fizeram o filme ‘Encontro Explosivo’ (1,0)?

SELECT a.nomeart AS nome FROM

    artista a JOIN personagem p ON a.codart = p.codart

    JOIN filme f ON f.codfilme = p.codfilme

WHERE(f.titulo = 'Encontro Explosivo');

-- 7. Selecione os artistas que têm o nome iniciando com a letra ‘B’ e participaram de filmes da categoria ‘Aventura’ (1,0).

SELECT * FROM

    artista a JOIN personagem p ON a.codart = p.codart

    JOIN filme f ON p.codfilme = f.codfilme

    JOIN categoria c ON c.codcateg = f.codcateg

WHERE( (a.nomeart LIKE 'B%') AND (c.desccateg = 'Aventura') );

-- 8. Apresente quantos filmes existem por categoria. Para isso mostre a descrição da categoria e sua respectiva contagem (1,0).

SELECT c.desccateg, COUNT(*) FROM

    filme f JOIN categoria c ON c.codcateg = f.codcateg

GROUP BY c.desccateg;

-- 9. Altere a questão anterior acrescentando a cláusula “having”. Explique o que a consulta retorna no contexto que você implementou (1,0)

SELECT c.desccateg, COUNT(*) AS Total FROM

    filme f JOIN categoria c ON c.codcateg = f.codcateg

GROUP BY c.desccateg
HAVING COUNT(*) > 1;

-- A cláusula HAVING permite filtrar o resultado obtido pelo GROUP BY para obter apenas as categorias associadas com mais de um filme no banco de dados.

-- 10. O que o seguinte comando mostra (1,0)?

-- select a.nomeart, p.nomepers
-- from artista a left outer join personagem p on a.codart = p.codart;

SELECT a.nomeart, p.nomepers FROM

    artista a LEFT OUTER JOIN personagem p ON a.codart = p.codart;

-- O comando mostra o nome de todos os artitas relacionado com seus personagens, mesmo que o artista não tenha nenhum personagem associado.

-- 11. O que a seguinte consulta retorna (1,0)?

-- Select f.titulo as Filme, c.desccateg as Categoria
-- From filme f right join categoria c on f.codcateg = c.codcateg
-- Where c.codcateg is null;

SELECT f.titulo AS Filme, c.desccateg AS Categoria

    FROM filme f RIGHT JOIN categoria c ON f.codcateg = c.codcateg

WHERE c.codcateg IS NULL;

-- Empty set (0,00 sec)

-- A consulta retorna uma tabela vazia por causa do RIGHT JOIN que impede que o registro que possua categoria NULLseja apresentado, uma vez que a tabela que contém o NULL está a direita da consulta. Abaixo está o resultado da consulta com LEFT JOIN.

SELECT f.titulo AS Filme, c.desccateg AS Categoria

    FROM filme f LEFT JOIN categoria c ON f.codcateg = c.codcateg

WHERE c.codcateg IS NULL;

-- filme 	categoria
-- Superman 	NULL
-- 1 row in set (0,00 sec)

-- 12. Crie uma consulta sua ao banco Filmes. Use operadores SQL e algum tipo de JOIN. Formule o enunciado da consulta e mostre sua solução em SQL (1,0).

-- Qual o total gasto em cache por cada estúdio?

SELECT e.nomeest AS estudio, SUM(p.cache) AS cache FROM

    filme f JOIN personagem p ON f.codfilme = p.codfilme

    JOIN estudio e ON f.codest = e.codest

GROUP BY e.nomeest

ORDER BY SUM(p.cache) DESC

-- estudio 	cache
-- Paramount 	286465,
-- Warner 	172500,
-- Disney 	11500,