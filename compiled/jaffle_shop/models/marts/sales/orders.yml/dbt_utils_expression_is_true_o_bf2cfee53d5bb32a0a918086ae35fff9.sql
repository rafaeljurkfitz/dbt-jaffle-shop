



select
    1
from "render_jaffle_shop"."public"."orders"

where not(order_total = subtotal + tax_paid)

