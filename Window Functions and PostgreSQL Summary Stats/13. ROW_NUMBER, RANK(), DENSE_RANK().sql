WITH country_games AS(..........)


SELECT
    country, games,
    ROW_NUMBER() OVER(ORDER BY games DESC) AS row_n
    RANK() OVER(ORDER BY games DESC) AS rank_n
    DENSE_RANK() OVER(ORDER BY games DESC) AS dense_rank_n
FROM country_games
ORDER BY games DESC, country ASC;


----------------------------------------------------------------------

---ranking without partitioning

WITH country_medals AS (...........)

SELECT
    country, athlete, medals,
    DENSE_RANK() OVER(ORDER BY medals DESC) AS dense_rank_n
FROM country_medals

ORDER BY country ASC, medals DESC; 
