{{create_dependencies_as_ctes(
    ref_names = [
        "stg_jt_deng3_staging__amplitude_events_raw"
        ],
    cte_names = [
        'amplitude_events_raw'
        ]
    )}}


//OS_lookup
SELECT DISTINCT HASH(os_name) as os_id, 
os_name as os_name
FROM amplitude_events_raw