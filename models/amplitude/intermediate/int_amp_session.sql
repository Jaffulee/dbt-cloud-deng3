{{create_dependencies_as_ctes(
    ref_names = [
        "stg_jt_deng3_staging__amplitude_events_raw"
        ],
    cte_names = [
        'amplitude_events_raw'
        ]
    )}}



SELECT DISTINCT
    session_id AS session_id,
    user_id AS user_id,
    HASH(os_version, device_family, device_type) AS device_id,
    HASH(ip_address) AS location_id
FROM amplitude_events_raw