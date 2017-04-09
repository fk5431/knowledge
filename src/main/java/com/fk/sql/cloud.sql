 DROP TABLE IF EXISTS cloud;
 CREATE TABLE cloud(
  id int(11) PRIMARY key not NULL AUTO_INCREMENT,
  userId int(11) not NULL ,
  place VARCHAR(255) not null,
  count int(11) DEFAULT 0,
  status int(2) DEFAULT 0
)DEFAULT CHARSET=utf8;