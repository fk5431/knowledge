 DROP TABLE IF EXISTS rule;
 CREATE TABLE rule(
  ruleid int(11) PRIMARY key not NULL AUTO_INCREMENT,
  uid int(11) not NULL ,
  rulename VARCHAR(255) NOT NULL ,
  introduction VARCHAR(255) NOT NULL
)DEFAULT CHARSET=utf8;
