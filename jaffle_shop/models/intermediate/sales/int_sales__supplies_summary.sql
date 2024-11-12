with

supplies as (
    select * from {{ ref('stg_jaffle_shop__supplies') }}
),

sum as (
    select
        product_id,
        sum(supply_cost) as supply_cost
    from supplies
    group by 1
)

select * from sum
