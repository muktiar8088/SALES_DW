
{{
    config(
        materialized='incremental',
        alias='SALES',
        unique_key='SALE_ID',
        strategy='merge',
        query_tag='dbt',
        on_schema_change='fail'
    )
}}
select * from {{source('sales' , 'SALES_RAW')}}

{% if is_incremental() %}
where 1=1
{% endif %}
