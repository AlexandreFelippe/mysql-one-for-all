SELECT 
    ROUND(MIN(p.valor), 2) AS faturamento_minimo,
    ROUND(MAX(p.valor), 2) AS faturamento_maximo,
    ROUND(AVG(p.valor), 2) AS faturamento_medio,
    ROUND(SUM(p.valor), 2) AS faturamento_total
FROM
    planos p
        JOIN
    pessoas_usuarias pu ON p.plano_id = pu.plano_id;