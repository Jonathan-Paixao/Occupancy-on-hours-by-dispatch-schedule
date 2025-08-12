# Referências de Dashboards - Tableau

Este diretório contém links e metadados para os dashboards e workbooks criados no Tableau para este projeto.

---

### 1. Comportamento de linhas & M3 - Faturamento

* **Finalidade:** Monitorar o comportamento de faturamento das linhas de produção M3, comparando o realizado com as metas e identificando desvios. É o principal dashboard para a reunião de resultados da produção.
* **Link de Acesso (Tableau Server/Cloud):** `https://tableau.suaempresa.com/#/site/Marketing/views/FaturamentoM3/VisaoGeral`
* **Arquivo do Projeto:** `faturamento_producao_m3.twbx` (Nota: O arquivo não está no repositório, sua versão final fica no SharePoint da área).
* **Público-Alvo:** Gerentes de Produção, Analistas de PCP (Planejamento e Controle da Produção).
* **Principais Fontes de Dados:**
    * Conexão Primária: `seu-projeto.marts.dm_faturamento_producao`
    * Fonte Secundária: `google_sheets.metas_producao_m3`
* **Tipo de Conexão:**
    * `Extração (.hyper)`: Atualizada diariamente às 06:00. O desempenho é otimizado para navegação rápida.
* **Instruções de Acesso:** Requer login no Tableau Server. Acesso liberado para o grupo "Produção". Demais áreas devem solicitar via chamado.
* **Proprietário/Desenvolvedor:** `jonathan.paixao@empresa.com`
* **Última Verificação:** 08/08/2025

---

### 2. Controle de tempo em grade - B2B/D2C

* **Finalidade:** Analisar o tempo médio gasto em cada etapa da grade de produção para os canais B2B e D2C, identificando gargalos.
* **Link de Acesso (Tableau Server/Cloud):** `https://tableau.suaempresa.com/#/site/Operacoes/views/TempoGrade/AnaliseB2B`
* **Arquivo do Projeto:** `analise_tempo_grade_b2b.twbx`
* **Público-Alvo:** Coordenadores de Logística e Melhoria Contínua.
* **Principais Fontes de Dados:**
    * `seu-projeto.marts.dm_tempo_etapas_grade`
* **Tipo de Conexão:**
    * `Ao Vivo (Live)`: Os dados são consultados diretamente no BigQuery a cada interação para garantir informação em tempo real.
* **Proprietário/Desenvolvedor:** `jonathan.paixao@empresa.com`
* **Última Verificação:** 08/08/2025