 DROP TABLE IF EXISTS indexshow;
 CREATE TABLE indexshow(
  id int(11) PRIMARY key not NULL AUTO_INCREMENT,
  mid int(11),
  FOREIGN KEY(mid) REFERENCES traveltips(id)
)DEFAULT CHARSET=utf8;
