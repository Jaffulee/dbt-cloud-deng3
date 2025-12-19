with source as (

    select * from {{ source('jt_deng3_staging', 'airbyte_sync_mailchimp_data_raw_python_campaigns') }}

),

renamed as (

    select
        json_data

    from source

)

select * from renamed