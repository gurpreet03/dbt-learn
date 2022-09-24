with payments as (
    select
    *
from {{ ref('stg_payments')}}
),

customers as (
select
    *
from {{ ref('stg_orders')}}
),

final as (
select
    c.order_id,
    c.customer_id,
    p.amount
from customers c
left join payments p
on c.order_id = p.orderid
)
select * from final
