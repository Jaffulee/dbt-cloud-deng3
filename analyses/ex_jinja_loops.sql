

{%- set foods = ['carrots','hotdogs','pineapples','fava beans'] -%}



{{foods}}

{% for food in foods %}
    {% if food == 'hotdogs' -%}
        {% set snacktype = 'snack' -%}
    {% else -%}
        {% set snacktype = 'good for you'-%}
    {% endif-%}
    I love {{food}} because they are {{snacktype}}
{% endfor -%}