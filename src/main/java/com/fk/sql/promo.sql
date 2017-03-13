 DROP TABLE IF EXISTS promo;
CREATE TABLE promo(
  id int(11) PRIMARY key not NULL AUTO_INCREMENT,
  title1 varchar(255) default NULL,
  title2 varchar(255) default NULL,
  orders varchar(255) default NULL
)DEFAULT CHARSET=utf8;
INSERT INTO promo VALUES (1,'每日特价','特价好货抢不停！', '1!=end=!21=end=!3');
