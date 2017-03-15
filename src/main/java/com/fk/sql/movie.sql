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
    scorenum INT(11) DEFAULT 0,
    boxoffice INT(11) DEFAULT 0,
    introduce text not NULL,
    directorId INT(11) NOT NULL,
    performerIds VARCHAR(255) NOT NULL,
    prizeIds VARCHAR(255) NOT NULL,
    image VARCHAR(255) NOT NULL,
    atlas text NOT NULL,
    FOREIGN KEY(directorId) REFERENCES director(id)
)DEFAULT CHARSET=utf8;

INSERT INTO movie VALUES (1, '一条狗的使命','A Dog''s Purpose','4!=end=!2','美国', '101分钟', '2017-03-03', 0, 9.2,3980,'',1,'','','/movie/image/hot/h1.jpg','');
INSERT INTO movie VALUES (2, '金刚狼3：殊死一战','Wolverine: Logan','8!=end=!11!=end=!7','美国', '123分钟 ', '2017-03-03', 0, 8.8,30,'',1,'','','/movie/image/hot/h2.jpg','');
INSERT INTO movie VALUES (3, '美女与野兽','Beauty and the Beast','1!=end=!13!=end=!22','美国', '101分钟', '2017-03-017', 0, 0,0,'',1,'','','/movie/image/hot/h3.jpg','');
INSERT INTO movie VALUES (4, '生化危机：终章','Resident Evil: The Final Chapter','6!=end=!7','美国', '99分钟', '2017-02-24', 0, 9.6,10,'',1,'','','/movie/image/hot/h4.jpg','');
INSERT INTO movie VALUES (5, '金刚：骷髅岛','Kong: Skull Island','1!=end=!8','美国', '119分钟 ', '2017-03-24', 0, 0,0,'',1,'','','/movie/image/hot/h5.jpg','');
INSERT INTO movie VALUES (6, '最终幻想15：王者之剑','Kingsglaive Final Fantasy XV','4!=end=!2','美国', '116分钟', '2017-03-10', 0, 8.0,23,'',1,'','','/movie/image/hot/h6.jpg','');
INSERT INTO movie VALUES (7, '天才捕手','Genius','4','英国', '101分钟', '2017-03-10', 0, 8.2,25,'',1,'','','/movie/image/hot/h7.jpg','');
INSERT INTO movie VALUES (8, '碟仙诡谭2','Death Ouija 2','6!=end=!9','美国', '86分钟 ', '2017-03-10', 0, 4.0,830,'',1,'','','/movie/image/hot/h8.jpg','');

INSERT INTO movie VALUES (9, '通灵姐妹','Haunted Sisters','6!=end=!5','中国', '89分钟', '2017-03-19', 780, 0,0,'',1,'','','/movie/image/coming/3.jpg','');
INSERT INTO movie VALUES (10, '追击','Pursuit','7!=end=!10','爱尔兰', '96分钟', '2017-03-17', 70, 0,0,'',1,'','','/movie/image/coming/4.jpg','');
INSERT INTO movie VALUES (11, '走出尘埃','Pursuit','4','中国', '90分钟', '2017-03-17', 90, 0,0,'',1,'','','/movie/image/coming/5.png','');
INSERT INTO movie VALUES (12, '滚出来，凶手','Come On Murderer：The Legendary Thief...','1!=end=!2!=end=!9','中国', '90分钟', '2017-03-17', 55, 0,0,'',1,'','','/movie/image/coming/6.jpg','');
INSERT INTO movie VALUES (13, '二宝闯江湖','A Story of Two Wanderers','4','中国大陆', '93分钟', '2017-03-23', 65, 0,0,'',1,'','','/movie/image/coming/8.jpg','');
INSERT INTO movie VALUES (14, '唤爱','The call of love','4','中国大陆', '90分钟', '2017-03-23', 10, 0,0,'',1,'','','/movie/image/coming/7.jpg','');

