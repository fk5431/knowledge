CREATE TABLE user(
  id int(11) PRIMARY key not NULL AUTO_INCREMENT,
  username VARCHAR(255) NOT NULL ,
  password VARCHAR(255) NOT NULL
)DEFAULT CHARSET=utf8;
INSERT INTO user(id, username, password) VALUES (1, 'test1', '123');