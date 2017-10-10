SELECT MAX(perday) AS int
FROM (
  SELECT COUNT(*) AS perday
  FROM savecount
  GROUP BY day
);
