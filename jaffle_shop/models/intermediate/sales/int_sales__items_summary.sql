with

order_items as (
    select * from {{ ref('order_items') }}
),

itens_summary as (
    select
        order_id,

        sum(supply_cost) as order_cost,
        sum(product_price) as order_items_subtotal,
        count(order_item_id) as count_order_items,

        sum(
            case when is_food_item then 1 else 0 end
        ) as count_food_items,
        sum(
            case when is_drink_item then 1 else 0 end
        ) as count_drink_items

    from order_items

    group by 1

)

select * from itens_summary
