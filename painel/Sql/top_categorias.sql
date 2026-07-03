WITH categoria_pedido AS (

    SELECT
        od.order_id,
        COALESCE(pr.product_category_name, 'Sem Categoria') AS product_category_name,

        SUM(od.price) AS receita_produtos,
        SUM(od.freight_value) AS receita_frete,
        SUM(od.price + od.freight_value) AS receita_categoria,

        COUNT(*) AS total_itens

    FROM `olist_ecommerce.olist_order_items` od

    LEFT JOIN `olist_ecommerce.olist_products` pr
        ON pr.product_id = od.product_id

    GROUP BY 1,2

)

SELECT
    ri.product_category_name,
    DATE_TRUNC(DATE(o.order_purchase_timestamp), MONTH) AS data_mes,
    EXTRACT(YEAR FROM o.order_purchase_timestamp) AS ano,
    COUNT(DISTINCT o.order_id) AS total_pedidos,
    SUM(ri.total_itens) AS total_itens,
    SUM(ri.receita_produtos) AS receita_produtos,
    SUM(ri.receita_frete) AS receita_frete,
    SUM(ri.receita_categoria) AS receita_categoria
FROM `olist_ecommerce.olist_orders` o
JOIN categoria_pedido ri ON o.order_id = ri.order_id
WHERE o.order_status = 'delivered'
  AND o.order_purchase_timestamp IS NOT NULL
GROUP BY 1, 2, 3
ORDER BY data_mes DESC, receita_categoria DESC