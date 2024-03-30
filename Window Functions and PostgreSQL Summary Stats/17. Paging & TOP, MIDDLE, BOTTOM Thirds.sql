WITH disciplines AS
(
  SELECT DISTINCT discipline
  FROM summer_medals
)

SELECT
    discipline,
    NTILE(15) OVER() AS page
FROM disciplines
ORDER BY page ASC;

-----------------------------------------------------------------

WITH  country_medals AS
(
  SELECT
      country, COUNT(*) AS medals
  FROM summer_medals
  GROUP BY country
)

SELECT
    country, medals,
    NTILE(3) OVER(ORDER BY medals DESC) AS third
FROM country_medals
