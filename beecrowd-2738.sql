-- Beecrowd 2738
-- https://www.beecrowd.com.br/judge/pt/problems/view/2738

SELECT c.name AS name,
ROUND(((s.math * 2) + (s.specific * 3) + (s.project_plan * 5)) / 10.0, 2) AS avg
FROM candidate AS c
JOIN score AS s
ON c.id = s.candidate_id
ORDER BY avg DESC;
