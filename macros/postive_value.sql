{% macro check_positive_value(model, column) %}
    select *
    from {{ model }}
    where {{ column }} < 1
{% endmacro %}