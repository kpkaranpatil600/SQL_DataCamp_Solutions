WITH hosts AS
(
  SELECT DISTINCT year, city
  FROM summer_medals
)

  SELECT
      year, city
      LEAD(city,1) OVER(ORDER BY year ASC) AS next_city
      LEAD(city,2) OVER(ORDER BY year ASC) AS after_next_city
  FROM hosts

  ORDER BY year ASC;
