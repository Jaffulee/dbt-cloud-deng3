with orders as (
    select
    *
    from {{ref("int_sandwiches_orders")}}
),

customers as (
    select
    *
    from {{ref("int_sandwiches_customers_with_name")}}
),

successful_payments as (
    select
    *
    from {{ref("int_sandwiches_successful_payments")}}
)


select
    customers.customer_id as customer_id,
    customers.name as full_name,
    customers.last_name as surname,
    customers.first_name as givenname,
    min(order_date) as first_order_date,
    min(case when orders.is_not_return then order_date end) as first_non_returned_order_date,
    max(case when orders.is_not_return then order_date end) as most_recent_non_returned_order_date,
    COALESCE(max(user_order_seq),0) as order_count,
    COALESCE(count(case when orders.order_status != 'returned' then 1 end),0) as non_returned_order_count,
    sum(case when orders.is_not_return then successful_payments.amount else 0 end) as total_lifetime_value,
    sum(case when orders.is_not_return then successful_payments.amount else 0 end)/NULLIF(count(case when orders.is_not_return then 1 end),0) as avg_non_returned_order_value,
    array_agg(distinct orders.order_id) as order_ids
from orders
join customers on orders.customer_id = customers.customer_id
left outer join successful_payments on orders.order_id = successful_payments.order_id

group by customers.customer_id, customers.name, customers.last_name, customers.first_name