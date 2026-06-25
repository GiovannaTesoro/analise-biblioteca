-- ==================================================================================
-- ANÁLISE: Índice de Inadimplência
-- PERGUNTA DE NEGÓCIO: Quantos empréstimos estão com status 'atrasado' no momento?
-- OBJETIVO: Identificar o volume de devoluções pendentes para ações de cobrança.
-- ==================================================================================

SELECT 
    COUNT(*) AS total_emprestimos_atrasados 
FROM emprestimos 
WHERE status = 'atrasado';