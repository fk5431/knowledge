 DROP TABLE IF EXISTS traveltips;
 CREATE TABLE traveltips(
  id int(11) PRIMARY key not NULL AUTO_INCREMENT,
  time DATE ,
  place VARCHAR(255) not NULL ,
  image VARCHAR(255) NOT NULL,
  smallimage VARCHAR(255),
  title VARCHAR(255) NOT NULL,
  context VARCHAR(255) NOT NULL,
  type VARCHAR(255) NOT NULL,
  author VARCHAR(255) NOT NULL,
  line VARCHAR(255) NOT NULL
)DEFAULT CHARSET=utf8;
INSERT INTO traveltips(id, time, place, image, title, context, type, author, line) VALUES(1, '2017-02-27 10:11:00','place','image','title','context','type','author','line');
