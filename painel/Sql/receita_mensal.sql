WITH agr_mensal AS (
    SELECT
        DATE_TRUNC(DATE(o.order_delivered_customer_date), MONTH) AS data_mes,
        EXTRACT(YEAR  FROM o.order_delivered_customer_date)      AS ano,
        EXTRACT(MONTH FROM o.order_delivered_customer_date)      AS mes_num,
        FORMAT_DATE('%b', DATE(o.order_delivered_customer_date)) AS mes_nome,
        COUNT(DISTINCT o.order_id)                               AS total_pedidos,
        ROUND(SUM(p.payment_value), 2)                           AS receita_total
    FROM `olist_ecommerce.olist_orders` o
    LEFT JOIN `olist_ecommerce.olist_order_payments` p ON p.order_id = o.order_id
    WHERE o.order_status = 'delivered'
      AND o.order_delivered_customer_date IS NOT NULL
    GROUP BY 1, 2, 3, 4
)

SELECT
    data_mes,
    ano,
    mes_num,
    mes_nome,
    total_pedidos,
    receita_total,
    SUM(receita_total) OVER (PARTITION BY ano ORDER BY mes_num) AS receita_acumulada_ano,
    SUM(total_pedidos) OVER (PARTITION BY ano ORDER BY mes_num) AS pedidos_acumulados_ano,
    LAG(receita_total) OVER (PARTITION BY ano ORDER BY mes_num) AS receita_mes_anterior,
    ROUND(
        (receita_total - LAG(receita_total) OVER (PARTITION BY ano ORDER BY mes_num))
        / NULLIF(LAG(receita_total) OVER (PARTITION BY ano ORDER BY mes_num), 0) * 100
    , 2) AS variacao_mom_pct
FROM agr_mensal
ORDER BY ano, mes_num