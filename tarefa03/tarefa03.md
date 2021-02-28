```mysql
%LOAD postgresql dbname=Filmes
```

## Script SQL para a Tarefa 03 - Banco de Dados II 2020.2
### 28/02/2021
### Patric Lacouth - 20191370047

## Nas questões 1.1 a 1.5, crie e execute o que se pede. Use subconsultas/subqueries para essas questões (3,5).  
## 1.1.   O que a seguinte consulta apresenta (0,5)?
```SQL
select f.titulo
from filme f
where f.codest in (select e.codest
                   from estúdio e
                   where nomeest like 'P%');
```

**R.: A consulta apresenta os filmes de estúdios que começam com a letra P**


```mysql
select f.titulo
from filme f
where f.codest in (select e.codest
                   from estudio e
                   where nomeest like 'P%');
```




<table>
<tr>
<th>titulo</th>
</tr>
<tr>
<td>Encontro Explosivo</td>
</tr>
<tr>
<td>O Besouro Verde</td>
</tr>
<tr>
<td>Comer, Rezar, Amar</td>
</tr>
<tr>
<td>Coringa</td>
</tr>
<tr>
<td>Nasce uma estrela</td>
</tr>
<tr>
<td>PI</td>
</tr>
<tr>
<td>Clube da Luta</td>
</tr>
</table>
7 rows in set (0,00 sec)



## 1.2. Mostre as descrições de categorias que estão na tabela Filme (associadas a filmes) (0,5).


```mysql
SELECT c.desccateg 
FROM categoria c
WHERE c.codcateg IN (SELECT f.codcateg FROM filme f);
```




<table>
<tr>
<th>desccateg</th>
</tr>
<tr>
<td>Aventura</td>
</tr>
<tr>
<td>Romance</td>
</tr>
<tr>
<td>Ação</td>
</tr>
<tr>
<td>Drama</td>
</tr>
</table>
4 rows in set (0,00 sec)



## 1.3. Qual o nome do artista cujo nome de personagem é ‘Natalie’ (1,0)?


```mysql
SELECT a.nomeart 
FROM artista a
WHERE a.codart IN (SELECT p.codart 
                   FROM personagem p
                   WHERE p.nomepers ='Natalie');
```




<table>
<tr>
<th>nomeart</th>
</tr>
<tr>
<td>Cameron Diaz</td>
</tr>
</table>
1 row in set (0,00 sec)



## 1.4 Existe algum artista cadastrado que não esteja na tabela Personagem (1,0)?


```mysql
SELECT a.codart,a.nomeart 
FROM artista a
WHERE a.codart NOT IN (SELECT p.codart FROM personagem p);
```




<table>
<tr>
<th>codart</th>
<th>nomeart</th>
</tr>
<tr>
<td>6</td>
<td>Tom Cruise</td>
</tr>
<tr>
<td>7</td>
<td>Rodrigo Santoro</td>
</tr>
<tr>
<td>11</td>
<td>Alessandra Negrini</td>
</tr>
<tr>
<td>12</td>
<td>Fernanda Montenegro</td>
</tr>
</table>
4 rows in set (0,00 sec)



## 1.5. Reescreva a consulta da questão 1.1 usando o operador exists (0,5).


```mysql
SELECT f.titulo
FROM filme f
WHERE EXISTS (SELECT *
                   FROM estudio e
                   WHERE e.nomeest LIKE 'P%' AND f.codest = e.codest);
```




<table>
<tr>
<th>titulo</th>
</tr>
<tr>
<td>Encontro Explosivo</td>
</tr>
<tr>
<td>O Besouro Verde</td>
</tr>
<tr>
<td>Comer, Rezar, Amar</td>
</tr>
<tr>
<td>Coringa</td>
</tr>
<tr>
<td>Nasce uma estrela</td>
</tr>
<tr>
<td>PI</td>
</tr>
<tr>
<td>Clube da Luta</td>
</tr>
</table>
7 rows in set (0,00 sec)



## 2. Crie uma tabela filmeEst (use create table as) que mostre os filmes (títulos) e seus estúdios (nomes) associados. Use um JOIN para isso. Consulte a tabela criada e mostre seus dados (1,0).


