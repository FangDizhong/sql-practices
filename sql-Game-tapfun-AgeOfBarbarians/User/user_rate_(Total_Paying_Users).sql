WITH 
  PayingUser AS (
    SELECT 
      COUNT(DISTINCT 锘縰ser_id) AS new_Paying_User
    FROM 
      tap_fun_train
    WHERE 
      pay_price > 0
  ),

  TotalUser AS (
    SELECT 
      COUNT(DISTINCT 锘縰ser_id) AS new_user_count_in_total
    FROM 
      tap_fun_train
  )

SELECT (
  (SELECT new_Paying_User FROM PayingUser) /
  (SELECT new_user_count_in_total FROM TotalUser) 
) AS Paying_User_rate;

