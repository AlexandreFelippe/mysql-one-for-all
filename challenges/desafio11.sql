USE SpotifyClone;

SELECT
    al.album AS album,
    COUNT(mf.musica_id) AS favoritadas
FROM 
    albuns al
JOIN 
    musicas m ON al.album_id = m.album_id
LEFT JOIN
    musicas_favoritas mf ON m.musica_id = mf.musica_id
GROUP BY
    al.album
ORDER BY
    favoritadas DESC, al.album ASC
LIMIT 3;