UPDATE movie set introduce = '影片讲述了一条狗经历多次重生，在一次次生命的轮回中寻找不同的使命，最后又回到了最初的主人身边的故事。一个温顺可爱的狗狗贝利与主人意外的相遇开始了主人和汪星人的四世宠物情缘。贝利在成长过程中，帮助主人找到人生的伴侣，在危难之际拯救全家人的生命，到之后化身警犬破案，狗狗为主人奉献了自己的全部...' where id = 1;
UPDATE movie set introduce = '故事将发生在很久很久之后的未来世界，与现行的X战警宇宙相隔甚远。迈入暮年的金刚狼（休·杰克曼 饰）渐渐失去了体内的自愈因子。当一个与他能力相似的变种人女孩劳拉（达芙妮·基恩 饰）出现，小姑娘也能伸出与金刚狼一样的钢爪。X教授便请狼叔出山保护劳拉，阻止生化人杀手Reavers组织绑架劳拉的计划。' where id = 2;
UPDATE movie set introduce = '在很久以前，一位冷酷高傲、养尊处优的王子，独居在一座金碧辉煌的宏伟城堡里。一日，他及整座城堡被女巫施设了魔咒，英俊的王子瞬间变成了可怕的野兽（丹·史蒂文斯 饰），而他的仆从也都变成了各式的家具。若要解除魔咒，他唯有在最后一瓣玫瑰凋落之前收获真爱。对生活满怀幻想，独立勇敢且善解人意的女孩贝儿（艾玛·沃森 饰），为寻找父亲而推开了陌生城堡的大门，为拯救父亲的她甘愿留在城堡。在朝夕相处中彼此了解加深的他们渐生情愫，自私无情的野兽更渐渐被勤奋善良的贝儿所打动，但一次意外却令野兽的性命危在旦夕。贝儿会是那个破解魔咒的女孩吗？' where id = 3;
UPDATE movie set introduce = '爱丽丝（米拉·乔沃维奇 饰）在华盛顿特区被威斯克背叛后身陷险境，人类几乎要失去最后的希望。作为唯一的幸存者，也是人类对抗僵尸大军的最后防线，爱丽丝必须回到噩梦开始的地方：浣熊市，才能完成拯救世界救赎人类的正义使命。女神回归故事发生的起点浣熊市，和昔日的朋友一起对抗僵尸和最新变种怪物，与保护伞公司展开了一场惊心动魄的终极决战' where id = 4;
UPDATE movie set introduce = '上世纪70年代，一支集结了科考队员、探险家、战地摄影记者、军人的探险队，冒险前往南太平洋上的神秘岛屿——骷髅岛。他们的到来惊扰了岛上之神——史上最大金刚。经过一番惨烈的激战之后，探险队员散落在了岛屿各处。此时，队员们才意识到这次探险并不是一次单纯的科考任务，而是去探索怪兽存在的证明。在这片与世隔绝、危险密布的丛林，无数怪异的史前生物暗藏其中，时刻威胁着他们的生命。队员们还遇到了神秘的原始部落，金刚的身世和其守护岛屿的原因也被逐渐揭开，原来，恐怖阴森的骷髅岛上还蛰伏着更凶狠残暴的怪兽……' where id = 5;
UPDATE movie set introduce = '魔法王国路西斯是神圣水晶之乡，而凭借机械技术获得强大军事实力的尼夫海姆帝国来势汹汹，不择手段想要夺取水晶。两国之间展开了旷日持久的战争。113代路西斯国王雷吉斯集结了一批战斗能力出众的移民,组建起直属国王的特殊部队“王者之剑”。王者之剑的战士们借用路西斯国王代代传承的魔法参与到国家同尼夫海姆的激战中。但是在尼夫海姆压倒性的军事力量面前，雷吉斯国王不得不接受了议和：割让除王都外的所有土地，同时,王子诺克提斯要迎娶隶属帝国的戴涅布莱国前公主露娜弗蕾亚。不料这次议和都是尼夫海姆的阴谋，王都因索尼亚变成了战场，尼克斯被迫卷入了这场关乎王国生死存亡的斗争中。' where id = 6;
UPDATE movie set introduce = '本片讲述了了美国大作家托马斯·沃尔夫与他的图书编辑麦克斯·珀金斯之间的友谊。上世纪20年代末，默默无闻的托马斯·沃尔夫（裘德·洛 饰）怀揣文学梦来到纽约，而他冗长的自传体小说被曾一手发掘过菲兹杰拉德、海明威等作家的文学编辑麦克斯·珀金斯（科林·费尔斯 饰）看中。珀金斯大刀阔斧地为沃尔夫删减文章篇幅，最后该书出版时大获成功，沃尔夫也成为了文学界新星，而这本书正是他流传后世的著名小说《天使，望故乡》。在此之后，珀金斯和沃尔夫更加紧密地合作，但他们的亲近引起了沃尔夫女友（妮可·基德曼 饰）的嫉妒。在沃尔夫第二本小说的即将面世之时，三人之间关系却愈发微妙。一边是发掘自己的伯乐，一边是相处多年的女友，他将如何抉择…' where id = 7;
UPDATE movie set introduce = '在一处荒僻隐秘的奢华娱乐会所里，一场同学毕业聚会正在进行。乔巧（张韶涵 饰）与关辛（方力申 饰）无意中发现了一套碟仙器具，为寻刺激众人一起玩碟仙。当他们提出的问题被碟仙一一言中时，厄运接连降临，妖魔化影鬼怪哭声，建筑被整个封锁，其中几人接连离奇的死亡。此时活下来的人才发现，这座会所是按照酷刑炼狱的场景布置陈设的，而他们也被困在了这座“人间地狱”里。人人自危的情景下，埋藏在彼此之间的矛盾也在此刻爆发。乔巧与关辛的爱情也面临着生与死的双重考验。' where id = 8;
UPDATE movie set introduce = '女子安宁（张蓝艺 饰），丈夫早逝，带着女儿独自居住。有一天夜晚，家中停电，一名带着面具的男子侵入房间，欲非礼安宁，安宁拼死反抗，面具男子惊慌逃窜，却在过程中将点燃的蜡烛推倒，导致失火，安宁的女儿不幸丧生火海，失去孩子的安宁悲痛欲绝，由于线索缺失，凶手未能抓捕归案。安宁的闺蜜赵敏（刘洛汐 饰）在得知她遭遇了不幸之后，便邀请安宁到自己家中小住一段时间，希望帮助她排遣忧伤痛苦。令人意想不到的是，随着安宁的到来，原本安静和谐的家庭变得异常诡异……' where id = 9;
UPDATE movie set introduce = '格萝妮娅（露丝·布莱德利 饰）是作恶多端的黑帮老大的女儿，被父亲安排进入娱乐圈当明星，无奈星路失败，过着行尸走肉般的生活。父亲为了在激烈的帮派斗争中巩固自己的黑帮地位，自作主张将女儿嫁给自己最大的威胁对象菲奥纳（利亚姆·坎宁安 饰），不料女儿却有一个疯狂的计划。' where id = 10;
UPDATE movie set introduce = '本片讲述的是一个迷茫的男人重新找回自己的故事。一位曾经的摇滚歌手，二十年后是一位普通的代驾司机，这个曾经的摇滚青年身上已看不出丝毫当年的激情，他如同现实中大多数同龄人一样，深陷忙碌见招拆招的生活。生活的轨道在不可预知的拐点发生了不可控制的变化，且事情的发展，远远超乎他的想象……' where id = 11;
UPDATE movie set introduce = '本片依托经典古装探案题材的爱情讽刺喜剧，它讲述了北宋年间，来自讼师世家既逗逼贱萌、又天赋异禀的讼师段岚，联合武功高强的正义女捕快欧阳飞雪，探破层层假象、最终侦破离奇命案，吊打各式渣男的欢乐故事。' where id = 12;
UPDATE movie set introduce = '大宝（女）和小宝（男）是一对情侣，两人爱慕虚荣、好吃懒做，整天异想天开、梦想不劳而获。小宝对大宝言听计从、马首是瞻。大宝决定利用诈骗手段来闯荡所谓的江湖。一笨一傻两个活宝先是利用街头诈骗手段来行骗，没想到遭遇惨痛失败，在骗子江湖中留下千古笑话。两人痛定思痛，找到“骗无形”学习了新型电信网络诈骗手段再次开始行骗，在搞笑无厘头的剧情中二宝不断地变换升级诈骗手段，有成功有失败，最终还是自食其果落入法网。' where id = 13;
UPDATE movie set introduce = '大宝（女）和小宝（男）是一对情侣，两人爱慕虚荣、好吃懒做，整天异想天开、梦想不劳而获。小宝对大宝言听计从、马首是瞻。大宝决定利用诈骗手段来闯荡所谓的江湖。一笨一傻两个活宝先是利用街头诈骗手段来行骗，没想到遭遇惨痛失败，在骗子江湖中留下千古笑话。两人痛定思痛，找到“骗无形”学习了新型电信网络诈骗手段再次开始行骗，在搞笑无厘头的剧情中二宝不断地变换升级诈骗手段，有成功有失败，最终还是自食其果落入法网。' where id = 13;

UPDATE movie set performerIds = '1!=end=!2!=end=!3!=end=!4';

UPDATE movie set atlas = '/movie/image/movie/1/1.jpeg!=end=!/movie/image/movie/1/2.jpeg!=end=!/movie/image/movie/1/3.jpeg!=end=!/movie/image/movie/1/4.jpeg!=end=!/movie/image/movie/1/5.jpeg';

ALTER TABLE movie ADD COLUMN scorenum INT(11) DEFAULT 0;