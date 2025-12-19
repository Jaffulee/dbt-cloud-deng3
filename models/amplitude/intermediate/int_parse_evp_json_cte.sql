{{create_dependencies_as_ctes(
    ref_names = [
        "stg_jt_deng3_staging__amplitude_events_raw"
        ],
    cte_names = [
        'amplitude_events_raw'
        ]
    )}}


select distinct
        hash(e.event_properties) as event_properties_id,
        (parse_json(e.event_properties)) as json
    from amplitude_events_raw as e
