CREATE EXTENSION IF NOT EXISTS tablefunc;

SELECT * FROM CROSSTAB
($$
  WITH country_awards AS (...)

  SELECT
    country, year,
    RANK() OVER(PARTITION BY year ORDER BY awards DESC) :: INTEGER AS rank_n
  FROM country_awards
$$)
AS ct
(
  country VARCHAR
  "2004" INTEGER
  "2008" INTEGER
  "2012" INTEGER
)
ORDER BY country ASC; 
