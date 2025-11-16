{% macro safe_upper(column_name) %}
    UPPER({{ column_name }})
{% endmacro %}
