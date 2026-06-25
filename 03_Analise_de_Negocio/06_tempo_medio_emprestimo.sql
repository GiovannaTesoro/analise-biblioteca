-- ==========================================================
-- ANÁLISE: Tempo Médio de Permanência
-- PERGUNTA DE NEGÓCIO: Qual é o tempo médio de empréstimo (em dias) para livros já devolvidos?
-- OBJETIVO: Avaliar se o prazo padrão de devolução está adequado ao comportamento dos leitores.
-- ==========================================================

SELECT 
    ROUND(AVG(data_devolucao - data_emprestimo), 2) AS media_dias_emprestimo
FROM emprestimos
WHERE data_devolucao IS NOT NULL;