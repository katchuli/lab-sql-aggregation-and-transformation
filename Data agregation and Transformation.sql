## CHALLENGE 1
# 1.1 Determine the shortest and longest movie durations and name the values as max_duration and min_duration.
SELECT MAX(length) AS max_duration, MIN(length) AS min_duration
FROM sakila.film;

SELECT title, length
FROM sakila.film
ORDER BY length DESC;

# 1.2. Express the average movie duration in hours and minutes. Don't use decimals.
SELECT sec_to_time((time_format((ROUND(AVG(length)),"%H:%i"))))
FROM sakila.film;

SELECT sec_to_time(ROUND(AVG(length),0)*60) 

# 2.1 Calculate the number of days that the company has been operating. 
# Hint: To do this, use the rental table, and the DATEDIFF() function to subtract the earliest date in the rental_date column from the latest date 

SELECT DATEDIFF(MAX(rental_date), MIN(rental_date)) AS operating_days
FROM sakila.rental; 

# 2.2 Retrieve rental information and add two additional columns to show the month and weekday of the rental.
--  Return 20 rows of results.

SELECT WEEKDAY(rental_date) AS weekday, MONTH(rental_date) AS month
FROM sakila.rental limit 20; 

# 3 You need to ensure that customers can easily access information about the movie collection. 
-- To achieve this, retrieve the film titles and their rental duration. 
-- If any rental duration value is NULL, replace it with the string 'Not Available'. 
-- Sort the results of the film title in ascending order.

SELECT title, ifnull(rental_duration, 'Not Available')
FROM sakila.film
ORDER BY title ASC;

## CHALLENGE 2
-- Next, you need to analyze the films in the collection to gain some more insights. 
-- Using the film table, determine:
# 1.1 The total number of films that have been released.
SELECT COUNT(rental_rate) FROM sakila.film;
# 1.2 The number of films for each rating.
SELECT COUNT(DISTINCT rating) FROM sakila.film;
#1.3 The number of films for each rating, sorting the results in descending order of the number of films. 
-- This will help you to better understand the popularity of different film ratings and adjust purchasing 
-- decisions accordingly.
SELECT length, rating   #
FROM sakila.film
ORDER BY length ASC;

# Using the film table, determine:
-- 2.1 The mean film duration for each rating, and sort the results in descending order of the mean duration. 
-- Round off the average lengths to two decimal places. This will help identify popular movie lengths for each category.

SELECT (AVG (film_duration) as average_duration), rating
FROM sakila.film # I cannot find where is it film_duration
ORDER BY film_duration DESC;

-- 2.2 Identify which ratings have a mean duration of over two hours in order to help select films for customers who prefer longer movies

SELECT (AVG (film_duration) as average_duration), rating
FROM sakila.film # I cannot find where is it film_duration
ORDER BY film_duration DESC
HAVING average_duration < 120; 









