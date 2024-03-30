WITH hosts AS
(
  SELECT DISTINCT year, city
  FROM summer_medals
)

  SELECT
      year, city
      FIRST_VALUE(city) OVER(ORDER BY year ASC) AS first_city,
      LAST_VALUE(city) OVER(ORDER BY year ASC
                        RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS last_city
  FROM hosts
  ORDER BY year ASC
