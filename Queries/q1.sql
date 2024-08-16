-- Who is the senior most employee based on job title?

SELECT first_name, last_name, title
FROM employee
ORDER BY levels DESC
LIMIT 1;