{{create_dependencies_as_ctes(
    ref_names = [
        "int_mailchimp_parse_json_cte"
        ],
    cte_names = [
        'parse_json_cte'
        ]
    )}}


select
    report_summary_id,
    report_summary_json:"click_rate"::float as click_rate,
    report_summary_json:"clicks"::int as clicks,
    ecommerce_id,
    report_summary_json:"open_rate"::float as open_rate,
    report_summary_json:"opens"::int as opens,
    report_summary_json:"subscriber_clicks"::int as subscriber_clicks,
    report_summary_json:"unique_opens"::int as unique_opens

from parse_json_cte as e
group by all
-- having not report_summary_id = hash(null)