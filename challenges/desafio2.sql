SELECT 
    COUNT(DISTINCT m.nome) AS cancoes,
    COUNT(DISTINCT ar.nome) AS artistas,
    COUNT(DISTINCT al.album) AS albuns
FROM
    musicas m
        INNER JOIN
    albuns al ON m.album_id = al.album_id
        INNER JOIN
    artistas ar ON ar.artista_id = al.artista_id;