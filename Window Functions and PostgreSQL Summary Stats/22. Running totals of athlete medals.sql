WITH athelete_medals AS
(
  SELECT
    athelete, COUNT(*) AS medals
  FROM summer_medals
  WHERE
    counrty = 'USA'
    AND medal = 'gold'
    AND year >= 2000
  GROUP bY athelete
)

  SELECT
    athelete, medals,
    SUM(medals) OVER(ORDER BY athelete ASC) AS max_medals
  FROM athelete_medals
  ORDER BY athelete ASC; 
