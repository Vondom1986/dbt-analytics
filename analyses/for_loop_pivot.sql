{% set target_makes = ['Toyota','Ford','Chevrolet','Honda','Nissan'] %}

SELECT 
    DDATE, 
    SALESPERSON,
    {% for make in target_makes %}
    SUM(CASE WHEN CARMAKE = '{{ make }}' THEN TOTAL_SALE ELSE 0 END) AS sales_{{ make }}{% if not loop.last %},{% endif %}
    {% endfor %}
FROM {{ ref("psg_montly_sales_make")}}    
GROUP BY DDATE, SALESPERSON