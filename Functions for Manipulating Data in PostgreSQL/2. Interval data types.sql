SELECT
  rental_date, return_date
  return_date + INTERVAL '3 days' AS expected_return_date
FROM rental
