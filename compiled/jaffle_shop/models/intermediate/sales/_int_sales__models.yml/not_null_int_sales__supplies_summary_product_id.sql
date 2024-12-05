
    
    



with __dbt__cte__int_sales__supplies_summary as (
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
) select product_id
from __dbt__cte__int_sales__supplies_summary
where product_id is null


