
    
    

select
    location_id as unique_field,
    count(*) as n_records

from "render_jaffle_shop"."public"."stg_jaffle_shop__locations"
where location_id is not null
group by location_id
having count(*) > 1


