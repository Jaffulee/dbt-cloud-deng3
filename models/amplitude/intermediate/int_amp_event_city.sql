{{create_dependencies_as_ctes(
    ref_names = [
        "stg_jt_deng3_staging__amplitude_events_raw"
        ],
    cte_names = [
        'amplitude_events_raw'
        ]
    )}}



--amp_event_city
select distinct
city as city_name,
hash(city) as city_id
from amplitude_events_raw