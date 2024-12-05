
    
    

with  __dbt__cte__int_sales__supplies_summary as (
with

supplies as (
    select * from "render_jaffle_shop"."public"."stg_jaffle_shop__supplies"
),

sum as (
    select
        product_id,
        sum(supply_cost) as supply_cost
    from supplies
    group by 1
)

select * from sum
), child as (
    select product_id as from_field
    from __dbt__cte__int_sales__supplies_summary
    where product_id is not null
),

parent as (
    select product_id as to_field
    from "render_jaffle_shop"."public"."stg_jaffle_shop__products"
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null


