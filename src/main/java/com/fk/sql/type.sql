DROP TABLE IF EXISTS type;
CREATE TABLE type(
  id int(11) PRIMARY key not NULL AUTO_INCREMENT,
  type varchar(255) default NULL,
  count int(11) DEFAULT 0
)DEFAULT CHARSET=utf8;
INSERT INTO type VALUES (1,'户外', 0);
INSERT INTO type VALUES (2,'文化', 0);
INSERT INTO type VALUES (3,'数据报告', 0);
INSERT INTO type VALUES (4,'美食', 0);
INSERT INTO type VALUES (5,'购物', 0);
INSERT INTO type VALUES (6,'特别策划', 0);
INSERT INTO type VALUES (7,'节庆', 0);
INSERT INTO type VALUES (8,'自驾', 0);
INSERT INTO type VALUES (9,'必备', 0);
INSERT INTO type VALUES (10,'观赏', 0);
INSERT INTO type VALUES (11,'周边', 0);
INSERT INTO type VALUES (12,'摄影', 0);
INSERT INTO type VALUES (13,'旅行主义', 0);
INSERT INTO type VALUES (14,'建筑', 0);
INSERT INTO type VALUES (15,'家庭', 0);
INSERT INTO type VALUES (16,'星旅行', 0);
INSERT INTO type VALUES (17,'滑雪', 0);
INSERT INTO type VALUES (18,'登山', 0);
