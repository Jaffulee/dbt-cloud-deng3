{{create_dependencies_as_ctes(
    ref_names = [
        "stg_jt_deng3_staging__amplitude_events_raw"
        ],
    cte_names = [
        'amplitude_events_raw'
        ]
    )}}



, json as (Select
    hash(user_properties) as up_id,
    parse_json(user_properties) as parsed_json
from amplitude_events_raw
)

select distinct
    up_id,
    parsed_json:initial_utm_medium::STRING AS initial_utm_medium,
    parsed_json:initial_referring_domain::STRING AS initial_referring_domain,
    parsed_json:initial_utm_campaign::STRING AS initial_utm_campaign,
    parsed_json:referrer::STRING AS referrer,
    parsed_json:initial_utm_source::STRING AS initial_utm_source,
    parsed_json:initial_referrer::STRING AS initial_referrer,
    parsed_json:referring_domain::STRING AS referring_domain
from json