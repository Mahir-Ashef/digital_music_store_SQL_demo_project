-- Let's invite the artists who have written the most rock music in our dataset. Write a
-- query that returns the Artist name and total track count of the top 10 rock bands

SELECT artist.name, COUNT(track_id)
FROM artist JOIN album
ON artist.artist_id = album.artist_id
JOIN track
ON album.album_id = track.album_id
JOIN genre
ON track.genre_id = genre.genre_id
WHERE genre.name LIKE 'Rock'
GROUP BY artist.name
ORDER BY COUNT(track_id) DESC
LIMIT 10;