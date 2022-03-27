WITH Day0Player AS (
  SELECT 
    MIN(event_date) AS d0,
    player_id
  FROM  
    activity
  GROUP BY
    player_id

)

SELECT
  a.event_date,
  COUNT(d0p.player_id) 
    -- OVER(
    --   PARTITION BY 
    --     d0p.d0
    -- )
FROM
  activity a 
LEFT JOIN
  Day0Player d0p 
ON
  a.event_date = d0p.d0 
  AND
  a.player_id = d0p.player_id 
  -- AND
  -- a.game_played > 1
GROUP BY
  a.event_date
ORDER BY
  a.event_date
;