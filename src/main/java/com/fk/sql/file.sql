 DROP TABLE IF EXISTS file;
 CREATE TABLE file(
  fid int(11) PRIMARY key not NULL AUTO_INCREMENT,
  uid int(11) NOT NULL ,
  fname VARCHAR (255) NOT NULL ,
  uuidname VARCHAR (255) NOT NULL ,
  title VARCHAR (255) NOT NULL ,
  tags VARCHAR (255) NOT NULL ,
  ftypeid int(11) NOT NULL ,
  uploadtime DATE NOT NULL ,
  abstract VARCHAR (255) NOT NULL ,
  introduction text NOT NULL ,
  url VARCHAR (255) NOT NULL ,
  url_image VARCHAR (255) NOT NULL ,
  ktypeid int(11) NOT NULL ,
  url_transforms VARCHAR(255) NOT NULL
)DEFAULT CHARSET=utf8;
