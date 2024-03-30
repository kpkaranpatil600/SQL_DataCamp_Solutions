WITH all_male_medalists AS
(
  SELECT DISTINCT year, athlete
  FROM summer_medals

  WHERE medal = 'gold'
  AND gender = 'Men'
)

  SELECT
      athlete,
      FIRST_VALUE(athlete) OVER(ORDER BY athlete ASC) AS first_athlete
  FROM all_male_medalists; 
