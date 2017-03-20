DROP TABLE IF EXISTS type;
CREATE TABLE type(
  id INT(11) PRIMARY KEY AUTO_INCREMENT,
  typename VARCHAR(255) NOT NULL
)DEFAULT CHARSET=utf8;
INSERT INTO type(id, typename) VALUES(0, '全部');
INSERT INTO type(typename) VALUES( '爱情');
INSERT INTO type(typename) VALUES( '喜剧');
INSERT INTO type(typename) VALUES( '动画');
INSERT INTO type(typename) VALUES( '剧情');
INSERT INTO type(typename) VALUES( '恐怖');
INSERT INTO type(typename) VALUES('惊悚');
INSERT INTO type(typename) VALUES( '科幻');
INSERT INTO type(typename) VALUES( '动作');
INSERT INTO type(typename) VALUES( '悬疑');
INSERT INTO type(typename) VALUES( '犯罪');
INSERT INTO type(typename) VALUES( '冒险');
INSERT INTO type(typename) VALUES( '战争');
INSERT INTO type(typename) VALUES( '奇幻');
INSERT INTO type(typename) VALUES( '运动');
INSERT INTO type(typename) VALUES( '家庭');
INSERT INTO type(typename) VALUES( '古装');
INSERT INTO type(typename) VALUES( '武侠');
INSERT INTO type(typename) VALUES( '西部');
INSERT INTO type(typename) VALUES( '历史');
INSERT INTO type(typename) VALUES( '传记');
INSERT INTO type(typename) VALUES( '情色');
INSERT INTO type(typename) VALUES( '歌舞');
INSERT INTO type(typename) VALUES( '黑色电影');
INSERT INTO type(typename) VALUES( '短片');
INSERT INTO type(typename) VALUES( '纪录片');
INSERT INTO type(typename) VALUES( '其他');

UPDATE type SET id = 0 where id = 27

UPDATE type SET typename = '演唱会' where id = 1;
UPDATE type SET typename = '话剧' where id = 2;
UPDATE type SET typename = '音乐会' where id = 3;
UPDATE type SET typename = '舞蹈表演' where id = 4;
UPDATE type SET typename = '戏剧' where id = 5;
UPDATE type SET typename = '儿童亲子' where id = 6;

