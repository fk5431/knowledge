DROP TABLE IF EXISTS news;
CREATE TABLE news(
  id INT(11) PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(255) NOT  NULL ,
  time DATE ,
  count INT(11) DEFAULT 0,
  image VARCHAR(255) NOT  NULL ,
  content text NOT  NULL
)DEFAULT CHARSET=utf8;
INSERT INTO news VALUES(1,'专访《最终幻想》导演野末武志：成龙的电影不也很中二嘛','2017-03-09 19:04:05',0,'/movie/image/1.jpg','');
INSERT INTO news VALUES(2,'《生化危机》电影怪兽图鉴，想把最后一只抱回家养','2017-02-23 21:04:05',0,'/movie/image/2.jpg','');
INSERT INTO news VALUES(3,'《金刚：骷髅岛》 孤岛惊魂预告展现史上最残酷生物链','2017-03-14 13:24:05',0,'/movie/image/3.jpg','');
INSERT INTO news VALUES(4,'专访林宥嘉：如果有机会演电影想做个禁欲系变种人！','2017-03-02 18:04:05',0,'/movie/image/4.jpg','');
UPDATE news SEt image = '/movie/image/1.jpg' where id = 1;
UPDATE news SEt image = '/movie/image/2.jpg' where id = 2;
UPDATE news SEt image = '/movie/image/3.jpg' where id = 3;
UPDATE news SEt image = '/movie/image/4.jpg' where id = 4;
