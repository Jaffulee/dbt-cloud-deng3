{{create_dependencies_as_ctes(
    ref_names = [
        "stg_jt_deng3_staging__amplitude_events_raw"
        ],
    cte_names = [
        'amplitude_events_raw'
        ]
    )}}


SELECT DISTINCT HASH(device_type,device_family) as device_type_id, 
NVL( device_type,device_family)as device_name,
HASH(device_family) as device_family_id
FROM amplitude_events_raw
-- order by device_type_id