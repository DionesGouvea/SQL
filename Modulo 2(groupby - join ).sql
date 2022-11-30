/*Quantos produtos existem no catalago, qual e a media dos preçoscustomer
e qual é o maior e menor valor deles?*/

select count(*) as Nun_Linhas,
	count (DISTINCT product_id) as Total_produtos, /*Distinct para nao retornar produtos repetidos*/
	AVG(price) Media_valor,
	MAX(price) Maior_preco,
	MIN(price) Menor_preco
from product;

/*classifique por categorias, quantos produtos existem no catalago, qual a media dos preços 
e qual é o maior e menor valor deles?*/

select 
	category,
	count(*) as Nun_Linhas,
	count (DISTINCT product_id) as Total_produtos, /*Distinct para nao retornar produtos repetidos*/
	AVG(price) Media_valor,
	MAX(price) Maior_preco,
	MIN(price) Menor_preco
from product
group by category;

/* qual é o top 8 de subcategorias, filtrando valores maiores do que 10 
e menores do que 1000, ordene pelo valor medio de preço, e alem da subcategoria
traga tambem a categoria, o valor total dos produtos e a media de preço deles*/

select 
	sub_category, 
	category,
	sum(price) as Valor_total,
	AVG(price) as Media_valores
from product
where price BETWEEN 10 and 1000
group by sub_category
order by Media_valores DESC
limit 8

/* do top 5 produtos quantas vendas foram feitas até hoje*/
select 
	p.product_name,
	p.price,
COUNT(DISTINCT s.order_id) Quantidade_vendas
from product as P
left join sales as S on s.product_id = p.product_id 
group by product_name
ORDER by price desc
limit 5

/*Quais são as 10 cidades em que menos vendemos, desde que começamos a empresa*/

select 
	c.city as cidade,
	count(DISTINCT s.order_id) quantidade_vendas
from customer as c
left join sales as s on s.customer_id = c.customer_id
group by cidade
order by quantidade_vendas
limit 10

/* quais são os clientes que realizaram compras em abril mes da campanha de marketing */

SELECT 
	DISTINCT c.customer_name,
    s.ship_date as data_compra
from customer as C
left join campaign as cam on C.customer_id = cam.customer_id
INNER join sales as S on s.ship_date = cam.send_date

/* quais são as 10 cidades com maior valor de venda*/

select 
	c.city as cidade,    
    	sum(P.price) Valor_total
from customer as c
LEFT join sales as s on c.customer_id = s.customer_id
inner join product as P on p.product_id = s.product_id
group by cidade
order BY 2 DESC
limit 10