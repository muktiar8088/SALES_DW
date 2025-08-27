select PRODUCT_ID , count(*) from {{ref('products')}}
group by PRODUCT_ID 
having count(*) > 1