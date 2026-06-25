-- ==========================================================
-- ANÁLISE: Preferência por Gênero Literário
-- PERGUNTA DE NEGÓCIO: Qual categoria de livros é mais emprestada?
-- OBJETIVO: Entender o perfil de gosto dos leitores para direcionar compras.
-- ==========================================================

SELECT 
    c.nome_categoria AS categoria, 
    COUNT(e.id) AS total_emprestimos
FROM emprestimos e 
JOIN livros l ON e.livro_id = l.id
JOIN categorias c ON l.categoria_id = c.id
GROUP BY c.nome_categoria
ORDER BY total_emprestimos DESC;
