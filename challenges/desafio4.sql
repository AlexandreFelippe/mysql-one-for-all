SELECT 
    pu.nome AS pessoa_usuaria,
    CASE
        WHEN YEAR(MAX(hr.data_reproducao)) >= 2021 THEN 'Ativa'
        ELSE 'Inativa'
    END AS status_pessoa_usuaria
FROM
    pessoas_usuarias pu
        INNER JOIN
    hist_de_reproducao hr ON pu.pessoa_usuaria_id = hr.pessoa_usuaria_id
GROUP BY pu.nome
ORDER BY pessoa_usuaria;