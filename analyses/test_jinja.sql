SELECT *
FROM {{ ref("stg_sales_data_2020p") }}
{% if target.name != 'prod_databoosters'%}
LIMIT 10
{% endif %}