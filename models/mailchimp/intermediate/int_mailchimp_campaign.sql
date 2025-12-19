{{create_dependencies_as_ctes(
    ref_names = [
        "int_mailchimp_parse_json_cte"
        ],
    cte_names = [
        'parse_json_cte'
        ]
    )}}
    

select
    created_campaign_id,
    campaign_json:"archive_url"::string as campaign_archive_url,
    campaign_json:"content_type"::string as content_type,
    campaign_json:"create_time"::timestamp as create_time,
    delivery_status_id,
    campaign_json:"emails_sent"::int as emails_sent,
    campaign_json:"id"::string as campaign_id,
    campaign_json:"long_archive_url"::string as campaign_long_archive_url,
    campaign_json:"needs_block_refresh"::boolean as needs_block_refresh, -- deprecated
    recipients_id,
    report_summary_id,
    campaign_json:"resendable"::int as resendable,
    campaign_json:"send_time"::timestamp as send_time,
    settings_id,
    campaign_json:"status"::string as campaign_status,
    tracking_id,
    campaign_json:"type"::string as campaign_type,
    campaign_json:"web_id"::int as web_id
from parse_json_cte as e
group by all
-- having not created_campaign_id = hash(null)