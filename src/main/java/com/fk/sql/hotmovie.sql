DROP TABLE IF EXISTS hotmovie;
CREATE TABLE hotmovie(
  id INT(11) PRIMARY KEY AUTO_INCREMENT,
  count INT(11) NOT NULL,
  movieid INT(11) not null,
  FOREIGN KEY(id) REFERENCES movie(id)
)DEFAULT CHARSET=utf8;

INSERT INTO hotmovie VALUES(1,8,1);
INSERT INTO hotmovie VALUES(2,8,2);
INSERT INTO hotmovie VALUES(3,8,3);
INSERT INTO hotmovie VALUES(4,8,4);
INSERT INTO hotmovie VALUES(5,8,5);
INSERT INTO hotmovie VALUES(6,8,6);
INSERT INTO hotmovie VALUES(7,8,7);
INSERT INTO hotmovie VALUES(8,8,8);