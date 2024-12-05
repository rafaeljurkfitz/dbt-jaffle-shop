with

source as (

    select * from "render_jaffle_shop"."public_raw"."raw_orders"

),

renamed as (

    select

        ----------  ids
        id as order_id,
        store_id as location_id,
        customer as customer_id,

        ---------- numerics
        subtotal as subtotal_cents,
        tax_paid as tax_paid_cents,
        order_total as order_total_cents,
        (subtotal::numeric(16, 2) / 100) as subtotal,
        (tax_paid::numeric(16, 2) / 100) as tax_paid,
        (order_total::numeric(16, 2) / 100) as order_total,

        ---------- timestamps
        date_trunc('day', ordered_at) as ordered_at

    from source

)

select * from renamed