
---country level rollup
SELECT
  country, medal, COUNT(*) AS awards
FROM summer_medals

WHERE year = 2008

GROUP BY country, ROLLUP(medal)
ORDER BY country ASC, medal ASC

-----------------------------------------------

----country level rollup and grant total

SELECT
country, medal, COUNT(*) AS awards
FROM summer_medals

WHERE year = 2008

GROUP BY ROLLUP(country, medal)
ORDER BY country ASC, medal ASC

----------------------------------------------------

---medal level rollup
GROUP BY ROLLUP(medal, country)
