{{create_dependencies_as_ctes(
    ref_names = [
        "int_mailchimp_parse_json_cte"
        ],
    cte_names = [
        'parse_json_cte'
        ]
    )}}

select
    recipients_id,
    recipients_json:"list_id"::string as list_id,
    recipients_json:"list_is_active"::boolean as list_is_active,
    recipients_json:"list_name"::string as list_name,
    recipients_json:"recipient_count"::int as recipient_count


from parse_json_cte as e
group by all
-- having not recipients_id = hash(null)