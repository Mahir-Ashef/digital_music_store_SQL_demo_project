-- Find how much amount spent by each customer on the best selling artist? Write a query to return
-- customer name, artist name and total spent

WITH best_selling_artist AS (SELECT artist.artist_id, artist.name as artist_name, SUM(invoice_line.quantity * invoice_line.unit_price) as earn
FROM artist JOIN album
ON artist.artist_id = album.artist_id
JOIN Track
ON album.album_id = track.album_id
JOIN invoice_line
ON track.track_id = invoice_line.track_id
GROUP BY artist.artist_id
ORDER BY earn DESC
LIMIT 1)

SELECT customer.customer_id, customer.first_name, customer.last_name, best_selling_artist.artist_name, SUM(invoice_line.quantity * invoice_line.unit_price) as spent
FROM customer JOIN invoice
ON customer.customer_id = invoice.customer_id
JOIN invoice_line
ON invoice.invoice_id = invoice_line.invoice_id
JOIN track
ON invoice_line.track_id = track.track_id
JOIN album
ON track.album_id = album.album_id
JOIN best_selling_artist
ON album.artist_id = best_selling_artist.artist_id
GROUP BY customer.customer_id
ORDER BY spent DESC;