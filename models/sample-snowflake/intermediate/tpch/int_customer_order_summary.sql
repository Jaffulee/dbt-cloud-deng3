    select
        o.customer_key,
        count(distinct o.order_key) as total_orders,
        count(distinct case when l.return_flag_is_n then o.order_key end) as non_returned_orders,
        sum(l.revenue) as total_revenue,
        avg(l.non_returned_order_value) as avg_non_returned_order_value,
        array_agg(distinct o.order_key) as order_keys,
        MAX(n.avg_last3_revenue) as avg_last3_revenue
    from {{ref("stg_tpch_orders")}} o
    join {{ref("int_tpch_lineitem_enriched")}} l
        on o.order_key = l.order_key
    left join 
    {{ref("int_avg_last3_revenue")}} n on o.customer_key = n.customer_key 
    group by o.customer_key