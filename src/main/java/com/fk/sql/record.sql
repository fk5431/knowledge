DROP TABLE IF EXISTS record;

CREATE TABLE record(
  id int(11) PRIMARY key NOT NULL auto_increment,
  name VARCHAR(255) NOT NULL,
  price VARCHAR(255) NOT NULL,
  num int(11) NOT NULL,
  time DATE,
  type VARCHAR (255) not null,
  orderId int(11) NOT NULL,
  FOREIGN KEY(orderId) REFERENCES orders(id)
) DEFAULT CHARSET=utf8;
INSERT INTO record VALUES(1,'冯凯', '888', 1, '2017-03-10 10:11:00', '6天5晚半自由行', 1);
