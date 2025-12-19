--row_number() over (partition by user_id order by order_date, id) as user_order_seq,

select
    id as order_id,
    user_id as customer_id,
    order_date,
    status as order_status,
    row_number() over (partition by user_id order by order_date, id) as user_order_seq,
    status NOT IN ('returned','return_pending') as is_not_return
from {{ref('stg_sandwiches_orders')}}
where status != 'pending'