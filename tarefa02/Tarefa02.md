```mysql
%LOAD postgresql dbname=Filmes
```

## Script SQL para a Tarefa 02 - Banco de Dados II 2020.2
### 21/02/2021
### Patric Lacouth - 20191370047

### 1.  Faça inicialmente a seguinte inserção:
``` SQL
insert into filme values(default,'Superman',2018,120,null,3);
```


```mysql
INSERT INTO 
    filme(codfilme,titulo,ano,duracao,codcateg,codest)
VALUES
    (default,'Superman',2018,120,null,3);
```

### 2. Verifique quais os títulos dos filmes que possuem duração maior que 120 min (0,5)?


```mysql
SELECT * FROM filme WHERE(duracao > 120);
```




<table>
<tr>
<th>codfilme</th>
<th>titulo</th>
<th>ano</th>
<th>duracao</th>
<th>codcateg</th>
<th>codest</th>
</tr>
<tr>
<td>1</td>
<td>Encontro Explosivo</td>
<td>2010</td>
<td>134</td>
<td>4</td>
<td>1</td>
</tr>
<tr>
<td>2</td>
<td>O Besouro Verde</td>
<td>2010</td>
<td>155</td>
<td>1</td>
<td>1</td>
</tr>
<tr>
<td>3</td>
<td>Comer, Rezar, Amar</td>
<td>2010</td>
<td>177</td>
<td>2</td>
<td>1</td>
</tr>
<tr>
<td>4</td>
<td>Coringa</td>
<td>2019</td>
<td>122</td>
<td>6</td>
<td>1</td>
</tr>
<tr>
<td>8</td>
<td>The Matrix</td>
<td>1999</td>
<td>130</td>
<td>4</td>
<td>5</td>
</tr>
<tr>
<td>9</td>
<td>Clube da Luta</td>
<td>1999</td>
<td>140</td>
<td>4</td>
<td>1</td>
</tr>
</table>
6 rows in set (0,00 sec)



### 3. Na tabela ARTISTA, quais artistas possuem cidade nula? Após a consulta, atualize as cidades nulas encontradas para três artistas (0,5).



```mysql
SELECT * FROM artista WHERE(cidade IS NULL);
```




<table>
<tr>
<th>codart</th>
<th>nomeart</th>
<th>cidade</th>
<th>pais</th>
<th>datanasc</th>
</tr>
<tr>
<td>1</td>
<td>Cameron Diaz</td>
<td>NULL</td>
<td>USA</td>
<td>Tue Jul 15 00:00:00 1975
</td>
</tr>
<tr>
<td>2</td>
<td>Julia Roberts</td>
<td>NULL</td>
<td>USA</td>
<td>Sat Aug 20 00:00:00 2067
</td>
</tr>
<tr>
<td>5</td>
<td>Bradley Cooper</td>
<td>NULL</td>
<td>USA</td>
<td>Mon Jun  6 00:00:00 1977
</td>
</tr>
<tr>
<td>6</td>
<td>Tom Cruise</td>
<td>NULL</td>
<td>USA</td>
<td>Wed Sep 10 00:00:00 2064
</td>
</tr>
<tr>
<td>3</td>
<td>Brad Pitt</td>
<td>NULL</td>
<td>USA</td>
<td>Thu Mar  5 00:00:00 1970
</td>
</tr>
<tr>
<td>4</td>
<td>Joaquin Phoenix</td>
<td>NULL</td>
<td>USA</td>
<td>Thu Apr  6 00:00:00 1972
</td>
</tr>
</table>
6 rows in set (0,00 sec)



### 4. Qual a descrição da categoria do filme ‘Coringa’ (1,0)?


```mysql
SELECT c.desccateg AS descrição FROM
    filme f JOIN categoria c ON f.codcateg = c.codcateg
WHERE(f.titulo = 'Coringa');
```




<table>
<tr>
<th>descrição</th>
</tr>
<tr>
<td>Drama</td>
</tr>
</table>
1 row in set (0,00 sec)



