-- ==========================================================
-- ANÁLISE: Leitores Mais Fiéis
-- PERGUNTA DE NEGÓCIO: Quais são os 5 usuários mais ativos (que mais fizeram empréstimos)?
-- OBJETIVO: Identificar os leitores mais engajados para programas de fidelidade.
-- ==========================================================

SELECT 
    u.nome, 
    COUNT(e.id) AS total_emprestimos
FROM usuarios u
JOIN emprestimos e ON u.id = e.usuario_id
GROUP BY u.nome
ORDER BY total_emprestimos DESC
LIMIT 5;