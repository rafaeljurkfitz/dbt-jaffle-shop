with

customers as (
    select * from {{ ref('int_sales__customers_with_summary') }}
)

select * from customers
