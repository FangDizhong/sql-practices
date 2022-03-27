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
SELECT  d0.install_dt
    ,COUNT(d0.player_id) AS installs
    ,ROUND(COUNT(d1.player_id)/COUNT(d0.player_id),2) AS Day1_retention
FROM Day0Activity d0
LEFT JOIN activity d1
ON d0.player_id = d1.player_id AND d0.install_dt + 1 = d1.event_date
GROUP BY  d0.install_dt;
