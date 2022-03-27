WITH 
  DailyPayingUser AS (
    SELECT 
      DATE(register_time) AS register_date,
      COUNT(DISTINCT 锘縰ser_id) AS DPU
    FROM 
      tap_fun_train
    WHERE 
      pay_price > 0
    GROUP BY
      register_date
  ),

  DailyUser AS (
    SELECT
      DATE(register_time) AS register_date, 
      COUNT(DISTINCT 锘縰ser_id) AS DU
    FROM 
      tap_fun_train
    GROUP BY
      register_date
  )

SELECT 
  du.register_date,
  dpu.DPU,
  du.DU,
  dpu.DPU / dU.DU AS DPU_rate
FROM 
  DailyUser du 
LEFT JOIN 
  DailyPayingUser dpu
ON 
  du.register_date = dpu.register_date
ORDER BY 
  du.register_date
;

