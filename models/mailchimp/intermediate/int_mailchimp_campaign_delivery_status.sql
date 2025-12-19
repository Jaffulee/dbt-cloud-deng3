{{create_dependencies_as_ctes(
    ref_names = [
        "int_mailchimp_parse_json_cte"
        ],
    cte_names = [
        'parse_json_cte'
        ]
    )}}
    


select
    delivery_status_id,
    delivery_status_json:"can_cancel"::boolean as can_cancel,
    delivery_status_json:"emails_canceled"::int as emails_canceled,
    delivery_status_json:"emails_sent"::int as emails_sent,
    delivery_status_json:"enabled"::boolean as enabled,
    delivery_status_json:"status"::string as status

from parse_json_cte as e
group by all
-- having not delivery_status_id = hash(null)
