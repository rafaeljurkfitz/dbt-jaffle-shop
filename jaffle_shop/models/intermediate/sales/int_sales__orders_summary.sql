with

orders as (
    select * from {{ ref('orders') }}
)

summary as (
    select
    orders.customer_id,
    count(distinct orders.order_id) as count_lifetime_orders,
    count(distinct orders.order_id) > 1 as is_repeat_buyer,
    min(orders.ordered_at) as first_ordered_at,
    max(orders.ordered_at) as last_ordered_at,
    sum(orders.subtotal) as lifetime_spend_pretax,
    sum(orders.tax_paid) as lifetime_tax_paid,
    sum(orders.order_total) as lifetime_spend
from orders
group by 1
)

select * from summary
