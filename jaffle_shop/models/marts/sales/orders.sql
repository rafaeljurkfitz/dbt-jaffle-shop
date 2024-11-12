with

compute_booleans as (
    select * from {{ ref('int_orders_aggregated_with_booleans') }}
)

select
    *,
    row_number() over (
        partition by customer_id
        order by ordered_at asc
    ) as customer_order_number
from compute_booleans
