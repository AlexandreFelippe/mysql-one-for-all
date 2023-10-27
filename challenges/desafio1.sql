DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE IF NOT EXISTS SpotifyClone;

USE SpotifyClone;

CREATE TABLE artistas(
     artista_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
     nome VARCHAR(255) NOT NULL,
) engine = InnoDB;
INSERT INTO artistas (artista_id, nome) VALUES('Beyoncé');
INSERT INTO artistas (artista_id, nome) VALUES('Queen');
INSERT INTO artistas (artista_id, nome) VALUES('Elis Regina');
INSERT INTO artistas (artista_id, nome) VALUES('Baco Exu do Blues');
INSERT INTO artistas (artista_id, nome) VALUES('Blind Guardian');
INSERT INTO artistas (artista_id, nome) VALUES('Nina Simone');

CREATE TABLE planos(
     plano_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
     nome VARCHAR(255) NOT NULL,
     valor DECIMAL(10,2) NOT NULL,
) engine = InnoDB;
INSERT
  INTO
  planos (plano_id, nome, valor)
VALUES
  ('gratutito', 0.00),
  ('familiar', 7.99),
  ('universitario', 5.99),
  ('pessoal', 6.99);

CREATE TABLE pessoas_usuarias(
     pessoa_usuaria_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
     nome VARCHAR(255) NOT NULL,
     idade INT NOT NULL,
     data_assinatura DATE NOT NULL,
     plano_id INT NOT NULL,
     FOREIGN KEY (plano_id) REFERENCES planos(plano_id)
) engine = InnoDB;
INSERT
  INTO
  pessoas_usuarias (pessoa_usuaria_id, nome, idade, data_assinatura, plano_id)
VALUES
  ('Barbara Liskov', '82', '2019-10-20', '1'),
  ('Robert Cecil Martin', '58', '2017-01-06', '1'),
  ('Ada Lovelace', '37', '2017-12-30', '2'),
  ('Martin Fowler', '46', '2017-01-17', '2'),
  ('Sandi Metz', '58', '2018-04-29', '3'),
  ('Paulo Freire', '19', '2018-02-14', '3'),
  ('Bell Hooks', '26', '2018-01-05', '3'),
  ('Christopher Alexander', '85', '2019-06-05', '4'),
  ('Judith Butler', '45', '2020-05-13', '4'),
  ('Jorge Amado', '58', '2017-02-17', '4'),

CREATE TABLE seguindo(
     artista_id INT NOT NULL,
     pessoa_usuaria_id INT NOT NULL,
     FOREIGN KEY (pessoa_usuaria_id) REFERENCES pessoas_usuarias(pessoa_usuaria_id),
     FOREIGN KEY (artista_id) REFERENCES artistas(artista_id)
) engine = InnoDB;
INSERT
  INTO
  seguindo_artistas (artista_id, pessoa_usuaria_id)
VALUES
  ('1', '1');
  ('2', '1');
  ('3', '1');
  ('1', '2');
  ('3', '2');
  ('2', '3');
  ('4', '4');
  ('5', '5');
  ('6', '5');
  ('6', '6');
  ('1', '6');
  ('6', '7');
  ('3', '9');
  ('6', '10');

CREATE TABLE albuns(
     album_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
     nome VARCHAR(255) NOT NULL,
     artista_id INT NOT NULL,
     ano_lancamento YEAR NOT NULL,
     FOREIGN KEY (artista_id) REFERENCES artistas(artista_id)
) engine = InnoDB;
INSERT
  INTO
  albuns (album_id, nome, artista_id, ano_lancamento)
VALUES
  ('Renaissance', '1', '2022'),
  ('Jazz', '2', '1978'),
  ('Hot Space', '2', '1982'),
  ('Falso Brilhante', '3', '1998'),
  ('Vento de Maio', '3', '2001'),
  ('QVVJFA?', '4', '2003'),
  ('Somewhere Far Beyond', '5', '2007'),
  ('I Put A Spell On You', '6', '2012');

CREATE TABLE musicas(
     musica_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
     nome VARCHAR(255) NOT NULL,
     duracao TIME NOT NULL,
     album_id INT NOT NULL,
     FOREIGN KEY (album_id) REFERENCES albuns(album_id)
) engine = InnoDB;
INSERT
  INTO
  musicas (musica_id, nome, duracao, album_id)
VALUES
  ("BREAK MY SOUL", 279, 1),
  ("VIRGO'S GROOVE", 369, 1),
  ("ALIEN SUPERSTAR", 116, 1),
  ("Don't Stop Me Now", 203, 2),
  ("Under Pressure", 152, 3),
  ("Como Nossos Pais", 105, 4),
  ("O Medo de Amar é o Medo de Ser Livre", 207, 5),
  ("Samba em Paris", 267, 6),
  ("The Bard's Song", 244, 7),
  ("Feeling Good", 100, 8);

CREATE TABLE hist-de-reproducao(
     pessoa_usuaria_id INT NOT NULL,
     musica_id INT NOT NULL,
     data_reproducao DATE NOT NULL,
     PRIMARY KEY (pessoa_usuaria_id, musica_id),
     FOREIGN KEY (pessoa_usuaria_id) REFERENCES pessoas_usuarias(pessoa_usuaria_id),
     FOREIGN KEY (musica_id) REFERENCES musicas(musica_id)
) engine = InnoDB;
INSERT
  INTO
  hist-de-reproducao (pessoa_usuaria_id, musica_id, data_reproducao)
VALUES
  (1, 8, '2022-02-28 10:45:55'),
  (1, 2, '2020-05-02 05:30:35'),
  (1, 10, '2020-03-06 11:22:33'),
  (2, 10, '2022-08-05 08:05:17'),
  (2, 7, '2020-01-02 07:40:33'),
  (3, 10, '2020-11-13 16:55:13'),
  (3, 2, '2020-12-05 18:38:30'),
  (4, 8, '2021-08-15 17:10:10'),
  (5, 8, '2022-01-09 01:44:33'),
  (5, 5, '2020-08-06 15:23:43'),
  (6, 7, '2017-01-24 00:31:17'),
  (6, 1, '2017-10-12 12:35:20'),
  (7, 4, '2011-12-15 22:30:49'),
  (8, 4, '2012-03-17 14:56:41'),
  (9, 9, '2022-02-24 21:14:22'),
  (10, 3, '2015-12-13 08:30:22');
