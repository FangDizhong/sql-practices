WITH Day0User AS (
  SELECT 
    锘縰ser_id,
    MIN(DATE(register_time)) AS d0
  FROM 
    tap_fun_train
  GROUP BY
    锘縰ser_id
)

SELECT
  DATE(tu.register_time) AS register_date,
  COUNT(d0u.锘縰ser_id) AS Daily_New_Paying_Users
FROM 
  tap_fun_train tu
LEFT JOIN
  Day0User d0u
ON
  DATE(tu.register_time) = d0u.d0 
  AND
  tu.锘縰ser_id = d0u.锘縰ser_id 
  AND
  tu.pay_price > 0
GROUP BY 
  register_date
ORDER BY
  register_date ASC
;