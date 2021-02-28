-- ## Script SQL para a Tarefa 03 - Banco de Dados II 2020.2
-- ### 28/02/2021
-- ### Patric Lacouth - 20191370047

-- ## Nas questões 1.1 a 1.5, crie e execute o que se pede. Use subconsultas/subqueries para essas questões (3,5).  
-- ## 1.1.   O que a seguinte consulta apresenta (0,5)?

-- ```SQL
-- select f.titulo
-- from filme f
-- where f.codest in (select e.codest
--                    from estúdio e
--                    where nomeest like 'P%');


-- **R.: A consulta apresenta os filmes de estúdios que começam com a letra P**

-- ## 1.2. Mostre as descrições de categorias que estão na tabela Filme (associadas a filmes) (0,5).

