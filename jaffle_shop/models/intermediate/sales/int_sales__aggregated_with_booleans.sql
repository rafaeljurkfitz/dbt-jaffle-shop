with

orders as (
    select * from {{ ref('stg_jaffle_shop__orders') }}
),

order_items_summary as (
    select * from {{ ref('int_sales__items_summary') }}
)

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
