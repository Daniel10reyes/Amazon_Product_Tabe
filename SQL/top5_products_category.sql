WITH Ranked_data AS(
    SELECT category, product_name, rating,
           ROW_NUMBER() OVER (PARTITION BY category ORDER BY rating DESC) AS Rank
    FROM amazon_cleaned
)
SELECT r.category, r.product_name, ROUND(r.rating,2)
FROM Ranked_data AS r
RIGHT JOIN top10_categories AS T10 ON T10.category = r.category
WHERE r.Rank <= 5
ORDER BY r.category, r.rating;
