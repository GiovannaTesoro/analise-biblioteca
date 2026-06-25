-- ==========================================================
-- ANÁLISE: Tamanho do Acervo
-- PERGUNTA DE NEGÓCIO: Quantos livros temos cadastrados no total na biblioteca?
-- OBJETIVO: Conhecer o tamanho atual do acervo para planejamento de expansão.
-- ==========================================================

SELECT 
    COUNT(*) AS total_livros 
FROM livros;