```mysql
CREATE TABLE filmeEst AS
    SELECT f.titulo AS titulo, e.nomeest AS estudio
    FROM filme f JOIN estudio e ON f.codest = e.codest;
```


```mysql
SELECT * FROM filmeEst;
```




<table>
<tr>
<th>titulo</th>
<th>estudio</th>
</tr>
<tr>
<td>Encontro Explosivo</td>
<td>Paramount</td>
</tr>
<tr>
<td>O Besouro Verde</td>
<td>Paramount</td>
</tr>
<tr>
<td>Comer, Rezar, Amar</td>
<td>Paramount</td>
</tr>
<tr>
<td>Coringa</td>
<td>Paramount</td>
</tr>
<tr>
<td>Era uma vez em Hollywood</td>
<td>Disney</td>
</tr>
<tr>
<td>Nasce uma estrela</td>
<td>Paramount</td>
</tr>
<tr>
<td>PI</td>
<td>Paramount</td>
</tr>
<tr>
<td>The Matrix</td>
<td>Warner</td>
</tr>
<tr>
<td>Clube da Luta</td>
<td>Paramount</td>
</tr>
<tr>
<td>Superman</td>
<td>Universal</td>
</tr>
</table>
10 rows in set (0,00 sec)



## 3. Verifique o seguinte comando (1,5):

```SQL
select a.nomeart
from artista a 
where a.codart in (select p.codart
                  from personagem p
                  where p.codfilme in (select f.codfilme
                                     from filme f
                                     where f.duracao > 120));
```

**O que o comando retorna?**

R.: O comando retorna o nome dos artista que têm personagem em filmes com mais de 120 minutos de duração.


```mysql
select a.nomeart
from artista a 
where a.codart in (select p.codart
                  from personagem p
                  where p.codfilme in (select f.codfilme
                                     from filme f
                                     where f.duracao > 120));
```




<table>
<tr>
<th>nomeart</th>
</tr>
<tr>
<td>Cameron Diaz</td>
</tr>
<tr>
<td>Julia Roberts</td>
</tr>
<tr>
<td>Fulano de Tal</td>
</tr>
<tr>
<td>Brad Pitt</td>
</tr>
<tr>
<td>Joaquin Phoenix</td>
</tr>
</table>
5 rows in set (0,00 sec)



## 3.1 Reescreva-o usando JOIN.


```mysql
SELECT a.nomeart
FROM artista a JOIN personagem p ON a.codart = p.codart JOIN filme f ON f.codfilme = p.codfilme
WHERE f.duracao > 120;

```




<table>
<tr>
<th>nomeart</th>
</tr>
<tr>
<td>Cameron Diaz</td>
</tr>
<tr>
<td>Julia Roberts</td>
</tr>
<tr>
<td>Julia Roberts</td>
</tr>
<tr>
<td>Joaquin Phoenix</td>
</tr>
<tr>
<td>Fulano de Tal</td>
</tr>
<tr>
<td>Brad Pitt</td>
</tr>
</table>
6 rows in set (0,00 sec)



## 3.2 Os resultados das consultas com subconsulta e com JOIN são semelhantes? Explique.

R.: Os resultados são semelhantes mas não idênticos. Na consulta com JOIN o filtro do WHERE é aplicado para todas as linhas, no caso da consulta com IN o operador retorna TRUE apenas uma vez mesmo que na subconsulta apareçam dois resultados TRUE, por isso na consulta com JOIN artistas que aparecem em mais de um filme com mais de 120 minutos são contabilizados mais de uma vez.

## 4. Verifique o comando seguinte (1,5):

```SQL
select a.codart
from artista a
where pais = ‘USA’
   INTERSECT
select p.codart
from personagem p;
```


```mysql
select a.codart
from artista a
where pais = 'USA'
   INTERSECT
select p.codart
from personagem p;

```




<table>
<tr>
<th>codart</th>
</tr>
<tr>
<td>1</td>
</tr>
<tr>
<td>3</td>
</tr>
<tr>
<td>5</td>
</tr>
<tr>
<td>4</td>
</tr>
<tr>
<td>2</td>
</tr>
</table>
5 rows in set (0,01 sec)



## 4.1 O que o comando retorna?

