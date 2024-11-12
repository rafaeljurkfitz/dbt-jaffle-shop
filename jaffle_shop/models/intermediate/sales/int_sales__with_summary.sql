with

customers as (
    select * from {{ ref('stg_jaffle_shop__customers') }}
),

customer_orders_summary as (
    select * from {{ ref('int_customer_orders_summary') }}
)

select
    customers.*,
    customer_orders_summary.count_lifetime_orders,
    customer_orders_summary.first_ordered_at,
    customer_orders_summary.last_ordered_at,
    customer_orders_summary.lifetime_spend_pretax,
    customer_orders_summary.lifetime_tax_paid,
    customer_orders_summary.lifetime_spend,
    case
        when customer_orders_summary.is_repeat_buyer then 'returning'
        else 'new'
    end as customer_type
from customers
left join customer_orders_summary
    on customers.customer_id = customer_orders_summary.customer_id
