-- Write a query that determines the customer that has spent the most on music for each
-- country. Write a query that returns the country along with the top customer and how
-- much they spent. For countries where the top amount spent is shared, provide all
-- customers who spent this amount

WITH top_user AS (SELECT customer.country as c, customer.first_name as n1, customer.last_name as n2, SUM(invoice.total) as s,
DENSE_RANK() OVER(PARTITION BY customer.country ORDER BY SUM(invoice.total)) as rn
FROM customer JOIN invoice
ON customer.customer_id = invoice.customer_id
GROUP BY customer.country, customer.first_name
ORDER BY customer.country)

SELECT c, n1, n2 ,s FROM top_user
WHERE rn <=1;