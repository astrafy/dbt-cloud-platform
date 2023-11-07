
{% macro query_comment(node) %}

    {% set dag_run_id = '{{ invocation_id }}' %}

    {%- set comment_dict = {} -%}
    {%- if node is not none -%}
        {%- do comment_dict.update(
            app='dbt',
            dbt_version=dbt_version,
            profile_name=target.get('profile_name'),
            target_name=target.get('target_name'),
            dag_run_id=dag_run_id,
            data_product= node.tags[0]
        ) -%}
    {% else %}
      {%- do comment_dict.update(node_id='internal') -%}
    {%- endif -%}
    {% do return(tojson(comment_dict)) %}
{% endmacro %}

