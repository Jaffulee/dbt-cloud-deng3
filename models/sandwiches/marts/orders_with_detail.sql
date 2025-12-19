with orders as (
    select
    *
    from {{ref("int_sandwiches_orders")}}
),

customer_dim as (
    select
    *
    from {{ref("customers_with_details")}}
),

successful_payments as (
    select
    *
    from {{ref("int_sandwiches_successful_payments")}}
)


select 
    orders.order_id,
    orders.customer_id,
    customer_dim.surname,
    customer_dim.givenname,
    customer_dim.first_order_date,
    customer_dim.order_count,
    customer_dim.total_lifetime_value,
    successful_payments.amount as order_value_dollars,
    orders.order_status,
    successful_payments.payment_status as payment_status
from orders
join customer_dim on orders.customer_id = customer_dim.customer_id
left join successful_payments on orders.order_id = successful_payments.order_id