with 

source as (

    select * from {{ source('stripe', 'payment') }}

),

renamed as (

    select
        id,
        orderid,
        paymentmethod,
        status,
        round(1.0*amount/100,2) as amount,
        created,
        _batched_at

    from source

)

select * from renamed
