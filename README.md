# 📊 Olist Sales Analytics | BigQuery & Looker Studio

## 📌 Sobre o Projeto

Projeto de análise de dados end-to-end utilizando o dataset público de e-commerce da Olist.

Os dados foram importados para o Google BigQuery e transformados por meio de consultas SQL avançadas, utilizando CTEs, Window Functions, Agregações, Joins e Views Analíticas, antes de serem conectados ao Looker Studio para a construção de dashboards interativos.

O objetivo do projeto é demonstrar um fluxo completo de Business Intelligence, desde a modelagem e transformação dos dados até a geração de indicadores e insights que apoiam a tomada de decisão.

---

## 🚀 Tecnologias

- Google BigQuery
- SQL
- Looker Studio
- Git
- GitHub

---

## 🎯 Objetivos

- Construir um pipeline analítico utilizando BigQuery
- Desenvolver consultas SQL otimizadas
- Criar Views Analíticas para consumo dos dashboards
- Desenvolver dashboards executivos no Looker Studio
- Gerar indicadores para suporte à tomada de decisão

---

## 🏗️ Arquitetura do Pipeline

```text
Dataset Olist (CSV)
        │
        ▼
Google BigQuery
(Tabelas Raw)
        │
        ▼
Transformações SQL
(CTEs • Window Functions • Joins)
        │
        ▼
Camada Analítica
(5 Views)
        │
        ▼
Looker Studio
(Dashboard Executivo • Categorias • Clientes)
```

---

## 🗂️ Modelo Analítico

| View | Descrição | SQL |
|------|-----------|-----|
| `vw_receita_por_estado` | Receita Total, Pedidos, Clientes e Prazo Médio de Entrega por Estado| [Ver SQL](painel/Sql/receita_por_estado.sql) |
| `vw_receita_mensal` | Receita Mensal com Crescimento (MoM), Acumulado Anual e Total de Pedidos| [Ver SQL](painel/Sql/receita_mensal.sql) |
| `vw_top_categorias` | Desempenho das Categorias com Receita de Produtos, Frete, Total de Itens e Pedidos | [Ver SQL](painel/Sql/top_categorias.sql) |
| `vw_pedidos_status` | Evolução Mensal dos Pedidos por Status| [Ver SQL](painel/Sql/status_pedido.sql) |
| `vw_clientes_regiao` | Distribuição de Clientes por Cidade, Estado e Status dos Pedidos | [Ver SQL](painel/Sql/clientes_regiao.sql) |

---

## 📈 Dashboards

### 📊 Painel Executivo

- Receita Total
- Ticket Médio
- Pedidos Entregues
- Prazo Médio de Entrega
- Receita por Estado (mapa)
- Evolução da Receita ao Longo do Ano
- Top 10 Categorias por Pedidos
  

<img src="painel/imagens/image.png" width="850"/>

---

### 📦 Desempenho das Categorias

- Receita por Categoria
- Ticket Médio
- Itens Vendidos
- Preço Médio por Item
- Evolução Mensal do Ticket Médio 
- Ranking das Categorias
- Tabela Resumo das Categorias

<img src="painel/imagens/categorias.png" width="850"/>

---

### 👥 Análise de Clientes

- Total de Clientes
- Pedidos Entregues
- Pedidos Cancelados
- Pedidos Faturados
- Top 10 Entregas e Clientes por Estado
- Top 10  de Clientes por Cidade
- Evolução Mensal
- Status dos Pedidos

<img src="painel/imagens/clientes.png" width="850"/>

---

## 💡 Principais Insights

O projeto permite identificar, entre outros pontos:

- Estados com maior participação na receita.
- Evolução mensal do faturamento.
- Categorias com maior volume de vendas.
- Distribuição geográfica dos clientes.
- Relação entre ticket médio e categorias.
- Distribuição dos pedidos por status.
- Indicadores executivos para acompanhamento das vendas.

---

## 📁 Estrutura do Projeto

```text
📦 olist-analytics-bigquery-looker
│
├── painel
│   ├── Sql
│   └── imagens
│
├── README.md
└── documentação
```

---

## 🔗 Dashboard

👉 **Acesse o Dashboard no Looker Studio**

https://datastudio.google.com/reporting/072729d8-07b0-4b29-b17b-4af1e3a869f7

---

## 📚 Competências Demonstradas

- SQL Avançado
- Google BigQuery
- Looker Studio
- Modelagem Analítica
- Business Intelligence
- Visualização de Dados
- Git e GitHub
- Construção de Dashboards Executivos