### 5. Mostre os títulos de filmes, seus estúdios e suas categorias (1,0).


```mysql
SELECT f.titulo as título, e.nomeest as estúdio, c.desccateg FROM
    filme f JOIN estudio e ON e.codest = f.codest 
    LEFT JOIN categoria c ON f.codcateg = c.codcateg;
```




<table>
<tr>
<th>título</th>
<th>estúdio</th>
<th>desccateg</th>
</tr>
<tr>
<td>Encontro Explosivo</td>
<td>Paramount</td>
<td>Ação</td>
</tr>
<tr>
<td>O Besouro Verde</td>
<td>Paramount</td>
<td>Aventura</td>
</tr>
<tr>
<td>Comer, Rezar, Amar</td>
<td>Paramount</td>
<td>Romance</td>
</tr>
<tr>
<td>Coringa</td>
<td>Paramount</td>
<td>Drama</td>
</tr>
<tr>
<td>Era uma vez em Hollywood</td>
<td>Disney</td>
<td>Ação</td>
</tr>
<tr>
<td>Nasce uma estrela</td>
<td>Paramount</td>
<td>Drama</td>
</tr>
<tr>
<td>PI</td>
<td>Paramount</td>
<td>Drama</td>
</tr>
<tr>
<td>The Matrix</td>
<td>Warner</td>
<td>Ação</td>
</tr>
<tr>
<td>Clube da Luta</td>
<td>Paramount</td>
<td>Ação</td>
</tr>
<tr>
<td>Superman</td>
<td>Universal</td>
<td>NULL</td>
</tr>
</table>
10 rows in set (0,00 sec)



### 6. Qual o nome dos artistas que fizeram o filme ‘Encontro Explosivo’ (1,0)?


```mysql
SELECT a.nomeart AS nome FROM
    artista a JOIN personagem p ON a.codart = p.codart
    JOIN filme f ON f.codfilme = p.codfilme
WHERE(f.titulo = 'Encontro Explosivo');
```




<table>
<tr>
<th>nome</th>
</tr>
<tr>
<td>Cameron Diaz</td>
</tr>
<tr>
<td>Julia Roberts</td>
</tr>
</table>
2 rows in set (0,00 sec)



### 7. Selecione os artistas que têm o nome iniciando com a letra ‘B’ e participaram de filmes da categoria ‘Aventura’ (1,0).



```mysql
SELECT * FROM
    artista a JOIN personagem p ON a.codart = p.codart
    JOIN filme f ON p.codfilme = f.codfilme
    JOIN categoria c ON c.codcateg = f.codcateg
WHERE( (a.nomeart LIKE 'B%') AND (c.desccateg = 'Aventura') );
```




</table>
Empty set (0,00 sec)



### 8. Apresente quantos filmes existem por categoria. Para isso mostre a descrição da categoria e sua respectiva contagem (1,0).


```mysql
SELECT c.desccateg, COUNT(*) FROM
    filme f JOIN categoria c ON c.codcateg = f.codcateg
GROUP BY c.desccateg;
```




<table>
<tr>
<th>desccateg</th>
<th>count</th>
</tr>
<tr>
<td>Ação</td>
<td>4</td>
</tr>
<tr>
<td>Romance</td>
<td>1</td>
</tr>
<tr>
<td>Aventura</td>
<td>1</td>
</tr>
<tr>
<td>Drama</td>
<td>3</td>
</tr>
</table>
4 rows in set (0,00 sec)



### 9. Altere a questão anterior acrescentando a cláusula “having”. Explique o que a consulta retorna no contexto que você implementou (1,0)


```mysql
SELECT c.desccateg, COUNT(*) AS Total FROM
    filme f JOIN categoria c ON c.codcateg = f.codcateg
GROUP BY c.desccateg
HAVING COUNT(*) > 1;
```




<table>
<tr>
<th>desccateg</th>
<th>total</th>
</tr>
<tr>
<td>Ação</td>
<td>4</td>
</tr>
<tr>
<td>Drama</td>
<td>3</td>
</tr>
</table>
2 rows in set (0,00 sec)



