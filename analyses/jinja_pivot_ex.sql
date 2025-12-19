{%- set method = ['bank_transfer','coupon','gift_card'] -%}
with payments as (
    select * from {{ref('stg_sandwiches_payment')}}
),

pivoted as (
    select 
        orderid,
        {%- for x in method %} -- the lack of minus here gives new lines for each x
        sum(case when paymentmethod = '{{x}}' then amount else 0 end) as {{x}}_amount
        {%- if not loop.last -%} -- the minuses ensures no newline characters i.e. it 
        ,
        {%- endif -%}
        {%- endfor %} -- make sure from is not on the end of the last select
    from payments
    group by 1
)

select * from pivoted