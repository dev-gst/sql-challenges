-- Beecrowd 2988
-- https://www.beecrowd.com.br/judge/pt/problems/view/2988

WITH scores_1 AS (
	SELECT
		t1.name,
		sum (
			CASE 
				WHEN team_1_goals > team_2_goals
				THEN 3
				WHEN team_1_goals = team_2_goals
				THEN 1
				ELSE 0
			END 
		) AS score,
		sum (
			CASE 
				WHEN team_1_goals > team_2_goals
				THEN 1
				ELSE 0
			END 
		) AS victories,
		sum (
			CASE 
				WHEN team_2_goals > team_1_goals
				THEN 1
				ELSE 0
			END 
		) AS defeats,
		sum (
			CASE 
				WHEN team_2_goals = team_1_goals
				THEN 1
				ELSE 0
			END 
		) AS draws
	FROM matches AS m
	JOIN teams AS t1
	ON t1.id = m.team_1
	GROUP BY t1.name
),

scores_2 AS (
	SELECT
		t2.name,
		sum(
			CASE 
				WHEN team_2_goals > team_1_goals
				THEN 3
				WHEN team_1_goals = team_2_goals
				THEN 1
				ELSE 0
			END
		) AS score,
		sum(
			CASE 
				WHEN team_2_goals > team_1_goals
				THEN 1
				ELSE 0
			END
		) AS victories,
		sum(
			CASE 
				WHEN team_1_goals > team_2_goals
				THEN 1
				ELSE 0
			END
		) AS defeats,
		sum(
			CASE 
				WHEN team_1_goals = team_2_goals
				THEN 1
				ELSE 0
			END
		) AS draws
	FROM matches AS m
	JOIN teams AS t2
	ON t2.id = m.team_2
	GROUP BY t2.name
),

results AS (
	SELECT
		s1.name AS "name",
		CASE
			WHEN s1.name = s2.name
			THEN (s1.victories + s2.victories)
		END AS victories,
		CASE
			WHEN s1.name = s2.name
			THEN (s1.defeats + s2.defeats)
		END AS defeats,
		CASE
			WHEN s1.name = s2.name
			THEN (s1.draws + s2.draws)
		END AS draws,
		CASE
			WHEN s1.name = s2.name
			THEN (s1.score + s2.score)
		END AS score
	FROM scores_1 AS s1
	JOIN scores_2 AS s2
	ON s1.name = s2.name
	GROUP BY s1.name, s2.name, s1.score, s2.score, s1.victories,
	s2.victories, s1.defeats, s2.defeats, s1.draws, s2.draws
)

SELECT 
	name,
	(victories + defeats + draws) AS matches,
	victories,
	defeats,
	draws,
	score
FROM results
ORDER BY score DESC, name ASC;
