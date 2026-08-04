{% macro generate_id(columnn_name) %}
RANK() OVER (ORDER BY {{columnn_name}} )
{% endmacro %}