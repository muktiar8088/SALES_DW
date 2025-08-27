
{{
    config(materialized='incremental',
    strategy='merge',
    unique_key='STORE_ID',
    alias='STORES',
    on_schema_change='fail',
    query_tag='dbt'
    )
}}
select * from {{source('sales', 'STORES_RAW')}}

{% if is_incremental() %}
where 1=1
{% endif %}