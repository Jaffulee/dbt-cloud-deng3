select  --first and last order date
        o.customer_key,
        min(o.order_date) as first_order_date,
        max(o.order_date) as last_order_date
from {{ref("stg_tpch_orders")}} o
group by o.customer_key