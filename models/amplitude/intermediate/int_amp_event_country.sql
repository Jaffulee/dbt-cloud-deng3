{{create_dependencies_as_ctes(
    ref_names = [
        "stg_jt_deng3_staging__amplitude_events_raw"
        ],
    cte_names = [
        'amplitude_events_raw'
        ]
    )}}


--amp_event_country.
select distinct
country as country_name,
hash(country) as country_id
from amplitude_events_raw