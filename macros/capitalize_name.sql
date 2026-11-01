{% macro capitalize_name(first_name, last_name) %}
    upper(left(trim({{ first_name }}), 1)) +
    lower(substring(trim({{ first_name }}), 2,len(trim({{ first_name }})))) +
    ' ' + upper(left(trim({{ last_name }}), 1)) +
    lower(substring(trim({{ last_name }}), 2,len(trim({{ last_name }}))))
{% endmacro %}