WITH country_medals AS (......),

    thirds AS
    (
      SELECT
          country, medals,
          NTILE(3) OVER(ORDER BY medals DESC) AS third
      FROM country_medals
    )

SELECT
    third,
    ROUND(AVG(medals),2) AS avg_medals
FROM thirds

GROUP BY third
ORDER BY third ASC; 
