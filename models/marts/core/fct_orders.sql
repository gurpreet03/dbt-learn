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

success_payments as (

    select
    orderid,
    sum(case when status = 'success' then amount end) as amount
    from payments
    group by 1 
),

final as (
select
    c.order_id,
    c.customer_id,
     coalesce(p.amount, 0) as amount
from customers c
left join success_payments p
on c.order_id = p.orderid
)
select * from final
