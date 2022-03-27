WITH 
Day0Activity AS
(
    SELECT  player_id
           ,MIN(event_date) AS install_dt
    FROM activity
    GROUP BY  player_id
)

-- ROUND(0.3333, 2) -->0.33
-- COUNT(DISTINCT [a,b,null]) --> 2 
-- diff type except NULL
SELECT  
       ROUND(COUNT(DISTINCT d1.player_id)/COUNT(DISTINCT d0.player_id),2) 
       AS fraction
FROM Day0Activity d0
LEFT JOIN activity d1
ON d0.player_id = d1.player_id AND d0.install_dt + 1 = d1.event_date;