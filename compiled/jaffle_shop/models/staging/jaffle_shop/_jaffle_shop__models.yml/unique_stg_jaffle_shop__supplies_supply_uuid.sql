
    
    

select
    supply_uuid as unique_field,
    count(*) as n_records

from "render_jaffle_shop"."public"."stg_jaffle_shop__supplies"
where supply_uuid is not null
group by supply_uuid
having count(*) > 1


