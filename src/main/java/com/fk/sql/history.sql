DROP TABLE IF EXISTS history;
CREATE TABLE history(
  id INT(11) PRIMARY KEY AUTO_INCREMENT,
  userId INT(11) NOT NULL,
  movieid INT(11) not null,
  movietitle VARCHAR(255) NOT NULL ,
  image VARCHAR(255) NOT NULL ,
  score DOUBLE DEFAULT 0,
  introduce text not NULL,
  time VARCHAR(255) NOT NULL
)DEFAULT CHARSET=utf8;
