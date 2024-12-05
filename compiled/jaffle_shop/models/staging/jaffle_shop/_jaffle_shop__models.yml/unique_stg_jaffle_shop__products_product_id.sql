
    
    

select
    product_id as unique_field,
    count(*) as n_records

from "render_jaffle_shop"."public"."stg_jaffle_shop__products"
where product_id is not null
group by product_id
having count(*) > 1


