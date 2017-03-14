DROP TABLE IF EXISTS indexshow;
CREATE TABLE indexshow(
  id INT(11) PRIMARY KEY AUTO_INCREMENT,
  mid INT(11) NOT NULL ,
  FOREIGN KEY(mid) REFERENCES news(id)
)DEFAULT CHARSET=utf8;
insert into indexshow values(1,1);
insert into indexshow values(2,2);
insert into indexshow values(3,3);
insert into indexshow values(4,4);