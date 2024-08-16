-- Which countries have the most Invoices?

SELECT billing_country, COUNT(billing_country)
FROM invoice
GROUP BY billing_country
ORDER BY COUNT(billing_country) DESC
LIMIT 1;