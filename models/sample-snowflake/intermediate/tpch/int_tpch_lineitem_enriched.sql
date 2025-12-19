select 
    *,
    l.return_flag = 'N' as return_flag_is_n,
    -- case when l.return_flag = 'N' then o.order_key end as non_returned_order_keys, -- cant do without join
    case when l.return_flag = 'N' then l.extended_price * (1 - l.discount_percentage) else 0 end as revenue,
    case when l.return_flag = 'N' then l.extended_price * (1 - l.discount_percentage) else null end as non_returned_order_value
 
from {{ref("stg_tpch_line_items")}} l