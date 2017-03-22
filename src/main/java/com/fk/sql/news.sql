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
UPDATE news SEt content = '<p class="image-wrapper">
                    <span style="color: rgb(51, 51, 51);">
                        <img src="/movie/image/news/1_1.jpeg"/><br/>
                    </span>
                </p>
                <p><span style="color: rgb(51, 51, 51);"><br/></span></p>
                <p><span style="color: rgb(51, 51, 51);">据剧中演员杰里米&middot;斯威夫特透露，本剧改编大</span>电影<span
                        style="color: rgb(51, 51, 51);">已经完成剧本的创作，并且曾一度以邮件形式发送至各主演处，然而不久后这些邮件却有如魔法般从邮箱中消失。尽管此项目还没有最终敲定，但斯威夫特坚信本片最早将于今年开拍。</span>
                </p>
                <p><span style="color: rgb(51, 51, 51);"><br/></span></p>
                <p class="image-wrapper"><span style="color: rgb(51, 51, 51);">
                    <img src="/movie/image/news/1_2.jpeg"/><br/></span>
                </p>
                <p><span style="color: rgb(51, 51, 51);"><br/></span></p>
                <p><span style="color: rgb(51, 51, 51);">《</span>唐顿庄园<span style="color: rgb(51, 51, 51);">》制作方Carnival Films表示目前尚未有具体消息证实这一说法，一切有待官宣。</span>
                </p>
                <p><span style="color: rgb(51, 51, 51);"><br/></span></p>
                <p class="image-wrapper">
                    <span style="color: rgb(51, 51, 51);">
                        <img src="/movie/image/news/1_3.jpeg"/><br/></span>
                </p>
                <p class="image-wrapper"><span style="color: rgb(51, 51, 51);">
                    <img src="/movie/image/news/1_4.jpeg"/><br/></span>
                </p>';

ALTER  TABLE news add column introduce VARCHAR(255) not NULL;
UPDATE news SEt introduce = '采访、文/少年英雄方枪枪2013年，汤姆·希德勒斯顿因出演电影《雷神》中的“洛基”而风靡全球。一般电影里的反派角色通常都会让人恨到心坎里，但惟独抖森饰演的“洛基”打破了这个常规...';
