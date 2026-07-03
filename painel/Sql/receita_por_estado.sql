WITH pagamentos_consolidados AS (
    -- Consolida os pagamentos por pedido primeiro para evitar duplicação (fan-out)
    SELECT 
        order_id, 
        SUM(payment_value) AS total_pago_pedido
    FROM `olist_ecommerce.olist_order_payments`
    GROUP BY 1
)

SELECT
    CONCAT('BR-', c.customer_state) AS state_geo,
    EXTRACT(YEAR FROM o.order_purchase_timestamp)   AS ano,
    DATE_TRUNC(DATE(o.order_purchase_timestamp), MONTH) AS data_mes,
    COUNT(DISTINCT o.order_id)                      AS total_pedidos,
    COUNT(DISTINCT o.customer_id)                   AS total_clientes,
    SUM(p.total_pago_pedido)                        AS receita_total,
    SUM(DATE_DIFF(DATE(o.order_delivered_customer_date),
                  DATE(o.order_purchase_timestamp), DAY)) AS soma_dias_entrega,
    COUNT(DISTINCT o.order_id) AS total_pedidos_entregues
FROM `olist_ecommerce.olist_orders` o
LEFT JOIN `olist_ecommerce.olist_customers` c ON c.customer_id = o.customer_id
LEFT JOIN pagamentos_consolidados p ON p.order_id = o.order_id

WHERE o.order_status = 'delivered'
  AND o.order_purchase_timestamp IS NOT NULL

GROUP BY 1, 2, 3
ORDER BY receita_total DESC