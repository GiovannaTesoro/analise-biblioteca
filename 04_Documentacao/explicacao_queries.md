# Explicação das Queries SQL

Este documento explica a lógica por trás das consultas SQL criadas para extrair insights de negócio do acervo da biblioteca.

## Query 1: Total de Livros
```sql
SELECT COUNT(*) AS total_livros FROM livros;
```

Explicação:

COUNT(*): Conta quantas linhas tem na tabela de livros. É como o bibliotecário contar quantos livros tem na estante.

## Query 2: Total de Empréstimos Atrasados
```sql
SELECT COUNT(*) AS total_atrasos
FROM emprestimos
WHERE status ='atrasado';
```
Explicação:

WHERE status = 'atrasado': Filtra só os empréstimos que estão atrasados. É como o bibliotecário olhar a lista de quem está devendo livro e contar quantos são.

## Query 3: Top 5 Livros Mais Emprestados
```sql
SELECT l.titulo, COUNT(e.id) AS total_emprestimos
FROM emprestimos e
JOIN livros l ON e.livro_id = l.id
GROUP BY l.titulo
ORDER BY total_emprestimos DESC
LIMIT 5;
```
Explicação:

JOIN livros: Conecta o empréstimo com o livro (como o bibliotecário olha qual livro foi emprestado).
COUNT(e.id): Conta quantas vezes cada livro foi emprestado.
GROUP BY l.titulo: Separa os livros em pilhas (não conta tudo junto).
ORDER BY ... DESC: Coloca o mais emprestado no topo.
LIMIT 5: Mostra só os 5 primeiros (os best-sellers da biblioteca).

## Query 4: Top 5 Usuários Mais Ativos
```sql
SELECT u.nome, COUNT(e.id) AS total_emprestimos
FROM usuarios u
JOIN emprestimos e ON u.id = e.usuario_id
GROUP BY u.nome
ORDER BY total_emprestimos DESC
LIMIT 5;
```
Explicação:

JOIN emprestimos: Conecta o usuário com os empréstimos dele (como o bibliotecário olha o histórico de cada leitor).
COUNT(e.id): Conta quantos empréstimos cada usuário fez.
GROUP BY u.nome: Separa os usuários em pilhas.
LIMIT 5: Mostra só os 5 leitores mais fiéis (que poderiam ganhar um prêmio de fidelidade).

## Query 5: Categorias Mais Emprestadas
```sql
SELECT c.nome_categoria AS categoria, COUNT(e.id) AS total_emprestimos
FROM emprestimos e 
JOIN livros l ON e.livro_id = l.id
JOIN categorias c ON l.categoria_id = c.id
GROUP BY c.nome_categoria
ORDER BY total_emprestimos DESC;
```
Explicação:

JOIN livros: Conecta empréstimo com livro.
JOIN categorias: Conecta livro com categoria (como o bibliotecário olha a etiqueta de gênero do livro).
GROUP BY c.nome_categoria: Separa as categorias em pilhas.
ORDER BY ... DESC: Coloca a categoria mais popular no topo.

Essa query ajuda a entender o gosto dos leitores. Se "Romance" é o mais emprestado, a biblioteca sabe que deve comprar mais romances!

## Query 6: Tempo Médio de Empréstimo
```sql
SELECT ROUND(AVG(data_devolucao - data_emprestimo), 2) AS media_dias_emprestimo
FROM emprestimos
WHERE data_devolucao IS NOT NULL;
```
Explicação:

data_devolucao - data_emprestimo: Subtrai a data de empréstimo da data de devolução (resulta em dias).
AVG(): Calcula a média de todos os dias.
ROUND(..., 2): Arredonda para 2 casas decimais (fica mais bonito no relatório).
WHERE data_devolucao IS NOT NULL: Filtra só os livros que já foram devolvidos (não dá para calcular tempo de quem ainda está com o livro).

Essa query ajuda a biblioteca a definir prazos. Se a média é 11 dias, talvez o prazo de 14 dias esteja bom!

## Query 7: Usuários com Livros Atrasados
```sql
SELECT u.nome AS usuario, l.titulo AS livro, (CURRENT_DATE - e.data_emprestimo) AS dias_atraso
FROM emprestimos e
JOIN usuarios u ON e.usuario_id = u.id
JOIN livros l ON e.livro_id = l.id
WHERE e.status = 'atrasado'
ORDER BY dias_atraso DESC;
```
Explicação:

JOIN usuarios: Conecta empréstimo com usuário (para saber o nome de quem está devendo).
JOIN livros: Conecta empréstimo com livro (para saber qual livro está atrasado).
CURRENT_DATE - e.data_emprestimo: Calcula quantos dias se passaram desde o empréstimo (dias de atraso).
WHERE status = 'atrasado': Filtra só os atrasados.
ORDER BY dias_atraso DESC: Coloca o maior caloteiro no topo.

Essa é a lista de cobrança! O bibliotecário usa essa query para saber quem ligar para cobrar a devolução.
