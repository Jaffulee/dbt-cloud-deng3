{{create_dependencies_as_ctes(
    ref_names = [
        "stg_jt_deng3_staging__amplitude_events_raw"
        ],
    cte_names = [
        'amplitude_events_raw'
        ]
    )}}

//Device Family Lookup
SELECT DISTINCT device_family as device_family_id, 
device_family
FROM amplitude_events_raw
where device_family is not null