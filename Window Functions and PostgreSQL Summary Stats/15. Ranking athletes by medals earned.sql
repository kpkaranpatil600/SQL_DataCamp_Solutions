WITH athlete_medals AS
(
  SELECT athlete,
        COUNT(*) AS medals
  FROM summer_medals
  GROUP BY athlete
)

SELECT
    athlete, medals
    RANK() OVER (ORDER BY medals DESC) AS rank_n
FROM athlete_medals

ORDER BY medals DESC; 
