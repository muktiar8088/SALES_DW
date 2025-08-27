{% snapshot dim_product %}
{{
    config(
        target_schema='DW' ,
        transient=false ,
        strategy='check',
        check_cols=['PRICE'],
        unique_key='PRODUCT_ID',
        invalidate_hard_deletes=false 
    )
}}

select {{dbt_utils.generate_surrogate_key(['PRODUCT_ID'])}}  as product_skey, s.*
from {{ref("products")}} as s

{% endsnapshot%}