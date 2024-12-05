
    
    

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
),  __dbt__cte__int_sales__joined_with_products as (
with

order_items as (
    select * from "render_jaffle_shop"."public"."stg_jaffle_shop__order_items"
),

orders as (
    select * from "render_jaffle_shop"."public"."stg_jaffle_shop__orders"
),

products as (
    select * from "render_jaffle_shop"."public"."stg_jaffle_shop__products"
),

order_supplies_summary as (
    select * from __dbt__cte__int_sales__supplies_summary
),

joined as (
    select
        order_items.*,
        orders.ordered_at,
        products.product_name,
        products.product_price,
        products.is_food_item,
        products.is_drink_item,
        order_supplies_summary.supply_cost
    from order_items
    left join orders
        on order_items.order_id = orders.order_id
    left join products
        on order_items.product_id = products.product_id
    left join order_supplies_summary
        on order_items.product_id = order_supplies_summary.product_id
)

select * from joined
) select
    order_item_id as unique_field,
    count(*) as n_records

from __dbt__cte__int_sales__joined_with_products
where order_item_id is not null
group by order_item_id
having count(*) > 1


