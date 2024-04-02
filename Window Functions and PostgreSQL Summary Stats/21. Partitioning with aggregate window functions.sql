WITH medals AS (...)

SELECT
    year, country, medals,
    SUM(medals) OVER(PSRTITION BY country ORDER BY year ASC) AS medals_rt
FROM medals
    
