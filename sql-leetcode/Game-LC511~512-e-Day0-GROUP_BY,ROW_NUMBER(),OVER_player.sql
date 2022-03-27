first login date
WITH FirstLogin AS
(
	SELECT  player_id
	       ,device_id
	       ,MIN(event_date) AS first_login
	FROM activity
	GROUP BY  player_id
)
SELECT  player_id
       ,device_id
FROM FirstLogin
;

-- Or 
-- ROW_NUMBER() OVER(PARTITION BY  ORDER BY)
WITH ActivityWithRowNum AS
(
	SELECT  player_id
	       ,device_id
	       ,event_date
	       ,ROW_NUMBER() 
				 		OVER ( PARTITION BY player_id ORDER BY event_date ) 
						AS r
	FROM activity
)
SELECT  ar.player_id
       ,ar.device_id
FROM ActivityWithRowNum ar
WHERE ar.r = 1
;

-- Or
-- (player_id, event_date) is the PRIMARY KEY,
-- so AND clause needed

WITH FirstLogin AS
(
	SELECT  player_id
	       ,MIN(event_date) AS first_login
	FROM activity
	GROUP BY  player_id
)
SELECT  a.player_id
       ,a.device_id
FROM activity a
JOIN FirstLogin f
ON a.player_id = f.player_id AND a.event_date = f.first_login
;