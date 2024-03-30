SELECT
    year,
    ROW_NUMBER() OVER(ORDER BY year DESC) AS row_n
FROM
(
  SELECT DISTINCT year
  FROM summer_medals
) AS years

    ORDER BY year;
