
select
    id,
    orderid as order_id,
    paymentmethod as payment_method,
    status as payment_status,
    amount,
    created
from {{ref("stg_sandwiches_payment")}}
where status != 'fail'