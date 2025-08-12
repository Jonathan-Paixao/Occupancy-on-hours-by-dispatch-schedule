3. Pasta documentation/ (O Cérebro do Projeto)
Aqui você armazena o "porquê" das coisas.

Dicionário de Dados (data_dictionary.md): Fundamental! Para cada tabela final, liste as colunas, o tipo de dado (string, integer) e, o mais importante, uma descrição de negócio do que aquela coluna significa.

Regras de Negócio (business_rules.md): Por que um cliente é considerado "ativo"? Qual é a fórmula para a margem de lucro? Documente os cálculos e lógicas complexas que estão no seu SQL ou no Tableau. Isso é ouro!

Arquitetura: Sua ideia de links para as bases de suporte é ótima. Você pode centralizá-las aqui ou criar um diagrama simples (pode ser em uma ferramenta como o diagrams.net e salvar a imagem) mostrando: Fonte de Dados -> Tabela Bruta no BQ -> Tabela de Staging -> Tabela Final -> Tableau.

Anotações de Reuniões (meeting_notes.md): Anote as decisões importantes tomadas com as áreas de negócio. Ex: "Em 08/08/2025, foi decidido com a equipe de Marketing que a campanha X não entrará no cálculo de ROI."