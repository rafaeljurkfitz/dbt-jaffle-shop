
    
    

select
    order_item_id as unique_field,
    count(*) as n_records

from "render_jaffle_shop"."public"."stg_jaffle_shop__order_items"
where order_item_id is not null
group by order_item_id
having count(*) > 1


