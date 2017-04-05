DROP TABLE IF EXISTS record;

CREATE TABLE record(
  id int(11) PRIMARY key NOT NULL auto_increment,
  name VARCHAR(255) NOT NULL,
  price VARCHAR(255) NOT NULL,
  num int(11) NOT NULL,
  time DATE,
  type VARCHAR (255) not null,
  orderId int(11) NOT NULL,
  email VARCHAR(255) ,
  wechat VARCHAR(255),
  mob VARCHAR(255),
  other VARCHAR(255),
  userId int(11),
  adress VARCHAR(255),
  FOREIGN KEY(orderId) REFERENCES orders(id)
) DEFAULT CHARSET=utf8;
