
    
    

select
    order_item_id as unique_field,
    count(*) as n_records

from "render_jaffle_shop"."public"."order_items"
where order_item_id is not null
group by order_item_id
having count(*) > 1


