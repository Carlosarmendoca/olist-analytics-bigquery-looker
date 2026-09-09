WITH base AS (
  SELECT
    o.order_status,
    o.order_id,
    c.customer_city,
    c.customer_state,
    c.customer_unique_id,
    DATE_TRUNC(DATE(o.order_purchase_timestamp), MONTH) AS data_mes,
    EXTRACT(YEAR FROM o.order_purchase_timestamp) AS ano,
    -- Calcula o mês da primeira compra olhando todo o histórico do cliente
    MIN(DATE_TRUNC(DATE(o.order_purchase_timestamp), MONTH)) OVER (PARTITION BY c.customer_unique_id) AS primeiro_pedido
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
  COUNT(DISTINCT customer_unique_id) AS total_clientes,
  COUNT(DISTINCT order_id) AS total_pedidos,
  primeiro_pedido,
  customer_city,
  customer_state,
  customer_unique_id,
  data_mes,
  ano
FROM base
GROUP BY 
  order_status, 
  customer_unique_id, 
  customer_city, 
  customer_state, 
  data_mes, 
  ano,
  primeiro_pedido -- A nova coluna precisa entrar no agrupamento
ORDER BY order_status DESC
ORDER BY order_status DESC;



