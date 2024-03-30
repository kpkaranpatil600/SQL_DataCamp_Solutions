WITH discus_gold AS
(
      SELECT
          year, country AS champion
      FROM summer_medals

      WHERE
          year IN (1996, 2000, 2004, 2008, 2012)
          AND gender = 'men'
          AND medal = 'gold'
          AND event In ('discus_throw','triple jump')
)

SELECT
    year, champion,
    LAG(champion,1) OVER(PARTITION BY event
                        ORDER BY event ASC, year ASC) AS last_champion

FROM discus_gold
ORDER BY year ASC;

---------------------------------------------------------------------------

WITH tennis_gold AS
(
    SELECT
        DISTINCT gender, year, country
    FROM summer_medals

    WHERE year >= 2000
    AND medal = 'gold'
    AND event = 'javelin throw'
)

  SELECT
      gender, year,
      country as champion

      LAG(country, 1) OVER(PARTITION BY gender
                            ORDER BY year ASC) AS last_champion

  FROM tennis_gold
  ORDER BY gender ASC, year ASC

------------------------------------------------------------------------------

---partition by multiple columns

WITH country_gold AS
(
      SELECT
          DISTINCT year, country, event
      FROM summer_medals

      WHERE
          year IN (2008, 2012)
          AND gender = 'women'
          AND medal = 'gold'
          AND country In ('CHN',' JPN')
)
SELECT
    year, country, event
    ROW_NUMBER() OVER(PARTITION BY year, country)
FROM country_gold;

--------------------------------------------------------------------

WITH athletics_gold AS
(
  SELECT
      DISTINCT gender, year, event, country
  FROM summer_medals

  WHERE year >= 2000
  AND discipline = 'athletics'
  AND medal = 'gold'
  AND event IN ('100M','10000M')
)

  SELECT
      gender, year, event,
      country AS champion

      LAG(country) OVER(PARTITION BY gender, event
                        ORDER BY year ASC) AS last_champion
  FROM athletics_gold
  ORDER BY event ASC, gender ASC, year ASC; 
