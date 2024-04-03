
---All group-level subtotals

SELECT
  country, medal, COUNT(*) AS awards
FROM summer_medals

WHERE year = 2008

GROUP BY CUBE(country, medal)
ORDER BY country ASC, medal ASC
