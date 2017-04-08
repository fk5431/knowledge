drop TABLE if EXISTS liketravel;
CREATE TABLE liketravel(
  id int(11) PRIMARY key not NULL AUTO_INCREMENT,
  travelId int(11) not NULL ,
  userId int(11) not NULL
)DEFAULT CHARSET=utf8;