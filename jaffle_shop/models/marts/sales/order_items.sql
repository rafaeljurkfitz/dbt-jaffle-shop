with

order_items as (
    select * from {{ ref ('int_orders_joined_with_products') }}
)

select * from order_items
