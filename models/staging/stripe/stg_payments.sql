select
    orderid
    ,paymentmethod
    ,status
    ,amount / 100 as amount
    ,created
from raw.stripe.payment