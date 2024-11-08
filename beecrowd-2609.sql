-- Beecrowd 2609
-- https://www.beecrowd.com.br/judge/pt/problems/view/2609

SELECT c.name, SUM(p.amount)
FROM categories AS c
JOIN products as p
ON p.id_categories = c.id
GROUP BY c.name;
