{% macro learn_variables() %}
{% set name ="Virender Mehta" %}

{{log('call me ' ~ name , info = True )}}

{{log ('call ' ~ var("user_name","dbt_user"), info= True)}}
{% endmacro %}