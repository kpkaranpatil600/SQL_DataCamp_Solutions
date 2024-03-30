WITH country_medals AS (...........)

SELECT
    country, athlete, medals,
    DENSE_RANK() OVER(PARTITION BY country
                      ORDER BY medals DESC) AS dense_rank_n
FROM country_medals

ORDER BY country ASC, medals DESC;