A cláusula `HAVING` permite filtrar o resultado obtido pelo `GROUP BY` para obter apenas as categorias associadas com mais de um filme no banco de dados.

### 10. O que o seguinte comando mostra (1,0)?
```SQL
select a.nomeart, p.nomepers
from artista a left outer join personagem p on a.codart = p.codart;
```


```mysql
SELECT a.nomeart, p.nomepers FROM
    artista a LEFT OUTER JOIN personagem p ON a.codart = p.codart;
```




<table>
<tr>
<th>nomeart</th>
<th>nomepers</th>
</tr>
<tr>
<td>Cameron Diaz</td>
<td>Natalie</td>
</tr>
<tr>
<td>Julia Roberts</td>
<td>Tom</td>
</tr>
<tr>
<td>Brad Pitt</td>
<td>John</td>
</tr>
<tr>
<td>Julia Roberts</td>
<td>Ana</td>
</tr>
<tr>
<td>Bradley Cooper</td>
<td>Tom</td>
</tr>
<tr>
<td>Joaquin Phoenix</td>
<td>John</td>
</tr>
<tr>
<td>Fulano de Tal</td>
<td>Neo</td>
</tr>
<tr>
<td>Rick Martinez</td>
<td>Rick</td>
</tr>
<tr>
<td>Brad Pitt</td>
<td>Tyler Durden</td>
</tr>
<tr>
<td>Alessandra Negrini</td>
<td>NULL</td>
</tr>
<tr>
<td>Fernanda Montenegro</td>
<td>NULL</td>
</tr>
<tr>
<td>Tom Cruise</td>
<td>NULL</td>
</tr>
<tr>
<td>Rodrigo Santoro</td>
<td>NULL</td>
</tr>
</table>
13 rows in set (0,00 sec)



O comando mostra o nome de todos os artitas relacionado com seus personagens, mesmo que o artista não tenha nenhum personagem associado.

### 11. O que a seguinte consulta retorna (1,0)?
```SQL
Select f.titulo as Filme, c.desccateg as Categoria
From filme f right join categoria c on f.codcateg = c.codcateg
Where c.codcateg is null;
```


```mysql
SELECT f.titulo AS Filme, c.desccateg AS Categoria
    FROM filme f RIGHT JOIN categoria c ON f.codcateg = c.codcateg
WHERE c.codcateg IS NULL;
```




</table>
Empty set (0,00 sec)



A consulta retorna uma tabela vazia por causa do `RIGHT JOIN` que impede que o registro que possua categoria `NULL`seja apresentado, uma vez que a tabela que contém o `NULL` está a direita da consulta. Abaixo está o resultado da consulta com `LEFT JOIN`.


```mysql
SELECT f.titulo AS Filme, c.desccateg AS Categoria
    FROM filme f LEFT JOIN categoria c ON f.codcateg = c.codcateg
WHERE c.codcateg IS NULL;
```




<table>
<tr>
<th>filme</th>
<th>categoria</th>
</tr>
<tr>
<td>Superman</td>
<td>NULL</td>
</tr>
</table>
1 row in set (0,00 sec)



### 12. Crie uma consulta sua ao banco Filmes. Use operadores SQL e algum tipo de JOIN. Formule o enunciado da consulta e mostre sua solução em SQL (1,0).

**Qual o total gasto em cache por cada estúdio?**


```mysql
SELECT e.nomeest AS estudio, SUM(p.cache) AS cache FROM
    filme f JOIN personagem p ON f.codfilme = p.codfilme
    JOIN estudio e ON f.codest = e.codest
GROUP BY e.nomeest
ORDER BY SUM(p.cache) DESC
```




<table>
<tr>
<th>estudio</th>
<th>cache</th>
</tr>
<tr>
<td>Paramount</td>
<td>286465,</td>
</tr>
<tr>
<td>Warner</td>
<td>172500,</td>
</tr>
<tr>
<td>Disney</td>
<td>11500,</td>
</tr>
</table>
3 rows in set (0,00 sec)


