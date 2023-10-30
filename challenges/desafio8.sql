SELECT 
    a.nome AS 'artista', al.album AS 'album'
FROM
    artistas a
        JOIN
    albuns al ON a.artista_id = al.artista_id
WHERE
    a.nome = 'Elis Regina'
ORDER BY al.album;