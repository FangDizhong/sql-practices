SELECT
  DATE(register_time) AS register_date,
  COUNT(DISTINCT 锘縰ser_id) AS Daily_Users
FROM 
  tap_fun_train
GROUP BY 
  register_date
ORDER BY
  register_date ASC
;