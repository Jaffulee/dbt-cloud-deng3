{{create_dependencies_as_ctes(
    ref_names = [
        "stg_mailchimp_campaigns"
        ],
    cte_names = [
        'airbyte_sync_mailchimp_data_raw_python_campaigns'
        ]
    )}}
    
select
    hash(r.json_data)::int as created_campaign_id,
    (parse_json(r.json_data)):"_airbyte_data" as campaign_json,
    hash(
            ((parse_json(r.json_data)):"_airbyte_data"):"delivery_status"
        )::int as delivery_status_id,
        ((parse_json(r.json_data)):"_airbyte_data"):"delivery_status" as delivery_status_json,
    hash(
            ((parse_json(r.json_data)):"_airbyte_data"):"recipients"
        )::int as recipients_id,
        ((parse_json(r.json_data)):"_airbyte_data"):"recipients" as recipients_json,
    hash(
            ((parse_json(r.json_data)):"_airbyte_data"):"report_summary"
        )::int as report_summary_id,
        ((parse_json(r.json_data)):"_airbyte_data"):"report_summary" as report_summary_json,
hash(
(((parse_json(r.json_data)):"_airbyte_data"):"report_summary"):"ecommerce"
        )::int as ecommerce_id,
        (((parse_json(r.json_data)):"_airbyte_data"):"report_summary"):"ecommerce" as ecommerce_json,
hash(
            ((parse_json(r.json_data)):"_airbyte_data"):"settings"
        )::int as settings_id,
        ((parse_json(r.json_data)):"_airbyte_data"):"settings" as settings_json,
  hash(
            ((parse_json(r.json_data)):"_airbyte_data"):"tracking"
        )::int as tracking_id,
        ((parse_json(r.json_data)):"_airbyte_data"):"tracking" as tracking_json
from airbyte_sync_mailchimp_data_raw_python_campaigns as r
group by all
-- having not created_campaign_id = hash(null)