{{create_dependencies_as_ctes(
    ref_names = [
        "stg_mailchimp_email_activity"
        ],
    cte_names = [
        'airbyte_sync_mailchimp_data_raw_python_email_activity'
        ]
    )}}


, parse_json_cte as (
    select
        hash(r.json_data)::int as created_id,
        (parse_json(r.json_data)):"_airbyte_data" as json
    from airbyte_sync_mailchimp_data_raw_python_email_activity as r
)

select
    created_id as created_email_id,
    json:"action"::string as action,
    json:"campaign_id"::string as campaign_id,
    json:"email_address"::string as email_address,
    json:"email_id"::string as email_id,
    json:"ip"::string as email_ip,
    json:"list_id"::string as list_id,
    json:"list_is_active"::boolean as list_is_active,
    json:"timestamp"::timestamp as email_timestamp,
    json:"url"::string as email_url
from parse_json_cte as e
group by all
-- having not created_email_id = hash(null)
