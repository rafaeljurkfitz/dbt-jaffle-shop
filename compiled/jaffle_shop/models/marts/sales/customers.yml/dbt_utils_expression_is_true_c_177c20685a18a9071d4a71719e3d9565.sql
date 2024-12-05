



select
    1
from "render_jaffle_shop"."public"."customers"

where not(lifetime_spend_pretax + lifetime_tax_paid = lifetime_spend)

