with 

source as (

    select * from {{ source('jt_deng3_staging', 'amplitude_events_raw') }}

),

renamed as (

    select
        "_airbyte_raw_id" as _airbyte_raw_id,
        "_airbyte_extracted_at" as _airbyte_extracted_at,
        "_airbyte_meta" as _airbyte_meta,
        "_airbyte_generation_id" as _airbyte_generation_id,
        "app" as app,
        "dma" as dma,
        "adid" as adid,
        "city" as city,
        "data" as data,
        "idfa" as idfa,
        -- "plan" as plan,
        "uuid" as event_id,
        -- "groups" as groups,
        "paying" as paying,
        "region" as region,
        "_schema" as _schema,
        "country" as country,
        "library" as library,
        "os_name" as os_name,
        "user_id" as user_id,
        "event_id" as session_event_order,
        -- "language" as language,
        "platform" as platform,
        "data_type" as data_type,
        "device_id" as device_id,
        "source_id" as source_id,
        "_insert_id" as _insert_id,
        "event_time" as event_time,
        "event_type" as event_type,
        "ip_address" as ip_address,
        "os_version" as os_version,
        "partner_id" as partner_id,
        "session_id" as session_id,
        "_insert_key" as _insert_key,
        "device_type" as device_type,
        "sample_rate" as sample_rate,
        "amplitude_id" as amplitude_id,
        "device_brand" as device_brand,
        "device_model" as device_model,
        "location_lat" as location_lat,
        "location_lng" as location_lng,
        "version_name" as version_name,
        "device_family" as device_family,
        "start_version" as start_version,
        "device_carrier" as device_carrier,
        "processed_time" as processed_time,
        "user_properties" as user_properties,
        "event_properties" as event_properties,
        "group_properties" as group_properties,
        "client_event_time" as client_event_time,
        "client_upload_time" as client_upload_time,
        "server_upload_time" as server_upload_time,
        "user_creation_time" as user_creation_time,
        "device_manufacturer" as device_manufacturer,
        "amplitude_event_type" as amplitude_event_type,
        "is_attribution_event" as is_attribution_event,
        "server_received_time" as server_received_time,
        "global_user_properties" as global_user_properties,
        "amplitude_attribution_ids" as amplitude_attribution_ids
        ,
        row_number() over (partition by "event_id" order by "event_id") as rn

    from source

)

select distinct * from renamed
