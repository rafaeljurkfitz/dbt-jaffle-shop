with

order_items as (
    select * from {{ ref ('int_sales__joined_with_products') }}
)

select * from order_items
