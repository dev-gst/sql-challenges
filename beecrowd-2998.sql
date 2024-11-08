-- Beecrowd 2998

WITH calc_return AS (
	SELECT
		c.id,
		c.name,
		c.investment, 
		o."month",
		o.profit,
		SUM (o.profit) OVER (PARTITION BY c.id ROWS UNBOUNDED PRECEDING) - c.investment AS sum_profit,
		CASE 
			WHEN SUM (o.profit) OVER (PARTITION BY c.id ROWS UNBOUNDED PRECEDING) >= c.investment
			THEN 1
			ELSE 0
		END AS "return_condition"
	FROM clients AS c
	JOIN operations AS o
	ON c.id = o.client_id 
	ORDER BY o."month"
),

final_result AS (
	SELECT
		cr.name,
		cr."month",
		cr.investment,
		cr.sum_profit AS "return",
		ROW_NUMBER() OVER (PARTITION BY cr.id) AS month_number
	FROM calc_return AS cr
	WHERE cr."return_condition" = 1
)

SELECT 
	fr.name,
	fr.investment,
	fr."month" AS month_of_payback,
	fr."return"
FROM final_result AS fr
WHERE fr.month_number = 1
ORDER BY "return" DESC;
