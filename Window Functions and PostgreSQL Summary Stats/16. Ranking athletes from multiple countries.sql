WITH athlete_medals AS
(
  SELECT
      country, athlete, COUNT(*) AS medals
  FROM summer_medals

  WHERE
    country IN ('JPN','KOR')
    AND year >= 2000
  GROUP BY country, athlete
  HAVING COUNT(*) > 1
)


  SELECT
      country, athlete,
      DENSE_RANK() OVER(PARTITION BY country_games
                        ORDER BY medals DESC) AS rank_n
  FROM athlete_medals
  ORDER BY country ASC, rank_n ASC 
