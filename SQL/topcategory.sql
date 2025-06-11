select category, COUNT(*) as Total_Products
from amazon_cleaned
GROUP BY category
ORDER BY Total_Products desc;