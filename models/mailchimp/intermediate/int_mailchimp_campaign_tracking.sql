{{create_dependencies_as_ctes(
    ref_names = [
        "int_mailchimp_parse_json_cte"
        ],
    cte_names = [
        'parse_json_cte'
        ]
    )}}

select
    tracking_id,
    tracking_json:"ecomm360"::boolean as ecomm360,
    tracking_json:"goal_tracking"::boolean as goal_tracking,
    tracking_json:"html_clicks"::boolean as html_clicks,
    tracking_json:"opens"::boolean as opens,
    tracking_json:"text_clicks"::boolean as text_clicks

from parse_json_cte as e
group by all
-- having not tracking_id = hash(null)