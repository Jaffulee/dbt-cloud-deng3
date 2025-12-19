with 

source as (

    select * from {{ source('jt_deng3_staging', 'amplitude_events_list_raw') }}

),

renamed as (

    select 
        -- _airbyte_raw_id,
        "_airbyte_extracted_at" as _airbyte_extracted_at,
        -- _airbyte_meta,
        -- _airbyte_generation_id,
        "id" as events_list_id,
        "name" as events_list_name,
        -- "value" as value,
        "hidden" as hidden,
        -- "totals" as totals,
        "deleted" as deleted,
        -- "display" as display,
        "autohidden" as autohidden,
        "non_active" as non_active,
        "flow_hidden" as flow_hidden,
        "in_waitroom" as in_waitroom,
        "totals_delta" as totals_delta,
        "clusters_hidden" as clusters_hidden,
        "timeline_hidden" as timeline_hidden

    from source

)

select distinct * from renamed
