---Pivoting

CREATE EXTENSION IF NOT EXISTS tablefunc;

SELECT * FROM CROSSTAB
($$ sqlquerytext $$)

AS ct
(
column_1 data_type1,
column_2 data_type2,
....,
column_n data_type_n
);

------------------------------------------------------------------

CREATE EXTENSION IG NOT EXISTS tablefunc;

SELECT * FROM CROSSTAB
($$
SELECT country, year, COUNT(*) :: INTEGER AS awards
FROM summer_medals
WHERE
  country IN ('CHN','RUS')
  AND medal = 'gold'
GROUP BY year, country
$$)

AS ct
(
country VARCHAR,  "2008" INTEGER, "2012" INTEGER
)
ORDER BY country ASC
