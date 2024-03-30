WITH events AS
(
  SELECT DISTINCT events
  FROM summer_medals
)

SELECT
    event,
    NTILE(111) OVER(ORDER BY event ASC) AS page
FROM events
ORDER BY event ASC; 
