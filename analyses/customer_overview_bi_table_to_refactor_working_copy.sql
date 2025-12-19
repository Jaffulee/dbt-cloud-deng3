with customer_enriched as (
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
    
),
customer_order_summary as ( -- make this an actual view
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
),

customer_overview as( -- make a table
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
, reference_date
from {{ref("int_tpch_customer_enriched")}} e
left join {{ref("int_customer_order_summary")}} s on e.customer_key = s.customer_key
Cross join
(--as data is out of date, find a reference date instead of today
    select max(order_date) as reference_date --latest date maybe reused
    from {{ref("stg_tpch_orders")}})
)









select   --lots of tables
customer_key as custkey
,customer_name as custname
, region_name
, nation_name
, market_segment as mktsegment
, first_order_date
, last_order_date
, datediff(day, last_order_date, reference_date) as days_since_last_order
, total_orders
, non_returned_orders
, case when total_orders = 0 then 0 else (1 - (non_returned_orders/total_orders))*100 end as return_rate
, total_revenue
, avg_non_returned_order_value
, avg_last3_revenue
, -- if recent revenue is within 10% of avg then flat, else up or down 
case when (revenue_over_order) > 1.1 then 'up'
when (revenue_over_order) < 0.90 then 'down'
else 'flat' end as revenue_trend
, COALESCE(datediff(day, first_order_date, last_order_date),0) as customer_tenure_days
, coalesce(datediff(day, last_order_date, reference_date)<=90, FALSE) as is_active
, PERCENT_RANK() OVER (ORDER BY total_revenue desc) <= 0.2 as is_high_value
, --churn risk if not active and revenue trending down 
COALESCE(datediff(day, last_order_date, reference_date)>90 and avg_last3_revenue < avg_non_returned_order_value,TRUE) as is_churn_risk
from {{ref("int_customer_overview")}}
order by custkey asc
