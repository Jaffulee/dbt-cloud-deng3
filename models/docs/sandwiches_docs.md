{% docs customer_id %}
The unique identifier of a customer.
Primary key to the customer tables.
{% enddocs %}

{% docs order_id %}
The unique identifier of an order.
Primary key to the order tables.
{% enddocs %}

{% docs order_status %}
The current status of the order.
One of these values:

| order_status | meaning |
|:-|-:|
| return_pending | waiting for the order to be returned |
| completed | order is completed |
| returned | order was successfully returned |
| shipped | order has left warehouse |
| placed | order still to leave warehouse |
{% enddocs %}