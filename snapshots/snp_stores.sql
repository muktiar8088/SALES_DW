{% snapshot dim_stores %}
{{
    config(
        
        target_schema='DW',
        transient=false,
        strategy='check',
        unique_key='STORE_ID',
        check_cols=['STORE_NAME', 'CITY'] , 
        alias='dim_store' ,
        query_tag='dbt_scd2'
    )

}}

select {{dbt_utils.generate_surrogate_key(['STORE_ID'])}}  STORE_SKEY , s.*
from {{ref('stores')}} as s
 {% endsnapshot %}