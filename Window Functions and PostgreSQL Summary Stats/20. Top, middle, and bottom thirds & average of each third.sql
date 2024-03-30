WITH athlete_medals AS
(
  SELECT
      athlete,
      COUNT(*) AS medals
  FROM summer_medals
  GROUP BY athlete
  HAVING COUNT(*) > 1
)

SELECT
    athlete, medals,
    NTILE(3) OVER(ORDER BY medals ASC) AS third
FROM athlete_medals
ORDER BY medals DESC, athlete ASC;

---------------------------------------------------------------------

---Return the average of each third

WITH athlete_medals AS
(
  SELECT
      athlete,
      COUNT(*) AS medals
  FROM summer_medals
  GROUP BY athlete
  HAVING COUNT(*) > 1
),

thirds AS
(
  SELECT athlete, medals,
          NTILE(3) OVER(ORDER BY medals DESC) AS third
  FROm athlete_medals
)

SELECT
    third,
    AVG(medals) AS avg_medals
FROM thirds
GROUP BY third
ORDER BY third ASC;  
