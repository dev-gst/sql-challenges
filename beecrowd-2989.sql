-- Beecrowd 2989

WITH sum_salary AS (
	SELECT
		e.matr employee_matr,
		e.nome AS employee_name,
		e.lotacao_div AS lotacao_div, 
		sum(COALESCE(v.valor , 0)) AS salary_sum
	FROM empregado AS e
	LEFT JOIN emp_venc AS ev ON ev.matr = e.matr
	LEFT JOIN vencimento AS v ON v.cod_venc = ev.cod_venc
	GROUP BY e.matr, e.nome, e.lotacao_div 
	ORDER BY e.nome
),

final_salary AS (
	SELECT
		ss.employee_matr,
		ss.employee_name,
		ss.lotacao_div, 
		ss.salary_sum,
		sum(COALESCE(des.valor , 0)) AS salary_desc
	FROM sum_salary AS ss
	LEFT JOIN emp_desc AS edes ON edes.matr = ss.employee_matr
	LEFT JOIN desconto AS des ON des.cod_desc = edes.cod_desc
	GROUP BY ss.employee_matr, ss.employee_name, ss.lotacao_div, ss.salary_sum
)

SELECT 
	dp.nome AS departamento,
	dv.nome AS divisao,
	round(avg(fs.salary_sum - fs.salary_desc), 2) AS media,
	round(max(fs.salary_sum - fs.salary_desc), 2) AS maior
FROM departamento AS dp
JOIN divisao AS dv
ON dp.cod_dep = dv.cod_dep
JOIN final_salary AS fs
ON fs.lotacao_div = dv.cod_divisao 
GROUP BY dp.nome, dv.nome
ORDER BY media DESC;
