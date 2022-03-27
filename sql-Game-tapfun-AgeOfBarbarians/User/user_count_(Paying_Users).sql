SELECT 
  COUNT(DISTINCT 锘縰ser_id) AS Paying_Users
FROM 
  tap_fun_train
WHERE 
  pay_price > 0;