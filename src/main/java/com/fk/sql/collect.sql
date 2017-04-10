DROP TABLE IF EXISTS collect;
CREATE TABLE collect(
  id INT(11) PRIMARY KEY AUTO_INCREMENT,
  userId INT(11) NOT NULL,
  movieid INT(11) not null,
  movietitle VARCHAR(255) NOT NULL ,
  image VARCHAR(255) NOT NULL ,
  score DOUBLE DEFAULT 0,
  introduce text not NULL,
  time VARCHAR(255) NOT NULL,
  status VARCHAR(255) DEFAULT 1
)DEFAULT CHARSET=utf8;
