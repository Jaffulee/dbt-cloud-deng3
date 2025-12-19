{{create_dependencies_as_ctes(
    ref_names = [
        "int_mailchimp_parse_json_cte"
        ],
    cte_names = [
        'parse_json_cte'
        ]
    )}}


select
    ecommerce_id,
    ecommerce_json:"total_orders"::int as total_orders,
    ecommerce_json:"total_revenue"::int as total_revenue,
    ecommerce_json:"total_spent"::int as total_spent

from parse_json_cte as e
group by all
-- having not ecommerce_id = hash(null)