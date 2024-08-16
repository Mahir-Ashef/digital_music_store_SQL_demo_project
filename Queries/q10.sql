-- We want to find out the most popular music Genre for each country. We determine the
-- most popular genre as the genre with the highest amount of purchases. Write a query
-- that returns each country along with the top Genre. For countries where the maximum
-- number of purchases is shared return all Genres

WITH famous_genre AS (SELECT  COUNT(invoice_line.invoice_line_id) as n, invoice.billing_country AS c, genre.genre_id, genre.name AS g,
DENSE_RANK() OVER(PARTITION BY invoice.billing_country ORDER BY COUNT(invoice_line.invoice_line_id) DESC) as rn
FROM invoice JOIN invoice_line
ON invoice.invoice_id = invoice_line.invoice_id
JOIN track
ON invoice_line.track_id = track.track_id
JOIN genre
ON track.genre_id = genre.genre_id
GROUP BY invoice.billing_country, genre.genre_id, genre.name
ORDER BY invoice.billing_country)
SELECT c, g, n, rn FROM famous_genre
WHERE rn <= 1;