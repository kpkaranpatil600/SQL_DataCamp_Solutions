WITH discus_medalists AS
(
  SELECT DISTINCT year, athlete
  FROM summer_medals

  WHERE medal = 'gold'
  AND gender = 'women'
  AND year >= 2000
  AND event = 'discus_throw'
)

  SELECT
    year, athlete
    LEAD(athlete,1) OVER(ORDER BY year ASC) AS future_champion
  FROM discus_medalists
  ORDER BY year ASC; 
