WITH country_medals AS
(
  SELECT
    year, country, COUNT(*) AS medals
  FROM summer_medals
  WHERE
    country IN ('JPN','KOR','CHN')
    AND medal = 'gold'
    AND year >= 2000
  GROUP BY year, country
)

SELECT
  country, year, medals,
  MAX(medals) OVER(PARTITION BY country ORDER BY year ASC) AS max_medals
FROM country_medals
ORDER BY country ASC, year ASC

---------------------------------------------------------------------------------------

WITH france_medals AS
(
  SELECT
    year, COUNT(*) AS medals
  FROM summer_medals
  WHERE
    country = 'FRA'
    AND medal = 'gold'
    and year >= 2000
  GROUP BY year
)

SELECT
  medals, year,
  MIN(medals) OVER(ORDER BY year ASC) AS min_medals
FROM france_medals
ORDER BY year ASC; 
