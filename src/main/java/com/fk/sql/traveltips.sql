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
INSERT INTO traveltips(id, time, place, image, title, context, type, author, line) VALUES(1, '2017-02-21 10:11:00','摩洛哥','${pageContext.request.contextPath}/images/index_1.jpeg','宝贝，妈妈带你去撒哈拉','context','type','贩暖','line');

UPDATE traveltips SET image='/images/index_1.jpeg';

INSERT INTO traveltips(id, time, place, image, title, context, type, author, line) VALUES(2, '2017-02-22 10:11:00','武功山','/images/index_2.jpeg','【围城随笔】之2017跨年武功山全线重装穿越','context','type','在远方的阿伦','line');
INSERT INTO traveltips(id, time, place, image, title, context, type, author, line) VALUES(3, '2017-02-23 10:11:00','贝加尔湖','/images/index_3.jpeg','放弃了万千烟火，只为那一眼明眸——贝加尔湖蓝冰之旅','context','type','逐风','line');
INSERT INTO traveltips(id, time, place, image, title, context, type, author, line) VALUES(4, '2017-02-24 10:11:00','斯里兰卡','/images/index_4.jpeg','走到世界的尽头，依然和你手牵手','context','type','小雪儿','line');
INSERT INTO traveltips(id, time, place, image, title, context, type, author, line) VALUES(5, '2017-02-25 10:11:00','乌兰布统','/images/index_5.jpeg','冬季牧歌——雪原深处，见之不忘，思之如狂','context','type','昕小阳','line');
