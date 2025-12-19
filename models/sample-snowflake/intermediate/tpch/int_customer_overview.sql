select
e.customer_key as customer_key
, e.name as customer_name
, e.nation_name
, e.region_name
, e.market_segment as market_segment
, e.first_order_date
, e.last_order_date
, coalesce(s.total_orders,0) as total_orders
, coalesce(s.non_returned_orders,0) as non_returned_orders
, coalesce(s.total_revenue,0) as total_revenue
, s.avg_non_returned_order_value
, s.order_keys
, s.avg_last3_revenue
, reference_date,
s.avg_last3_revenue / s.avg_non_returned_order_value as  revenue_over_order
from {{ref("int_tpch_customer_enriched")}} e
left join {{ref("int_customer_order_summary")}} s on e.customer_key = s.customer_key
Cross join
(--as data is out of date, find a reference date instead of today
    select max(order_date) as reference_date --latest date maybe reused
    from {{ref("stg_tpch_orders")}})