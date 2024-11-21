-- Beecrowd 2991
-- https://www.beecrowd.com.br/judge/pt/problems/view/2991

WITH num_empregados AS (
	SELECT 
		d.cod_dep,
		d.nome AS "Nome Departamento",
		count(e.matr) AS "Numero de Empregados"
	FROM departamento AS d
	JOIN divisao AS div ON div.cod_dep = d.cod_dep 
	JOIN empregado AS e ON div.cod_divisao = e.lotacao_div
	GROUP BY d.cod_dep, d.nome
),

vencimentos AS (
    SELECT 
        e.matr,
        e.nome,
        e.lotacao_div,
        SUM(COALESCE(v.valor, 0)) AS salarios
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
        SUM(COALESCE(d.valor, 0)) AS descontos
    FROM empregado AS e
    LEFT JOIN emp_desc AS ed ON e.matr = ed.matr 
    LEFT JOIN desconto AS d ON ed.cod_desc = d.cod_desc
    GROUP BY e.matr, e.nome, e.lotacao_div
)

SELECT
	dpt.nome AS "Nome Departamento",
	ne."Numero de Empregados",
    round(AVG(v.salarios - d.descontos), 2) AS "Media Salarial",
    Max(v.salarios - d.descontos) AS "Maior Salario",
    Min(v.salarios - d.descontos) AS "Menor Salario"
FROM vencimentos AS v
JOIN descontos AS d ON v.matr = d.matr
JOIN divisao AS div ON div.cod_divisao  = v.lotacao_div
JOIN departamento AS dpt ON dpt.cod_dep = div.cod_dep
JOIN num_empregados AS ne ON ne.cod_dep = dpt.cod_dep
GROUP BY dpt.nome, ne."Numero de Empregados"
ORDER BY "Media Salarial" DESC;
