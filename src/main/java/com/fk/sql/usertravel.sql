 DROP TABLE IF EXISTS usertravel;
 CREATE TABLE usertravel(
  id int(11) PRIMARY key not NULL AUTO_INCREMENT,
  userId int(11) not NULL ,
  travelId int(11) not NULL ,
  status  int(2) not NULL
)DEFAULT CHARSET=utf8;