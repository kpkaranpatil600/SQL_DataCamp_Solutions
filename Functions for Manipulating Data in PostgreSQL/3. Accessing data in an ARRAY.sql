---array can store an array of TEXT values.
--This comes in handy when you want to store things like
-- phone numbers or email addresses as we saw in the lesson.

SELECT
  title, special_features
FROM film

---Use the array index of the special_features column
WHERE special_features[1] = 'Trailers'

-----------------------------------------------------------

---Searching an ARRAY with ANY function

---The ANY function allows you to search for a value in any index position of an ARRAY

SELECT
  title, special_features
FROM film

WHERE 'Trailers' = ANY(special_features)
