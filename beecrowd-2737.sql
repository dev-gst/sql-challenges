-- Beecrowd 2737
-- https://www.beecrowd.com.br/judge/pt/problems/view/2737

SELECT 
	name,
	customers_number 
FROM lawyers
WHERE customers_number = (SELECT max(customers_number) FROM lawyers)

UNION ALL

SELECT 
	name,
	customers_number 
FROM lawyers
WHERE customers_number = (SELECT round(min(customers_number)) FROM lawyers)

UNION ALL

SELECT 
	'Average' AS name,
	round(avg(customers_number)) AS customers_number 
FROM lawyers;
