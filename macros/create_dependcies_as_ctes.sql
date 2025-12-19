{#-
    Macro: create_dependencies_as_ctes

    Description:
    This macro dynamically generates a series of CTE (Common Table Expression) statements 
    in a SQL query using dbt's Jinja templating engine. It maps a list of dbt model references 
    (`ref_names`) to corresponding CTE names (`cte_names`) and formats them with correct comma separation.

    Parameters:
    - ref_names: A list of dbt model names (as strings) to be referenced using the `ref()` function.
    - cte_names: A list of CTE alias names (as strings) corresponding to each model in `ref_names`.

    Output:
    Generates a properly formatted `WITH` clause with one CTE per ref_name → cte_name mapping.

    Example usage:
    {% set ref_names = ['orders', 'customers'] %}
    {% set cte_names = ['orders_cte', 'customers_cte'] %}
    {{ create_dependencies_as_ctes(ref_names, cte_names) }}

    Output:
    WITH
    orders_cte AS (
        SELECT *
        FROM {{ ref('orders') }}
    ),
    customers_cte AS (
        SELECT *
        FROM {{ ref('customers') }}
    )
#}

{% macro create_dependencies_as_ctes(ref_names, cte_names) -%}

WITH
{%- for ref_name in ref_names -%}
    {{ "," if not loop.first else "" }}

    {{ cte_names[loop.index0] }} AS (
        SELECT * 
        FROM {{ ref(ref_name) }}
    )
{%- endfor %}

{%- endmacro %}