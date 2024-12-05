with

 __dbt__cte__int_sales__customers_with_summary as (
with

customers as (
    select * from "render_jaffle_shop"."public"."stg_jaffle_shop__customers"
),

orders as (
    select * from "render_jaffle_shop"."public"."stg_jaffle_shop__orders"
),

orders_summary as (

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

),

joined as (

    select

    customers.*,

    orders_summary.count_lifetime_orders,
    orders_summary.first_ordered_at,
    orders_summary.last_ordered_at,
    orders_summary.lifetime_spend_pretax,
    orders_summary.lifetime_tax_paid,
    orders_summary.lifetime_spend,

        case
            when orders_summary.is_repeat_buyer then 'returning'
            else 'new'
        end as customer_type

    from customers

    left join orders_summary
        on customers.customer_id = orders_summary.customer_id

)

select * from joined
), customers as (
    select * from __dbt__cte__int_sales__customers_with_summary
)

select * from customers