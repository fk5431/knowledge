DROP TABLE if EXISTS discuss;
CREATE TABLE discuss(
  id int(11) PRIMARY KEY AUTO_INCREMENT,
  newsId int(11) NOT NULL ,
  userId int(11) NOT NULL ,
  time DATE ,
  userName VARCHAR(255) not NULL ,
  content VARCHAR(255) not NULL
) DEFAULT CHARSET=utf8;