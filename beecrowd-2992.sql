-- Beecrowd 2992
-- https://www.beecrowd.com.br/judge/pt/problems/view/2992

WITH vencimentos AS (
	SELECT 
		e.matr,
		e.nome,
		e.lotacao_div,
		sum(COALESCE (v.valor, 0)) AS salarios
	FROM empregado AS e
	LEFT JOIN emp_venc AS ev ON e.matr = ev.matr
	LEFT JOIN vencimento AS v ON v.cod_venc = ev.cod_venc
	GROUP BY e.matr, e.nome, e.lotacao_div
),

descontos AS (
	SELECT 
		e.matr,
		e.nome,
		e.lotacao_div,
		sum(COALESCE (d.valor, 0)) AS descontos
	FROM empregado AS e
	LEFT JOIN emp_desc AS ed ON e.matr = ed.matr 
	LEFT JOIN desconto AS d ON ed.cod_desc = d.cod_desc
	GROUP BY e.matr, e.nome, e.lotacao_div
),

resultado_media AS (
	SELECT
		dept.nome AS departamento,
		divs.nome AS divisao,
		round(avg(v.salarios - d.descontos),2) AS media_salario
	FROM departamento AS dept
	JOIN divisao AS divs ON dept.cod_dep = divs.cod_dep
	JOIN vencimentos AS v ON v.lotacao_div = divs.cod_divisao
	JOIN descontos AS d ON d.lotacao_div = divs.cod_divisao 
	GROUP BY dept.nome, divs.nome
),

max_resultado AS (
	SELECT
		departamento,
		max(media_salario) AS media_salario
	FROM resultado_media
	GROUP BY departamento
),

max_media_salario AS (
	SELECT
		mr.departamento,
		CASE 
			WHEN r.media_salario = mr.media_salario
			THEN r.divisao
			ELSE null
		END AS divisao,
		mr.media_salario	
	FROM resultado_media AS r
	JOIN max_resultado AS mr ON mr.departamento = r.departamento
)

SELECT * FROM max_media_salario AS mms
WHERE mms.divisao IS NOT NULL;
