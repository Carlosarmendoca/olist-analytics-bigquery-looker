WITH base AS(
SELECT

    o.order_status,
    c.customer_city,
    c.customer_state,
    o.customer_id,
    DATE_TRUNC(DATE(o.order_purchase_timestamp), MONTH) AS data_mes,
    EXTRACT(YEAR FROM o.order_purchase_timestamp) AS ano

FROM `olist_ecommerce.olist_orders` o
LEFT JOIN `olist_ecommerce.olist_customers` c ON o.customer_id = c.customer_id
)

SELECT

  order_status,
 
  CASE order_status
        WHEN 'delivered'   THEN 'Entregue'
        WHEN 'shipped'     THEN 'Em Transporte'
        WHEN 'canceled'    THEN 'Cancelado'
        WHEN 'invoiced'    THEN 'Faturado'
        WHEN 'processing'  THEN 'Em Processamento'
        WHEN 'created'     THEN 'Criado'
        WHEN 'approved'    THEN 'Aprovado'
        WHEN 'unavailable' THEN 'Indisponível'
        ELSE 'Outros'
    END AS status_pt,
  COUNT(DISTINCT customer_id)AS total_clientes,
  customer_city,
  customer_state,
  data_mes,
  ano
 
FROM base
GROUP BY order_status, customer_city, customer_state, data_mes, ano
ORDER BY order_status DESC;



