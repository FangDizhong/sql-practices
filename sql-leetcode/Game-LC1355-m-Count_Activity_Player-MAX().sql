With PlayerCount AS (
SELECT event_id,COUNT(DiSTINCT player_id) AS player_count
FROM player_event
GROUP BY event_id
)

SELECT e.name AS activity
FROM PlayerCount pc
JOIN Event e
ON pc.event_id = e.id
AND pc.player_count > (SELECT MIN(player_count) FROM PlayerCount)
AND pc.player_count < (SELECT MAX(player_count) FROM PlayerCount);
