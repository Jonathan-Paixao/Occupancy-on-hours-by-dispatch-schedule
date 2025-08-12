# Referências de Planilhas Google Sheets

Este diretório contém links e metadados para as planilhas do Google Sheets que são usadas como fonte ou parâmetro para este projeto.

---

### 1. Parâmetros de Campanhas de Marketing

* **Finalidade:** Armazenar os códigos (`UTMs`) e o orçamento para cada campanha de marketing. A query em `sql_scripts/2_marts/dm_vendas_consolidadas.sql` utiliza esta planilha como uma tabela de apoio.
* **Link de Acesso:** `https://docs.google.com/spreadsheets/d/12345ABCDE...`
* **Proprietário/Responsável:** `ana.silva@empresa.com`
* **Estrutura Importante (Abas e Colunas):**
    * **Aba `Campanhas_Ativas`**:
        * `id_campanha` (TEXT): Identificador único.
        * `nome_campanha` (TEXT): Nome comercial.
        * `orcamento_reais` (NUMBER): Orçamento total da campanha.
* **Instruções de Acesso:** Acesso de leitura liberado para toda a organização. Para edição, solicitar permissão ao proprietário.
* **Última Verificação do Link:** 08/08/2025

---

### 2. Cadastro Manual de Lojas

* **Finalidade:** Lista de lojas físicas que ainda não estão no sistema principal. Usada para enriquecer a base de vendas.
* **Link de Acesso:** `https://docs.google.com/spreadsheets/d/67890FGHIJ...`
* **Proprietário/Responsável:** `carlos.santos@empresa.com`
* **Instruções de Acesso:** Planilha restrita. É necessário solicitar acesso diretamente ao responsável.
* **Última Verificação do Link:** 08/08/2025