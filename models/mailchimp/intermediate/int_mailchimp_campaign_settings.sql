{{create_dependencies_as_ctes(
    ref_names = [
        "int_mailchimp_parse_json_cte"
        ],
    cte_names = [
        'parse_json_cte'
        ]
    )}}

select
    settings_id,
    settings_json:"authenticate"::boolean as authenticate,
    settings_json:"auto_footer"::boolean as auto_footer,
    settings_json:"auto_tweet"::boolean as auto_tweet,
    settings_json:"drag_and_drop"::boolean as drag_and_drop,
    settings_json:"fb_comments"::boolean as fb_comments,
    settings_json:"from_name"::string as from_name,
    settings_json:"inline_css"::boolean as inline_css,
    settings_json:"preview_text"::string as preview_text,
    settings_json:"reply_to"::string as reply_to,
    settings_json:"subject_line"::string as subject_line,
    settings_json:"template_id"::int as template_id,
    settings_json:"timewarp"::boolean as timewarp,
    settings_json:"title"::string as title,
    settings_json:"use_conversation"::boolean as use_conversation

from parse_json_cte as e
group by all
-- having not settings_id = hash(null)