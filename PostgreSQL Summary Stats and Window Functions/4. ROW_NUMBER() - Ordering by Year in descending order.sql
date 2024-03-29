  SELECT
      year, event, country,
      ROW_NUMBER() OVER(ORDER BY year DESC) AS row_n
  FROM Summer_Medals

  WHERE medal = 'gold';


-----------------------------------------------------------------

--ordering by multiple columns -

SELECT
    year, event, country,
    ROW_NUMBER() OVER(ORDER BY year DESC, EVENT ASC) AS row_n
FROM Summer_Medals

WHERE medal = 'gold';


----------------------------------------------------------------------

--ordering in and outsdie OVER

SELECT
    year, event, country,
    ROW_NUMBER() OVER(ORDER BY year DESC, EVENT ASC) AS row_n
FROM Summer_Medals

WHERE medal = 'gold'

ORDER BY country ASC, row_n ASC;
