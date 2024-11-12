with

order_items as (
    select * from {{ ref('stg_jaffle_shop__order_items') }}
),

orders as (
    select * from {{ ref('stg_jaffle_shop__orders') }}
),

products as (
    select * from {{ ref('stg_jaffle_shop__products') }}
),

order_supplies_summary as (
    select * from {{ ref('int_sales__supplies_summary') }}
)

select
    order_items.*,
    orders.ordered_at,
    products.product_name,
    products.product_price,
    products.is_food_item,
    products.is_drink_item,
    order_supplies_summary.supply_cost
from order_items
left join orders on order_items.order_id = orders.order_id
left join products on order_items.product_id = products.product_id
left join
    order_supplies_summary
    on order_items.product_id = order_supplies_summary.product_id
