
    
    

with  __dbt__cte__int_sales__aggregated_with_booleans as (
with

orders as (
    select * from "render_jaffle_shop"."public"."stg_jaffle_shop__orders"
),

order_items as (
    select * from "render_jaffle_shop"."public"."order_items"
),

order_items_summary as (

    select

        order_id,

        sum(supply_cost) as order_cost,
        sum(product_price) as order_items_subtotal,
        count(order_item_id) as count_order_items,

        sum(
            case when is_food_item then 1 else 0 end
        ) as count_food_items,
        sum(
            case when is_drink_item then 1 else 0 end
        ) as count_drink_items

    from order_items

    group by 1

),

aggregated as (
    select
        orders.*,
        order_items_summary.order_cost,
        order_items_summary.order_items_subtotal,
        order_items_summary.count_food_items,
        order_items_summary.count_drink_items,
        order_items_summary.count_order_items,
        order_items_summary.count_food_items > 0 as is_food_order,
        order_items_summary.count_drink_items > 0 as is_drink_order
    from orders
    left join order_items_summary
        on orders.order_id = order_items_summary.order_id
)

select * from aggregated
), all_values as (

    select
        is_drink_order as value_field,
        count(*) as n_records

    from __dbt__cte__int_sales__aggregated_with_booleans
    group by is_drink_order

)

select *
from all_values
where value_field not in (
    'True','False'
)


