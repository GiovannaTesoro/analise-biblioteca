-- ==========================================================
-- ANÁLISE: Relatório de Cobrança
-- PERGUNTA DE NEGÓCIO: Quais usuários têm livros atrasados no momento? Mostre o nome do usuário, o título do livro e quantos dias está atrasado.
-- OBJETIVO: Gerar lista de inadimplentes para ações prioritárias de cobrança.
-- ==========================================================

SELECT 
    u.nome AS usuario,
    l.titulo AS livro,
    (CURRENT_DATE - e.data_emprestimo) AS dias_atraso
FROM emprestimos e
JOIN usuarios u ON e.usuario_id = u.id
JOIN livros l ON e.livro_id = l.id
WHERE e.status = 'atrasado'
ORDER BY dias_atraso DESC;