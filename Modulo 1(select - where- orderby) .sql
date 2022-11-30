/*buscar os 5 produtos mais vendidos da empresa*/
SELECT 
	product_name,
      price 
FROM product 
ORDER by price DESC
limit 5;

/*dentro da categoria Tecnologia, quais são os 15 produtos
mais baratos com o valor acima de 10 reais ou que seja acessorio*/
select * 
from product
where lower(category) = 'technology' 
and(price > 10 or lower(sub_category) = 'accessories')
order by price 
limit 15;

/*Quais são os 10 produtos mais caros que estão fora da categoria
tecnologia e com o valor de no maximo R$1.000*/

select * 
from product
where not lower(category) = 'technology'
and price <= 1000
order by price DESC
limit 10;