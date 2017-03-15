DROP TABLE IF EXISTS performer;
CREATE TABLE performer(
  id INT(11) PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(255) NOT  NULL ,
  ename VARCHAR(255) NOT  NULL ,
  othername VARCHAR(255) NOT NULL ,
  birth DATE ,
  fan INT(11) DEFAULT 0,
  boxoffice DOUBLE DEFAULT 0,
  works VARCHAR(255) NOT  NULL ,
  introduce text ,
  birthplace VARCHAR(255) NOT  NULL ,
  nationality VARCHAR(255) NOT  NULL ,
  sex VARCHAR(255) NOT  NULL ,
  constellation VARCHAR(255) NOT  NULL ,
  height VARCHAR(255) NOT  NULL ,
  image VARCHAR(255) NOT  NULL ,
  images VARCHAR(255) NOT  NULL ,
  prizeIds  VARCHAR(255)
)DEFAULT CHARSET=utf8;

INSERT INTO performer VALUES (1, '布丽特·罗伯森','Britt Robertson','布丽特·罗伯森', '1990-04-18', 208,4.11,'1','布丽特·罗伯森，2000年出演连续剧处女作《Sheena》，开启演艺之路。2003年凭借电影处女作《The Ghost Club》获得青年艺人大奖电视电影或迷你剧最佳年轻女主角的提名。2008年在CBS连续剧《小镇春色》中首次担任常驻角色。2010年在连续剧《意想不到的生活》中首次担任主角。2012年主演爱情片《第一次》。2013年参演改编自斯蒂芬·金同名小说的连续剧《穹顶之下》。2015年主演科幻片《明日世界》和爱情片《最长的旅程》。2016年主演电影《一条狗的使命》和《世界之外》。',
'美国北卡罗莱那州夏洛特市','美国', '女', '白羊座', '160cm', '/movie/image/director/4.jpeg', '/movie/image/director/5.jpeg!=end=!/movie/image/director/6.jpeg','');
INSERT INTO performer VALUES (2, '布乔什·盖德','Josh Gad','乔什·盖德', '1971-02-23', 66,12.23,'1','乔什·盖德，阿富汗裔犹太人后裔。毕业于卡耐基梅隆大学。2009年开始成为喜剧中心每日秀当客席报道员。电影代表作有《爱情与灵药》《她要我了》《定制伴郎》等。同时活跃于配音界，曾为《冰雪奇缘》中的雪宝和《冰河世纪4》中的鼹鼠Louis配音，并凭借前者的精彩表现获得第41届动画安妮奖最佳配音奖。',
'美国弗罗里达州好莱坞','美国', '男', '双鱼座', '168cm', '/movie/image/director/7.jpeg', '/movie/image/director/8.jpeg!=end=!/movie/image/director/9.jpeg','');
INSERT INTO performer VALUES (3, '丹尼斯·奎德','Dennis Quaid','丹尼斯奎尔（台,港）,Dennis William', '1956-04-09', 29,5.49,'1','丹尼斯·奎德出生于美国德州休斯顿，父亲是一位电工。他在中学和大学期间学习戏剧，在哥哥兰迪的影响下，放弃学业跑到洛杉矶寻求发展。1979年，丹尼斯凭借自行车励志影片《突破》崭露头角。1983年，丹尼斯成功出演太空影片《太空英雄》，并获得业界一致好评。1987年他又拍了《大出意外》一片。虽然这些影片的票房一般，但丹尼斯的演技已被好莱坞认可。1987年他与女星梅格·瑞安在科幻片《零度空间》中合作。尽管1996年的《魔幻屠龙》使得丹尼斯的商业价值在一定程度上受到片商的肯定，但他还是未能走红。碌碌无为地度过了几年后，2000年人们又开始关注丹尼斯·奎德，因为他和梅格·瑞安的婚姻走到了尽头。和梅格·瑞安离婚之后，丹尼斯和梅格两个人的事业似乎来了个对调，原先一直蒸蒸日上梅格这两年表现平平。而丹尼斯却接连出演多部优秀影片，包括讲述父子真情的《黑洞频率》，奥斯卡大热片《毒品网络》，以及奥利弗·斯通的橄榄球影片《挑战星期天》。2002年，丹尼斯·奎德迎来事业的双丰收，独挑大梁的《棒球新秀》成为票房黑马，《远离天堂》则为他赢得了一座金球奖。之后又与莎朗·斯通合演《凶宅》。2004年他奉献了三部大制作影片《阿拉莫之战》、《后天》和《凤凰劫》。虽然出演的作品并非部部卖座，但近几年丹尼斯·奎德在大银幕上依然保持很高的曝光率，2009年他还与华人影星章子怡合作了恐怖片《骑士》。',
'美国德克萨斯州休斯顿市','美国', '男', '白羊座', '183cm', '/movie/image/director/7.jpeg', '/movie/image/director/8.jpeg!=end=!/movie/image/director/9.jpeg','');
INSERT INTO performer VALUES (4, '佩吉·利普顿','Peggy Lipton','Peggy Lipton Jones', '1946-08-30', 19,4.11,'1','佩吉·利普顿，Peggy Lipton was born on August 30, 1946 in New York City, New York, USA as Margaret Ann Lipton. She is an actress, known for The Mod Squad (1968), The Postman (1997) and Twin Peaks: Fire Walk with Me (1992). She was previously married to Quincy Jones.','美国纽约','美国', '女', '处女座', '168cm', '/movie/image/director/10.jpeg', '/movie/image/director/11.jpeg!=end=!/movie/image/director/12.jpeg','');
