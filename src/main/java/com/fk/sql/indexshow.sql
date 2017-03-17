 DROP TABLE IF EXISTS indexshow;
 CREATE TABLE indexshow(
  id int(11) PRIMARY key not NULL AUTO_INCREMENT,
  mid int(11),
  FOREIGN KEY(mid) REFERENCES traveltips(id)
)DEFAULT CHARSET=utf8;
INSERT INTO indexshow(id, mid) VALUES (1,1);
INSERT INTO indexshow(id, mid) VALUES (2,2);
INSERT INTO indexshow(id, mid) VALUES (3,3);
INSERT INTO indexshow(id, mid) VALUES (4,4);
INSERT INTO indexshow(id, mid) VALUES (5,5);



第六个是目的地的那个啊啊啊啊切记
INSERT INTO indexshow(id, mid) VALUES (6,8);