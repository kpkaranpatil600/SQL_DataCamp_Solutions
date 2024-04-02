WITH russia_medals AS (...)

  SELECT
    year, medals,
    MAX(medals) OVER(ORDER BY year ASC) AS max_medals,
    MAX(medals) OVER(ORDER BY year ASC
                      ROWS BETWEEN 1 PRECEDING AND CURRENT ROW) AS max_medals_last
  FROM russia_medals
  ORDER BY year ASC

--------------------------------------------------------------------------------------

---Current and following rows

WITH russia_medals AS (...)

SELECT
  year, medals,
  MAX(medals) OVER(ORDER BY year ASC) AS max_medals,
  MAX(medals) OVER(ORDER BY year ASC
                    ROW BETWEEN CURRENT ROW AND 1 FOLLOWING) AS max_medals_next
FROM russia_medals
ORDER BY year ASC

---------------------------------------------------------------------------------------------

---Moving maximum of Scandinavian athletes' medals

WITH sc_medals AS
(
  SELECT
    year, COUNT(*) AS medals
  FROM summer_medals
  WHERE
    country IN ('DEN', 'NOR')
    AND medal = 'gold'
  GROUP BY year
)

  SELECT
    year, medals,
    MAX(medals) OVER(ORDER BY year ASC
                      ROWS BETWEEN 2 preceding AND current row) AS max_medals
  FROM sc_medals
  ORDER BY athelete ASC; 
