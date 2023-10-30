USE SpotifyClone;

CREATE TABLE musicas_favoritas(
    musica_id INT NOT NULL,
    pessoa_usuaria_id INT NOT NULL,
    PRIMARY KEY (pessoa_usuaria_id , musica_id),
    FOREIGN KEY (pessoa_usuaria_id)
        REFERENCES pessoas_usuarias (pessoa_usuaria_id),
    FOREIGN KEY (musica_id)
        REFERENCES musicas (musica_id)
) engine = InnoDB;

INSERT INTO musicas_favoritas(pessoa_usuaria_id, musica_id)
VALUES
  ('1', '3'),
  ('1', '6'),
  ('1', '10'),
  ('2', '4'),
  ('3', '1'),
  ('3', '3'),
  ('4', '7'),
  ('4', '4'),
  ('5', '10'),
  ('5', '2'),
  ('8', '4'),
  ('9', '7'),
  ('10', '3');