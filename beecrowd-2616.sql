-- Beecrowd 2616
-- https://www.beecrowd.com.br/judge/pt/problems/view/2616

SELECT c.id, c.name FROM customers as c
WHERE c.id NOT IN (SELECT id_customers FROM locations);
