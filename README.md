# 📊 Olist Sales Analytics | BigQuery & Looker Studio

## 📌 Visão Geral

Projeto de análise de vendas end-to-end desenvolvido com o dataset público de 
e-commerce da Olist. Os dados foram modelados e transformados no Google BigQuery 
através de SQL, antes de serem conectados ao Looker Studio para criação de 
dashboards interativos.

O projeto foca em entregar insights acionáveis de negócio através de modelagem 
de dados, queries SQL otimizadas e visualizações em nível executivo.

## 🔗 Dashboard
[Acesse o Dashboard no Looker Studio](https://datastudio.google.com/reporting/072729d8-07b0-4b29-b17b-4af1e3a869f7)

## 🎯 Objetivos
- Analisar o desempenho de vendas e comportamento de clientes
- Construir um modelo analítico de dados no BigQuery
- Criar queries SQL otimizadas utilizando CTEs e Views
- Desenvolver dashboards interativos no Looker Studio
- Aplicar boas práticas de visualização de dados para Business Intelligence

## 🛠️ Tecnologias Utilizadas
- Google BigQuery
- SQL (CTEs, Window Functions, Joins)
- Looker Studio
- Python
- Git & GitHub

## 🗂️ Modelo de Dados — Views Analíticas

| View | Descrição |
|------|-----------|
| `vw_receita_por_estado` | Receita, ticket médio e prazo de entrega por estado |
| `vw_receita_mensal` | Receita mensal com variação MoM e acumulado anual |
| `vw_top_categorias` | Desempenho de categorias com receita e preço médio |
| `vw_pedidos_status` | Distribuição de status dos pedidos ao longo do tempo |
| `vw_clientes_regiao` | Distribuição de clientes por cidade e estado |

## 🏗️ Pipeline de Dados
Dataset Olist (CSV)
│
▼
Google BigQuery — Tabelas Raw
│
▼
Camada SQL (CTEs • Window Functions • Joins)
│
▼
Camada Analítica (5 Views Otimizadas)
│
▼
Looker Studio Dashboard (3 Páginas)
## 📈 Funcionalidades do Dashboard

### Painel Executivo de Vendas
- Cards: Faturamento Total, Pedidos Entregues, Ticket Médio e Prazo de Entrega
- Distribuição Geográfica de Receita por Estado
- Evolução da Receita ao Longo do Ano
- Top 10 Categorias por Volume de Pedidos

### Desempenho das Categorias
- Cards: Receita total, Ticket Médio, Itens Vendidose Preço médio por Item  
- Top 10 Categorias por Receita
- Evolução Mensal do Ticket Médio
- Tabela Resumo por Categoria

### Análise e Destribuição de Clientes
- Cards: Total de Clientes, Pedidos entregues, Pedidos Faturados e Pedidos Cancelados
- Top 10 Entregas e Clientes por Estado
- Top 10  de Clientes por Cidade
- Evolução Mensal de Clientes
- Pedidos por Status (exceto Entregues)

## 📚 Competências Demonstradas
- Modelagem de dados analíticos
- SQL avançado — CTEs, Window Functions, Joins complexos
- Boas práticas de arquitetura de dados (camada raw → views analíticas)
- Business Intelligence e visualização de dados
- Design de dashboards executivos
- Google BigQuery e Looker Studio

## 📷 Preview do Dashboard

### Painel Executivo de Vendas
![Painel Executivo](imagens/pagina1.png)

### Desempenho das Categorias
![Categorias](imagens/pagina2.png)

### Análise de Clientes
![Clientes](imagens/pagina3.png)
