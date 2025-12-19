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