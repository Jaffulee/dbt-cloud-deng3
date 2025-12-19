SELECT -- make this a thing
  customer_key,
  AVG(CASE WHEN rnk <= 3 THEN revenue ELSE NULL END) AS avg_last3_revenue
FROM {{ref("int_ranked_customers_by_revenue")}}
GROUP BY customer_key