{{create_dependencies_as_ctes(
    ref_names = [
        "stg_jt_deng3_staging__amplitude_events_raw"
        ],
    cte_names = [
        'amplitude_events_raw'
        ]
    )}}



SELECT DISTINCT HASH(os_name, device_type, device_family, os_version) as device_id,
HASH(os_name) os_id,
HASH(device_type,device_family) device_type_id,
os_version as os_version
FROM amplitude_events_raw