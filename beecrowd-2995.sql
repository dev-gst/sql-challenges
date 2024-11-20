-- Beecrowd 2995
-- https://www.beecrowd.com.br/judge/pt/problems/view/2995

WITH ranking AS(
	SELECT
		temperature,
		mark,
		count(temperature) OVER(PARTITION BY mark) AS number_of_records
	FROM records
)

SELECT 
	temperature,
	number_of_records
FROM ranking
GROUP BY temperature, mark, number_of_records
ORDER BY mark;
