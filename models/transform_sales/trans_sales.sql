{{
    config(materialized='incremental',
    transient=false,
    schema='DW',
    unique_key='SALE_ID',
    query_tag='dbt',
    starategy='merge',
    alias='fct_sales'
    )
}}

select s.*, d.DATE_KEY
from {{ref('sales')}} as s 
join {{source('dimensions_facts' , 'DIM_DATE')}} as d
on (s.date=d.date)

{% if is_incremental() %}
where 1=1
{% endif %}