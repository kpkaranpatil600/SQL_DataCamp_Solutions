WIHT discus_gold AS
(
      SELECT
          year, country AS champion
      FROM summer_medals

      WHERE
          year IN (1996, 2000, 2004, 2008, 2012)
          AND gender = 'men'
          AND medal = 'gold'
          AND event = 'discus_throw'
)

SELECT
    year, champion,
    LAG(champion,1) OVER(ORDER BY year ASC) AS last_champion
FROM discus_gold
ORDER BY year ASC;

----------------------------------------------------------------------

WITH weightlifting_gold AS
(
  SELECT
    year,
    country AS champion
  FROM summer_medals
  WHERE
    discipline = 'weightlifting'
    AND event = '69KG'
    AND gender = 'men'
    AND medal = 'gold'
)

SELECT
    year,
    champion,
    LAG(champion,1) OVER(ORDER BY year ASC) AS last_champion
FROM weightlifting_gold
