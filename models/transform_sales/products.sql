{{
    config(
        materialized='incremental',
        transient=false,
        query_tag='dbt',
        alias='products' ,
        strategy='merge',
        unique_key='PRODUCT_ID',
        on_schema_change='fail'

    )
}}

select * from {{source('sales' , 'PRODUCTS_RAW')}}

{% if is_incremental() %}
where 1=1
{% endif %}
