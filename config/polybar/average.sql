SELECT CAST(AVG(perday) AS int)
FROM (
  SELECT COUNT(*) AS perday
  FROM savecount
  WHERE day != date('now')
  GROUP BY day
);
