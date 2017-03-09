 DROP TABLE IF EXISTS continent;
CREATE TABLE continent(
  id int(11) PRIMARY key not NULL AUTO_INCREMENT,
  continent varchar(40) default NULL,
  count int(11) DEFAULT 0
)DEFAULT CHARSET=utf8;
INSERT INTO continent VALUES (1,'欧洲', 0);
INSERT INTO continent VALUES (2,'东南亚', 0);
INSERT INTO continent VALUES (3,'北美', 0);
INSERT INTO continent VALUES (4,'东亚', 0);
INSERT INTO continent VALUES (5,'大洋洲', 0);
INSERT INTO continent VALUES (6,'南亚', 0);
INSERT INTO continent VALUES (7,'非洲', 0);
INSERT INTO continent VALUES (8,'西亚', 0);
INSERT INTO continent VALUES (9,'南美', 0);
INSERT INTO continent VALUES (10,'南极洲', 0);
