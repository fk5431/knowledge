DROP TABLE IF EXISTS movie;
CREATE TABLE movie(
    id INT(11) PRIMARY KEY not NULL AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL ,
    etitle VARCHAR(255) NOT NULL ,
    type VARCHAR(255) NOT NULL,
    area VARCHAR(255) NOT NULL,
    time VARCHAR(255) NOT NULL,
    showtime DATE NOT NULL,
    lookcount INT(11) DEFAULT 0,
    score DOUBLE DEFAULT 0,
    boxoffice INT(11) DEFAULT 0,
    introduce text not NULL,
    directorId INT(11) NOT NULL,
    performerIds VARCHAR(255) NOT NULL,
    prizeIds VARCHAR(255) NOT NULL,
    image VARCHAR(255) NOT NULL,
    atlas text NOT NULL,
    FOREIGN KEY(directorId) REFERENCES director(id)
)DEFAULT CHARSET=utf8;

INSERT INTO movie VALUES (1, '一条狗的使命','A Dog''s Purpose','4!=end=!2','美国', '101分钟', '2017-03-03', 0, 9.2,3980,'',1,'','','/movie/image/h1.jpg','');
INSERT INTO movie VALUES (2, '金刚狼3：殊死一战','Wolverine: Logan','8!=end=!11!=end=!7','美国', '123分钟 ', '2017-03-03', 0, 8.8,30,'',1,'','','/movie/image/h2.jpg','');
INSERT INTO movie VALUES (3, '美女与野兽','Beauty and the Beast','1!=end=!13!=end=!22','美国', '101分钟', '2017-03-017', 0, 0,0,'',1,'','','/movie/image/h3.jpg','');
INSERT INTO movie VALUES (4, '生化危机：终章','Resident Evil: The Final Chapter','6!=end=!7','美国', '99分钟', '2017-02-24', 0, 9.6,10,'',1,'','','/movie/image/h4.jpg','');
INSERT INTO movie VALUES (5, '金刚：骷髅岛','Kong: Skull Island','1!=end=!8','美国', '119分钟 ', '2017-03-24', 0, 0,0,'',1,'','','/movie/image/h5.jpg','');
INSERT INTO movie VALUES (6, '最终幻想15：王者之剑','Kingsglaive Final Fantasy XV','4!=end=!2','美国', '116分钟', '2017-03-10', 0, 8.0,23,'',1,'','','/movie/image/h6.jpg','');
INSERT INTO movie VALUES (7, '天才捕手','Genius','4','英国', '101分钟', '2017-03-10', 0, 8.2,25,'',1,'','','/movie/image/h7.jpg','');
INSERT INTO movie VALUES (8, '碟仙诡谭2','Death Ouija 2','6!=end=!9','美国', '86分钟 ', '2017-03-10', 0, 4.0,830,'',1,'','','/movie/image/h8.jpg','');
INSERT INTO movie VALUES (9, '一条狗的使命','A Dog''s Purpose','4!=end=!2','美国', '101分钟', '2017-03-03', 0, 9.2,3980,'',1,'','','/movie/image/h1.jpg','');
INSERT INTO movie VALUES (10, '一条狗的使命','A Dog''s Purpose','4!=end=!2','美国', '101分钟', '2017-03-03', 0, 9.2,3980,'',1,'','','/movie/image/h1.jpg','');