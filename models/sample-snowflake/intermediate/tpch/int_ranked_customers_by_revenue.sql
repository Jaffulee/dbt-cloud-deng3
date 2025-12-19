  SELECT 
    o.customer_key,
    l.extended_price * (1 - l.discount_percentage) AS revenue,
    RANK() OVER (PARTITION BY o.customer_key ORDER BY o.order_date DESC) AS rnk
  FROM {{ref("stg_tpch_orders")}} o
  JOIN {{ref("int_tpch_lineitem_enriched")}} l
    ON o.order_key = l.order_key
  WHERE l.return_flag_is_n