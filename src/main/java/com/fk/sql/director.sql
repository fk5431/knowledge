DROP TABLE IF EXISTS director;
CREATE TABLE director(
  id INT(11) PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(255) NOT  NULL ,
  ename VARCHAR(255) NOT  NULL ,
  othername VARCHAR(255) NOT NULL ,
  birth DATE ,
  fan INT(11) DEFAULT 0,
  boxoffice DOUBLE DEFAULT 0,
  works VARCHAR(255) NOT  NULL ,
  introduce VARCHAR(255) NOT  NULL ,
  birthplace VARCHAR(255) NOT  NULL ,
  nationality VARCHAR(255) NOT  NULL ,
  sex VARCHAR(255) NOT  NULL ,
  constellation VARCHAR(255) NOT  NULL ,
  height VARCHAR(255) NOT  NULL ,
  image VARCHAR(255) NOT  NULL ,
  images VARCHAR(255) NOT  NULL ,
  prizeIds  VARCHAR(255)
)DEFAULT CHARSET=utf8;
INSERT INTO director VALUES (1,'','','1956-05-25',0,0,'','','','','','');

UPDATE director SET name= '拉斯·霍尔斯道姆';
UPDATE director SET ename= 'Lasse Hallström';
UPDATE director SET birth= '1946-06-02';
UPDATE director SET fan= 49;
UPDATE director SET works= '1!=end=!2';
UPDATE director SET introduce= '拉斯·霍尔斯道姆，莱塞·霍尔斯道姆，瑞典电影导演。曾因电影《狗脸的岁月》和《苹果酒屋的法则》获得奥斯卡最佳导演奖提名。霍尔斯道姆生于瑞典斯德哥尔摩，父亲是牙医，母亲是瑞典作家KarinLyberg(1907–2000)。外祖父ErnstLyberg曾任瑞典财政部长。他一开始的职业是拍MV，尤其是为ABBA工作。《狗脸的岁月》大获成功后，他进军好莱坞。他在美国首部获得成功的电影是《不一样的天空》（1993）。1999年他的影片《苹果酒屋的法则》获奥斯卡最佳导演奖和最佳影片奖提名，他的声望达到了顶峰。';
UPDATE director SET birthplace= '瑞典斯德哥尔摩';
UPDATE director SET constellation= '双子座';
UPDATE director SET sex= '男';

UPDATE director SET othername= 'Lars Hallström';
UPDATE director SET nationality= '瑞典';
UPDATE director SET height= '184cm';
UPDATE director SET images= '/movie/image/director/1.jpeg!=end=!/movie/image/director/2.jpeg';
UPDATE director SET image= '/movie/image/director/3.jpeg';

alter table director add column image VARCHAR(255) not null;