R.: O camando retorna os artista que tem o país igual a 'USA' e também aparecem na tabela de personagens.

## 4.2 Refaça-o usando uma subquery.


```mysql
SELECT a.codart FROM artista a
WHERE a.pais = 'USA' AND a.codart IN (SELECT p.codart FROM personagem p);
```




<table>
<tr>
<th>codart</th>
</tr>
<tr>
<td>1</td>
</tr>
<tr>
<td>2</td>
</tr>
<tr>
<td>5</td>
</tr>
<tr>
<td>3</td>
</tr>
<tr>
<td>4</td>
</tr>
</table>
5 rows in set (0,00 sec)



## 4.3 Depois, refaça-o usando JOIN.


```mysql
SELECT a.codart
FROM artista a JOIN personagem p ON a.codart = p.codart
WHERE a.pais = 'USA';
```




<table>
<tr>
<th>codart</th>
</tr>
<tr>
<td>1</td>
</tr>
<tr>
<td>2</td>
</tr>
<tr>
<td>3</td>
</tr>
<tr>
<td>2</td>
</tr>
<tr>
<td>5</td>
</tr>
<tr>
<td>4</td>
</tr>
<tr>
<td>3</td>
</tr>
</table>
7 rows in set (0,00 sec)



## 4.4 Compare os resultados e explique-os.

R.: O operador IN impede que valores repetidos sejam mostrados no resultado da consulta.

## 5. Verifique agora o seguinte comando (1,5):
```SQL
select a.codart
from artista a
  EXCEPT
select p.codart
from personagem p;
```


```mysql
select a.codart
from artista a
  EXCEPT
select p.codart
from personagem p;
```




<table>
<tr>
<th>codart</th>
</tr>
<tr>
<td>6</td>
</tr>
<tr>
<td>7</td>
</tr>
<tr>
<td>11</td>
</tr>
<tr>
<td>12</td>
</tr>
</table>
4 rows in set (0,00 sec)



## 5.1 O que o comando retorna?

R.: O comando retorna os artista quem não possuem nenhum personagem associados na tabela de personagens.

## 5.2 Refaça-o usando uma subquery.


```mysql
SELECT a.codart FROM artista a
WHERE a.codart NOT IN (SELECT p.codart FROM personagem p);
```




<table>
<tr>
<th>codart</th>
</tr>
<tr>
<td>6</td>
</tr>
<tr>
<td>7</td>
</tr>
<tr>
<td>11</td>
</tr>
<tr>
<td>12</td>
</tr>
</table>
4 rows in set (0,00 sec)



## 5.3 Depois, refaça-o usando JOIN (Utilize o left ou right join). 


```mysql
SELECT a.codart
FROM artista a LEFT JOIN personagem p ON a.codart = p.codart
WHERE p.codart IS NULL;
```




<table>
<tr>
<th>codart</th>
</tr>
<tr>
<td>6</td>
</tr>
<tr>
<td>7</td>
</tr>
<tr>
<td>11</td>
</tr>
<tr>
<td>12</td>
</tr>
</table>
4 rows in set (0,00 sec)



## 6. Verifique agora o seguinte comando (1,0):

```SQL
select a.nomeart
from artista a join personagem p on a.codart = p.codart
where p.cache = (select max(p.cache) from personagem p);
```


```mysql
select a.nomeart
from artista a join personagem p on a.codart = p.codart
where p.cache = (select max(p.cache) from personagem p);
```




<table>
<tr>
<th>nomeart</th>
</tr>
<tr>
<td>Brad Pitt</td>
</tr>
</table>
1 row in set (0,01 sec)



## 6.1 O que o comando retorna?

R.: Retorna o artista com a maior cache.

## 6.2 É possível executá-lo sem a subconsulta? Por quê?

R.: Sim, utilizando JOIN, ORDER BY e LIMIT.


```mysql
SELECT a.nomeart
FROM artista a JOIN personagem p ON a.codart = p.codart
ORDER BY p.cache DESC
LIMIT 1;
```




<table>
<tr>
<th>nomeart</th>
</tr>
<tr>
<td>Brad Pitt</td>
</tr>
</table>
1 row in set (0,00 sec)


