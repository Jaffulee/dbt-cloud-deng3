select 
    id as customer_id,
    first_name,
    last_name,
    first_name || ' ' || last_name as name, 
from {{  ref('stg_sandwiches_customers')  }}