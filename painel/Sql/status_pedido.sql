SELECT
    order_status,
    CASE order_status
        WHEN 'delivered'   THEN 'Entregue'
        WHEN 'shipped'     THEN 'Em transporte'
        WHEN 'canceled'    THEN 'Cancelado'
        WHEN 'invoiced'    THEN 'Faturado'
        WHEN 'processing'  THEN 'Em processamento'
        WHEN 'created'     THEN 'Criado'
        WHEN 'approved'    THEN 'Aprovado'
        WHEN 'unavailable' THEN 'Indisponível'
        ELSE 'Outros'
    END AS status_pt,
    EXTRACT(YEAR FROM order_purchase_timestamp) AS ano,
    DATE_TRUNC(DATE(order_purchase_timestamp), MONTH) AS data_mes,
    COUNT(DISTINCT order_id) AS total_orders
FROM `olist_ecommerce.olist_orders`
WHERE order_purchase_timestamp IS NOT NULL
GROUP BY 1, 2, 3, 4
ORDER BY ano, total_orders DESC