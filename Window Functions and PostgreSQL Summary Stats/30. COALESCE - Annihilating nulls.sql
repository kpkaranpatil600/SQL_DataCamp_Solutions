
----Annihilating nulls in ROLLUP and CUBE

SELECT
  COALESCE(country,'both countries') AS country
  COALESCE(medal, "both medals") AS medal
  COUNT(*) AS awards
FROM summer_medals

WHERE
  year = 2008 AND counrty IN ('CHN', 'RUS')

GROUP BY ROLLUP(country, medal)
ORDER BY country DESC 
