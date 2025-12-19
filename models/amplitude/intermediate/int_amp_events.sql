{{create_dependencies_as_ctes(
    ref_names = [
        "stg_jt_deng3_staging__amplitude_events_list_raw",
        "stg_jt_deng3_staging__amplitude_events_raw"
        ],
    cte_names = [
        'amplitude_events_list_raw',
        'amplitude_events_raw'
        ]
    )}}


select distinct
    e.event_id,
    e.session_event_order,
    e.session_id as session_id,
    el.events_list_id,
    e.event_time as event_time,
    hash(e.event_properties) as event_properties_id,
    hash(e.user_properties) as user_properties_id
from amplitude_events_raw as e
left join amplitude_events_list_raw as el
    on e.event_type = el.events_list_name
where rn=1
-- limit 1