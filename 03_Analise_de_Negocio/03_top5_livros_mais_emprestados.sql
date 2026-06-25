-- ==========================================================
-- ANÁLISE: Best-sellers do Acervo
-- PERGUNTA DE NEGÓCIO: Quais são os 5 livros mais emprestados da biblioteca?
-- OBJETIVO: Identificar os títulos mais populares para orientar novas aquisições.
-- ==========================================================

SELECT 
    l.titulo, 
    COUNT(e.id) AS total_emprestimos
FROM emprestimos e
JOIN livros l ON e.livro_id = l.id
GROUP BY l.titulo
ORDER BY total_emprestimos DESC
LIMIT 5;