{% snapshot stores %}
{{
    config(
        materialized='table',
        target_schema='DW'
        transient=false,
        strategy='check',
        check_cols=['STORE_NAME', 'CITY'] , 
        alias='dim_product' ,
        query_tag='dbt_scd2'
    )

}}

select {{dbt_util.generate_surrogate_key(['STORE_ID'])}} STORE_SKEY , s.*
from {{ref('stores')}} as s
 {% endsnapshot %}