DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE IF NOT EXISTS SpotifyClone;

USE SpotifyClone;

CREATE TABLE artistas (
    artista_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL
)  ENGINE=INNODB;

CREATE TABLE planos (
    plano_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    valor DECIMAL(10 , 2 ) NOT NULL
)  ENGINE=INNODB;

CREATE TABLE pessoas_usuarias (
    pessoa_usuaria_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    idade INT NOT NULL,
    data_assinatura DATE NOT NULL,
    plano_id INT NOT NULL,
    FOREIGN KEY (plano_id)
        REFERENCES planos (plano_id)
)  ENGINE=INNODB;

CREATE TABLE seguindo (
    artista_id INT NOT NULL,
    pessoa_usuaria_id INT NOT NULL,
    PRIMARY KEY (artista_id , pessoa_usuaria_id),
    FOREIGN KEY (pessoa_usuaria_id)
        REFERENCES pessoas_usuarias (pessoa_usuaria_id),
    FOREIGN KEY (artista_id)
        REFERENCES artistas (artista_id)
)  ENGINE=INNODB;

CREATE TABLE albuns (
    album_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    album VARCHAR(255) NOT NULL,
    artista_id INT NOT NULL,
    ano_lancamento YEAR NOT NULL,
    FOREIGN KEY (artista_id)
        REFERENCES artistas (artista_id)
)  ENGINE=INNODB;

CREATE TABLE musicas (
    musica_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    duracao INT NOT NULL,
    album_id INT NOT NULL,
    FOREIGN KEY (album_id)
        REFERENCES albuns (album_id)
)  ENGINE=INNODB;

CREATE TABLE hist_de_reproducao (
    musica_id INT NOT NULL,
    pessoa_usuaria_id INT NOT NULL,
    data_reproducao DATETIME NOT NULL,
    PRIMARY KEY (pessoa_usuaria_id , musica_id),
    FOREIGN KEY (pessoa_usuaria_id)
        REFERENCES pessoas_usuarias (pessoa_usuaria_id),
    FOREIGN KEY (musica_id)
        REFERENCES musicas (musica_id)
)  ENGINE=INNODB;
    
INSERT
  INTO
  artistas (nome)
VALUES
('Beyoncé'),
('Queen'),
('Elis Regina'),
('Baco Exu do Blues'),
('Blind Guardian'),
('Nina Simone');

INSERT
  INTO
  planos (nome, valor)
VALUES
  ('gratutito', 0.00),
  ('familiar', 7.99),
  ('universitario', 5.99),
  ('pessoal', 6.99);

INSERT
  INTO
  pessoas_usuarias (nome, idade, data_assinatura, plano_id)
VALUES
  ('Barbara Liskov', '82', '2019-10-20', '1'),
  ('Robert Cecil Martin', '58', '2017-01-06', '1'),
  ('Ada Lovelace', '37', '2017-12-30', '2'),
  ('Martin Fowler', '46', '2017-01-17', '2'),
  ('Sandi Metz', '58', '2018-04-29', '2'),
  ('Paulo Freire', '19', '2018-02-14', '3'),
  ('Bell Hooks', '26', '2018-01-05', '3'),
  ('Christopher Alexander', '85', '2019-06-05', '4'),
  ('Judith Butler', '45', '2020-05-13', '4'),
  ('Jorge Amado', '58', '2017-02-17', '4');

 INSERT
  INTO
  seguindo (artista_id, pessoa_usuaria_id)
VALUES
  ('1', '1'),
  ('2', '1'),
  ('3', '1'),
  ('1', '2'),
  ('3', '2'),
  ('2', '3'),

  ('4', '4'),
  ('5', '5'),
  ('6', '5'),
  ('6', '6'),
  ('1', '6'),
  ('6', '7'),
  ('3', '9'),
  ('2', '10');

INSERT
  INTO
  albuns (album, artista_id, ano_lancamento)
VALUES
  ('Renaissance', '1', '2022'),
  ('Jazz', '2', '1978'),
  ('Hot Space', '2', '1982'),
  ('Falso Brilhante', '3', '1998'),
  ('Vento de Maio', '3', '2001'),
  ('QVVJFA?', '4', '2003'),
  ('Somewhere Far Beyond', '5', '2007'),
  ('I Put A Spell On You', '6', '2012');

  INSERT
  INTO
  musicas (nome, duracao, album_id)
VALUES
  ("BREAK MY SOUL", '279', 1),
  ("VIRGO'S GROOVE", '369', 1),
  ("ALIEN SUPERSTAR", '116', 1),
  ("Don't Stop Me Now", '203', 2),
  ("Under Pressure", '152', 3),
  ("Como Nossos Pais", '105', 4),
  ("O Medo de Amar é o Medo de Ser Livre", '207', 5),
  ("Samba em Paris", '267', 6),
  ("The Bard's Song", '244', 7),
  ("Feeling Good", '100', 8);

INSERT
  INTO
  hist_de_reproducao (musica_id, pessoa_usuaria_id, data_reproducao)
VALUES
  (8, 1, '2022-02-28 10:45:55'),
  (2, 1, '2020-05-02 05:30:35'),
  (10, 1, '2020-03-06 11:22:33'),
  (10, 2, '2022-08-05 08:05:17'),
  (7, 2, '2020-01-02 07:40:33'),
  (10, 3, '2020-11-13 16:55:13'),
  (2, 3, '2020-12-05 18:38:30'),
  (8, 4, '2021-08-15 17:10:10'),
  (8, 5, '2022-01-09 01:44:33'),
  (5, 5, '2020-08-06 15:23:43'),
  (7, 6, '2017-01-24 00:31:17'),
  (1, 6, '2017-10-12 12:35:20'),
  (4, 7, '2011-12-15 22:30:49'),
  (4, 8, '2012-03-17 14:56:41'),
  (9, 9, '2022-02-24 21:14:22'),
  (3, 10, '2015-12-13 08:30:22');