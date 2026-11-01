{% macro salary_category(salary_column) %}
    case
        when {{ salary_column }} < 5000 then 'Low'
        when {{ salary_column }} < 10000 then 'Medium'
        else 'High'
    end
{% endmacro %}
