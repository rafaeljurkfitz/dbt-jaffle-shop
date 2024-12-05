



select
    1
from "render_jaffle_shop"."public"."orders"

where not(order_items_subtotal = subtotal)

