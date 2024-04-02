WITH us_medals AS (...)

SELECT
  year, medals,
  SUM(medals) OVER(ORDER BY year ASC
                    ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS medals_ma
FROM us_medals
ORDER BY year ASC;

----------------------------------------------------------------

---Moving average of Russian medals

WITH rus_medals AS
(
  SELECT
    year, COUNT(*) AS medals
  FROM summer_medals
  WHERE
    country = 'RUS'
    AND medal = 'gold'
    AND year >= 1980
  GROUP BY year
)

SELECT
  year, medals,
  AVG(medals) OVER(ORDER BY year ASC
                    ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS medals_ma
FROM rus_medals
ORDER BY year ASC;

--------------------------------------------------------------------------------

---Moving total of countries' medals

WITH country_medals AS
(
  SELECT
    year, country, COUNT(*) AS medals
  FROM summer_medals
  GROUP BY year, country
)

SELECT
  year, country, medals
  SUM(medals) OVER(PARTITION BY country
                    ORDER BY year ASC
                    ROWS BETWEEN 2 PRECEDING and CURRENT ROW) AS medals_mt
FROM country_medals
ORDER BY country ASC, year ASC 
