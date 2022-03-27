WITH 
  Week0Player AS (
    SELECT 
      player_id,
      MIN(event_date) AS d0,
      (MIN(event_date) + INTERVAL 7 DAY) AS d7
    FROM  
      activity
    GROUP BY
      player_id
  )


SELECT
  a.player_id,
  a.event_date,
  w0p.d7,
  (SUM(a.game_played) / DATEDIFF(w0p.d7,w0p.d0)) AS AVG_in_7_Days,
  AVG(a.game_played) AS AVG_in_every_login
FROM
  activity a 
JOIN
  Week0Player w0p 
ON
  a.player_id = w0p.player_id 
  AND
  a.event_date BETWEEN w0p.d0 AND w0p.d7
  -- AND
  -- a.game_played > 1
GROUP BY
  a.player_id
ORDER BY
  a.event_date
;