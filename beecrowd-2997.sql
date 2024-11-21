-- Beecrowd 2997
-- https://www.beecrowd.com.br/judge/pt/problems/view/2997

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

salarios_liquidos AS (
	SELECT 
		v.matr,
		v.nome,
		v.lotacao_div,
		(v.salarios - d.descontos) AS salario_liquido
	FROM vencimentos AS v
	JOIN descontos AS d
	ON d.matr = v.matr
	GROUP BY v.matr, v.nome, v.lotacao_div, v.salarios, d.descontos
)

SELECT 
	dpt.nome AS "Departamento",
	e.nome AS "Empregado",
	v.salarios AS "SalarioBruto",
    d.descontos AS "Total Desconto",
    sl.salario_liquido AS "Salario Liquido"
FROM departamento AS dpt
JOIN divisao AS div ON div.cod_dep = dpt.cod_dep 
JOIN empregado AS e ON e.lotacao_div = div.cod_divisao 
JOIN vencimentos AS v ON e.matr = v.matr
JOIN descontos AS d ON e.matr = d.matr
JOIN salarios_liquidos AS sl ON e.matr = sl.matr
ORDER BY sl.salario_liquido DESC, e.nome desc;
