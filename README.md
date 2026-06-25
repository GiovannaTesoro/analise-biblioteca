# Análise de Dados - Sistema de Biblioteca Literária

## Problema de Negócio

A Biblioteca Literária precisa entender melhor o comportamento de seus leitores para otimizar o acervo, reduzir atrasos e melhorar a experiência dos usuários. Sem dados estruturados, as decisões sobre compra de livros e gestão de empréstimos eram baseadas apenas em observações casuais, resultando em acervo desatualizado e alto índice de atrasos.

**Como melhorar a gestão do acervo e reduzir o índice de atrasos através da análise de dados?**

## Contexto

O projeto foi desenvolvido para analisar o desempenho da Biblioteca Literária, com foco em entender os padrões de empréstimo, identificar os livros mais populares, mapear os usuários mais ativos e criar uma estratégia de cobrança para os atrasados. A análise tem como objetivo fornecer insights acionáveis para a gestão da biblioteca.

## Premissas da Análise

- Total de **57 livros** cadastrados no acervo
- Base de **40 usuários** ativos
- **39 empréstimos** registrados
- **12 empréstimos atrasados** (30,7% do total)
- Tempo médio de empréstimo: **11,29 dias**
- Dados extraídos de um banco de dados PostgreSQL relacional

## Estratégia da Solução

### Passo 1: Modelagem do Banco de Dados
Criação de 6 tabelas relacionais (CATEGORIAS, AUTORES, LIVROS, LIVROS_AUTORES, USUARIOS, EMPRESTIMOS) com chaves primárias e estrangeiras para garantir integridade dos dados.

### Passo 2: População dos Dados
Inserção de dados simulados: 57 livros, 40 usuários e 39 empréstimos, com distribuição realista de categorias e status.

### Passo 3: Análise Exploratória com SQL
Desenvolvimento de 7 queries para responder perguntas de negócio:
- Total de livros no acervo
- Total de empréstimos atrasados
- Top 5 livros mais emprestados
- Top 5 usuários mais ativos
- Categorias mais emprestadas
- Tempo médio de empréstimo
- Lista de usuários com livros atrasados

### Passo 4: Visualização no Power BI
Criação de dashboard interativo com 5 KPIs, 4 gráficos e 1 tabela de cobrança para facilitar a interpretação dos dados.

## Hipóteses Analíticas

**Hipótese 1:** Romances representam mais de 40% dos empréstimos, sendo a categoria mais popular.

**Hipótese 2:** Existe um grupo de usuários fiéis que concentram a maioria dos empréstimos.

**Hipótese 3:** O tempo médio de empréstimo está próximo de 11 dias, indicando que o prazo de 14 dias é adequado.

## Principais Insights

### Visão Geral do Desempenho
- **Total de Livros:** 57
- **Total de Usuários:** 40
- **Total de Empréstimos:** 39
- **Empréstimos Atrasados:** 12 (30,7%)
- **Tempo Médio de Empréstimo:** 11,29 dias

### Empréstimos por Status
- **Emprestado (em dia):** 15 empréstimos (38,5%)
- **Devolvido:** 12 empréstimos (30,8%)
- **Atrasado:** 12 empréstimos (30,7%)

**Conclusão:** Quase 1/3 dos empréstimos está atrasado, indicando necessidade de estratégia de cobrança (Hipótese 3 validada)

### Categorias Mais Emprestadas
- **Romance:** Categoria líder em empréstimos
- **Poesia e Conto:** Seguem em popularidade
- **Outras categorias:** Menor demanda

**Conclusão:** Romance domina as preferências dos leitores (Hipótese 1 confirmada)

### Top 5 Usuários Mais Ativos
5 usuários empatados com 2 empréstimos cada, demonstrando distribuição equilibrada da base de leitores (Hipótese 2 parcialmente confirmada)

### Tabela de Cobrança
Lista detalhada com nome do usuário, título do livro, data do empréstimo e dias de atraso, permitindo ação direta de cobrança.

## Resultados

Para a gestão da biblioteca, esses insights permitem:

- **Gestão de acervo:** Priorizar compra de romances e categorias populares
- **Estratégia de cobrança:** Contatar os 12 usuários com livros atrasados
- **Política de empréstimo:** Avaliar se o prazo de 14 dias está adequado (média é 11,29 dias)
- **Programa de fidelidade:** Criar incentivos para os usuários mais ativos
- **Redução de atrasos:** Implementar lembretes automáticos antes do vencimento

## Tecnologias Utilizadas

- **PostgreSQL** (Modelagem e SQL)
- **Power BI** (Dashboard e Visualização)
- **Git/GitHub** (Versionamento)

## Estrutura do Projeto
analise-biblioteca-sql/
├── README.md
├── 01_ddl/ # Criação das tabelas
│ └── 01_criar_tabelas.sql
├── 02_dml/ # Inserção de dados
│ └── 02_inserir_dados.sql
├── 03_queries_analise_negocio/ # Queries SQL analíticas
│ ├── 01_qtd_total_livros.sql
│ ├── 02_qtd_emprestimos_atrasados.sql
│ ├── 03_top5_livros_mais_emprestados.sql
│ ├── 04_top5_usuarios_mais_ativos.sql
│ ├── 05_categorias_mais_emprestadas.sql
│ ├── 06_tempo_medio_emprestimo.sql
│ └── 07_usuarios_com_livros_atrasados.sql
├── 04_documentacao/ # Dicionário de dados e explicações
│ ├── dicionario_dados.md
│ └── explicacao_queries.md
└── 05_dashboard/ # Dashboard Power BI
├── Dashboard_Biblioteca.pbix
└── prints/ # Screenshots das visualizações
├── imagem1.png (dashboard_geral)
├── imagem2.png
└── imagem3.png


##  Como Executar

1. Clone este repositório:
   ```bash
   git clone https://github.com/seu-usuario/analise-biblioteca-sql.git
   ```

2. Execute os scripts SQL na ordem:
    01_ddl/01_criar_tabelas.sql (cria as tabelas)
    02_dml/02_inserir_dados.sql (insere os dados)
    Execute as queries de análise em 03_queries_analise_negocio/
    Abra o arquivo 05_dashboard/Dashboard_Biblioteca.pbix no Power BI Desktop
    Visualize os screenshots na pasta 05_dashboard/prints/


  Projeto desenvolvido por Giovana Lourenço
🔗 LinkedIn 
