SELECT 
    pu.nome AS 'pessoa_usuaria',
    COUNT(hr.musica_id) AS 'musicas_ouvidas',
    SUM(ROUND(m.duracao / 60, 2)) AS 'total_minutos'
FROM
    pessoas_usuarias pu
        INNER JOIN
    hist_de_reproducao hr ON pu.pessoa_usuaria_id = hr.pessoa_usuaria_id
        INNER JOIN
    musicas m ON m.musica_id = hr.musica_id
GROUP BY pu.nome
ORDER BY pessoa_usuaria;