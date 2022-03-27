WITH 
  Week0User AS (
    SELECT 
      锘縰ser_id,
      MIN(DATE(register_time)) AS d0,
      (MIN(DATE(register_time)) + INTERVAL 7 DAY) AS d7
    FROM
      tap_fun_train
    GROUP BY
      锘縰ser_id
  ),

  First7DaysAVG AS(
    SELECT 
      a.锘縰ser_id,
      DATE(a.register_time) AS d0,
      w0u.d7,
      (SUM(a.avg_online_minutes) * 7 / DATEDIFF(w0u.d7,w0u.d0)) AS avg_online_mins_in_7_days,
      AVG(a.avg_online_minutes) AS avg_online_mins_every_login_day,
      ROW_NUMBER()   OVER w AS row_id
    FROM
      tap_fun_train a 
    JOIN Week0User w0u
    ON
      a.锘縰ser_id = w0u.锘縰ser_id
      AND
      DATE(a.register_time) BETWEEN w0u.d0 AND w0u.d7
    GROUP BY
      a.锘縰ser_id 
    WINDOW w AS (ORDER BY 
        (SUM(a.avg_online_minutes) * 7 / DATEDIFF(w0u.d7,w0u.d0)) ASC)
  ),

  Quartile AS (
    SELECT
      COUNT(*) AS max_count,
      MAX(row_id) AS max,
      ROUND(COUNT(*) * 0.75) AS Q3_4,
      ROUND(COUNT(*) * 0.5) AS median,
      ROUND(COUNT(*) * 0.25) AS Q1_4,
      MIN(row_id) AS min
    FROM First7DaysAVG
  )

SELECT *
FROM 
  First7DaysAVG f
JOIN
  Quartile q
ON
  f.row_id = q.max
  OR
  f.row_id = q.Q3_4
  OR
  f.row_id = q.median
  OR
  f.row_id = q.Q1_4
  OR
  f.row_id = q.min
;
