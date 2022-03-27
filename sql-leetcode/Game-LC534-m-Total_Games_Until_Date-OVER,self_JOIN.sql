-- FUNC() OVER( PARTITION BY one_part  ORDER BY ···)
SELECT  player_id
       ,event_date
       ,SUM(game_played) 
          OVER ( PARTITION BY player_id ORDER BY event_date ) 
          AS game_played_so_far
FROM activity;

-- Or

-- In self_JOIN,
-- for each row in each TABLE,
-- IF the-ON-condition is true,
-- JOINed as one row.
SELECT  a1.player_id
       ,a1.event_date
       ,SUM(a2.game_played) AS game_played_so_far
FROM activity a1
JOIN activity a2
ON a1.player_id=a2.player_id AND a1.event_date>=a2.event_date
GROUP BY  a1.player_id
         ,a1.event_date;
