SELECT
	a.nome AS artista,
    al.album AS album,
    COUNT(s.pessoa_usuaria_id) AS pessoas_seguidoras
    FROM artistas a
JOIN
	albuns al
    ON a.artista_id = al.artista_id
JOIN
	seguindo s
    ON s.artista_id = a.artista_id
GROUP BY
	a.nome, al.album
ORDER BY
	pessoas_seguidoras DESC, a.nome, al.album;