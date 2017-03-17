 DROP TABLE IF EXISTS shopshow;
 CREATE TABLE shopshow(
  id int(11) PRIMARY key not NULL AUTO_INCREMENT,
  mid int(11),
  FOREIGN KEY(mid) REFERENCES orders(id)
)DEFAULT CHARSET=utf8;
INSERT INTO shopshow(id, mid) VALUES (1,1);
INSERT INTO shopshow(id, mid) VALUES (2,2);
INSERT INTO shopshow(id, mid) VALUES (3,3);
INSERT INTO shopshow(id, mid) VALUES (4,4);
