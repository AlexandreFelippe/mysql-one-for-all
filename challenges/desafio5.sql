SELECT 
    m.nome AS 'cancao', COUNT(hr.musica_id) AS 'reproducoes'
FROM
    musicas m
        INNER JOIN
    hist_de_reproducao hr ON m.musica_id = hr.musica_id
GROUP BY m.nome
ORDER BY reproducoes DESC , cancao
LIMIT 2;