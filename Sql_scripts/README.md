# Scripts SQL do Projeto

Esta pasta contém todos os scripts SQL utilizados para processar os dados, desde a preparação (staging) até a criação das tabelas finais (marts) que alimentam os dashboards.

## Ordem de Execução e Lógica do Pipeline

Os scripts devem ser executados na ordem especificada abaixo para garantir a integridade e a consistência dos dados. A lógica segue o fluxo: `Staging` -> `Marts`.

1.  **Pasta `/1_staging`**: Contém os scripts que limpam e padronizam os dados brutos.
    * `stg_origem_dados_A.sql`
    * `stg_origem_dados_B.sql`
2.  **Pasta `/2_marts`**: Contém os scripts que transformam os dados de staging em tabelas de fatos e dimensões, prontas para análise.
    * `dm_clientes.sql` (Depende de `stg_origem_dados_A.sql`)
    * `ft_vendas.sql` (Depende de `stg_origem_dados_A.sql` e `stg_origem_dados_B.sql`)

## Padrões e Convenções

* **Nomenclatura:** Tabelas de staging são prefixadas com `stg_`, tabelas de dimensão com `dm_`, e tabelas de fato com `ft_`.
* **Comentários:** Queries complexas devem ser comentadas para explicar a regra de negócio aplicada.