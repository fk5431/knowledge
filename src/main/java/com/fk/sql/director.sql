DROP TABLE IF EXISTS director;
CREATE TABLE director(
  id INT(11) PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(255) NOT  NULL ,
  ename VARCHAR(255) NOT  NULL ,
  birth DATE ,
  fan INT(11) DEFAULT 0,
  boxoffice DOUBLE DEFAULT 0,
  works VARCHAR(255) NOT  NULL ,
  introduce VARCHAR(255) NOT  NULL ,
  birthplace VARCHAR(255) NOT  NULL ,
  sex VARCHAR(255) NOT  NULL ,
  constellation VARCHAR(255) NOT  NULL ,
  prizeIds  VARCHAR(255)
)DEFAULT CHARSET=utf8;
INSERT INTO director VALUES (1,'','','1956-05-25',0,0,'','','','','','');