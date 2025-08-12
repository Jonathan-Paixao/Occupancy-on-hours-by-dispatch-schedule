5. O Desafio do Tableau (/tableau)
Arquivos do Tableau (.twb, .twbx) são complicados para o Git, pois são arquivos binários ou XML complexos. O Git não consegue mostrar facilmente "o que mudou" dentro deles.

O que fazer: Salve as versões principais do seu arquivo .twbx aqui como um backup.

Não confie no Git para versionar o Tableau: A melhor documentação para o dashboard não é o arquivo em si, mas toda a documentação que você criou nas outras pastas (documentation/, assets/ e o README.md). Use a funcionalidade de "Histórico de Revisões" do próprio Tableau Server/Cloud para o versionamento fino do dashboard.