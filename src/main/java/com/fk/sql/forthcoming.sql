DROP TABLE IF EXISTS forthcoming;
CREATE TABLE forthcoming(
  id INT(11) PRIMARY KEY AUTO_INCREMENT,
  count INT(11) NOT NULL,
  movieid INT(11) not null,
  FOREIGN KEY(id)  REFERENCES movie(id)
)DEFAULT CHARSET=utf8;