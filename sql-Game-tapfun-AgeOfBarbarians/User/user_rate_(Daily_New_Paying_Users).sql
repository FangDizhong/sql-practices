WITH 
  Day0User AS (
    SELECT
      锘縰ser_id,
      MIN(DATE(register_time)) AS d0
    FROM
      tap_fun_train
    GROUP BY
      锘縰ser_id
  ),

  DailyNewPayingUser AS (
    SELECT 
      DATE(dnpu.register_time) AS register_date,
      COUNT(d0u.锘縰ser_id) AS DNPU
    FROM 
      tap_fun_train dnpu
    LEFT JOIN
      Day0User d0u 
    ON
      DATE(dnpu.register_time) = d0u.d0
      AND
      dnpu.锘縰ser_id = d0u.锘縰ser_id
      AND
      dnpu.pay_price > 0
    GROUP BY
      register_date
  ),

  DailyNewUser AS (
    SELECT
      DATE(dnu.register_time) AS register_date, 
      COUNT(d0u.锘縰ser_id) AS DNU
    FROM 
      tap_fun_train dnu
    LEFT JOIN
      Day0User d0u
    ON
      DATE(dnu.register_time) = d0u.d0
      AND
      dnu.锘縰ser_id = d0u.锘縰ser_id
    GROUP BY
      register_date
  )

SELECT 
  dnu.register_date,
  dnpu.DNPU,
  dnu.DNU,
  dnpu.DNPU / dnu.DNU AS DNPU_rate
FROM 
  DailyNewUser dnu 
LEFT JOIN 
  DailyNewPayingUser dnpu
ON 
  dnu.register_date = dnpu.register_date
ORDER BY
  dnu.register_date
;