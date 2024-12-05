
    
    

select
    customer_id as unique_field,
    count(*) as n_records

from "render_jaffle_shop"."public"."stg_jaffle_shop__customers"
where customer_id is not null
group by customer_id
having count(*) > 1


