



select
    1
from "render_jaffle_shop"."public"."stg_jaffle_shop__orders"

where not(order_total - tax_paid = subtotal)

