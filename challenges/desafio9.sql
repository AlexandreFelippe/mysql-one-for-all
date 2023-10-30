SELECT 
    COUNT(hu.musica_id) AS musicas_no_historico
FROM
    pessoas_usuarias pu
        JOIN
    hist_de_reproducao hu ON pu.pessoa_usuaria_id = hu.pessoa_usuaria_id
WHERE
    pu.nome = 'Barbara Liskov';