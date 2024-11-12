with

customers as (
    select * from {{ ref('int_customers_with_summary') }}
)

select * from customers
