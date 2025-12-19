    select -- make this an actual view
        c.customer_key,
        c.name,
        c.nation_key,
        n.name as nation_name,
        r.name as region_name,
        c.market_segment,
        l.first_order_date,
        l.last_order_date
    from {{ref("stg_tpch_customers")}} c
     join {{ref("stg_tpch_nations")}} n
        on c.nation_key = n.nation_key
     join {{ref("stg_tpch_regions")}} r
        on n.region_key = r.region_key
   left join {{ref("int_tpch_first_and_last_order_date")}} l on c.customer_key = l.customer_key 
    