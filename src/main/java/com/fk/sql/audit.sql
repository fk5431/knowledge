 DROP TABLE IF EXISTS audit;
 CREATE TABLE audit(
  id int(11) PRIMARY key not NULL AUTO_INCREMENT,
  time DATE ,
  place VARCHAR(255) not NULL ,
  image VARCHAR(255) NOT NULL,
  smallimage VARCHAR(255),
  title VARCHAR(255) NOT NULL,
  context TEXT NOT NULL,
  summary VARCHAR(255) NOT NULL ,
  type VARCHAR(255) NOT NULL,
  author VARCHAR(255) NOT NULL,
  line VARCHAR(255) NOT NULL,
  count int(11) DEFAULT 0,
  lookcount int(11) DEFAULT 0
)DEFAULT CHARSET=utf8;
CREATE TABLE audit (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time` date DEFAULT NULL,
  `place` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `smallimage` varchar(255) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `context` text,
  `type` varchar(255) NOT NULL,
  `author` varchar(255) NOT NULL,
  `line` varchar(255) NOT NULL,
  `count` int(11) DEFAULT '0',
  `lookcount` int(11) DEFAULT '0',
  `summary` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
INSERT INTO traveltips(id, time, place, image, title, context, type, author, line, summary, subject) VALUES(8, '2016-03-01 5:11:00','成都','/images/test/1.jpeg','10大成都骨灰级小吃','有一篇名为《被本地吃货吐槽最多的成都名小吃》的文章在网上广为传播，蚂小蜂看完觉得坐不住了，因为——多少吃货同党们到天府之国不就为了一己“食”欲、一饱口福么！','美食','冯凯','line','','');

INSERT INTO traveltips(id, time, place, image, title, context, type, author, line) VALUES(1, '2017-02-21 10:11:00','摩洛哥','/images/index_1.jpeg','宝贝，妈妈带你去撒哈拉','context','type','贩暖','line');

INSERT INTO traveltips(id, time, place, image, title, context, type, author, line) VALUES(1, '2017-02-21 10:11:00','摩洛哥','/images/index_1.jpeg','宝贝，妈妈带你去撒哈拉','context','type','贩暖','line');



UPDATE traveltips SET context= '<section class="mfw-pic"><img src="/travel/images/test/2.jpeg" width="100%"><div class="description"><p>图：这么一大盆串串看着就很诱人。 by panda</p></div>
    </section><p>有一篇名为《被本地吃货吐槽最多的成都名小吃》的文章在网上广为传播，蚂小蜂看完觉得坐不住了，因为——多少吃货同党们到天府之国不就为了一己“食”欲、一饱口福么！</p>

<p>其实好多骨灰级的美食都藏在成都的犄角旮旯里呢，三天三夜也说不完。蚂小蜂翻箱倒柜，从箱底扒拉出10种最拥有老成都儿时记忆的小吃——超级接地气的10种，既能当零嘴、又能让亲爱的肚子有饱腹感的10种。</p>

<p>而且，能吃到这些的民间老店都是上了岁数的，有些甚至只是个流动摊点，多数还得拐进好几条小巷，不太好找。但这点挑战算啥，咱都是个合格的吃货对不对？</p>

<p>准备好纸抽，一大波好吃的马上袭来！</p>

<div id="1" style=""></div>
<h3 class="h2">蛋烘糕</h3>
<section class="mfw-pic"><img src="/travel/images/test/3.jpeg" width="100%"><div class="description"><p>图：蛋烘糕。 by 竟小章</p></div>
    </section><h4 class="h3">工人村陆记蛋烘糕</h4>

<p>这家深藏在小巷里的蛋烘糕，可算是“师爷辈”的，不仅摊主是个热情的老爷爷，而且依旧坚持纯手工制作，最老式的蜂窝煤炉子和小铁板锅就是他的最佳拍档。吃到这家蛋烘糕，绝对可以算是“资深吃货”了。</p>

<p>蛋烘糕皮脆内软，光是排队等着就被香薰得直垂涎，惹得不少人一口气吃二、三十个。啥口味都有，都是自个儿炒的馅，怪味蛋烘糕还会让你的舌尖走趟奇妙旅程。</p>

<p>不过，想吃要趁早。要是没碰上排队真是人品大爆发了，就算排上1小时也不足为奇。老爷爷说了：“就是张靓颖来了也一样排队”……</p>' WHERE id = 8;

UPDATE traveltips SET image='/travel/images/test/1.jpeg' WHERE id = 8;
UPDATE traveltips SET summary='/travel/images/index_2.jpeg' WHERE id = 2;
UPDATE traveltips SET summary='/travel/images/index_3.jpeg' WHERE id = 3;
UPDATE traveltips SET summary='/travel/images/index_4.jpeg' WHERE id = 4;
UPDATE traveltips SET summary='/travel/images/index_5.jpeg' WHERE id = 5;
UPDATE traveltips SET summary='/travel/images/index_test_2.jpeg' WHERE id = 6;

INSERT INTO traveltips(id, time, place, image, title, context, type, author, line) VALUES(2, '2017-02-22 10:11:00','武功山','/images/index_2.jpeg','【围城随笔】之2017跨年武功山全线重装穿越','context','type','在远方的阿伦','line');
INSERT INTO traveltips(id, time, place, image, title, context, type, author, line) VALUES(3, '2017-02-23 10:11:00','贝加尔湖','/images/index_3.jpeg','放弃了万千烟火，只为那一眼明眸——贝加尔湖蓝冰之旅','context','type','逐风','line');
INSERT INTO traveltips(id, time, place, image, title, context, type, author, line) VALUES(4, '2017-02-24 10:11:00','斯里兰卡','/images/index_4.jpeg','走到世界的尽头，依然和你手牵手','context','type','小雪儿','line');
INSERT INTO traveltips(id, time, place, image, title, context, type, author, line) VALUES(5, '2017-02-25 10:11:00','乌兰布统','/images/index_5.jpeg','冬季牧歌——雪原深处，见之不忘，思之如狂','context','type','昕小阳','line');
INSERT INTO traveltips(id, time, place, image, title, context, type, author, line) VALUES(6, '2017-03-01 10:11:00','乌兰布统','/images/index_test_2.jpeg','没吃没喝只剩风景 穿越冬天的乌兰布统','自然界是有规律的，但 北京 的冬天却从不玩套路 比如，立冬都过了还没等来一场像样的雪 但却又迎来了单双号限行 于是，我们干脆离开 北京 前往 乌兰布统 抵达 乌兰布统 的前站，我们选择了...','type','车轮上的诗和远','line');


INSERT INTO traveltips(id, time, place, image, title, context, type, author, line) VALUES(7, '2017-03-05 10:11:00','日本','/travel/images/context_1.jpeg','只看一部纪录片，就知道去日本吃什么和果子啦！','<section class="mfw-pic"><img src="/travel/images/context_1.jpeg" width="100%"><div class="description"><p>图：中村藤吉的抹茶蕨饼。 by kartzk</p></div>
            </section><p>如果让蚂小蜂列出日本旅行的必体验，“品尝和果子”一定是蚂小蜂会大力向你推荐的一条。</p>

            <p>“果子”即点心，“和果子”就是日本传统点心。虽然这些果子最初可能并非源自本土，不过人们通常把明治时期之前出现的果子称为“和果子”，之后传入的近代西式甜点称作“洋果子”。</p>

            <p>和果子最初是为了配合日式茶道而诞生，以豆类、抹茶和各种应季水果为原料制作，非常讲究造型的美观。因为口味上是为了与日本茶的苦涩感中和，所以单吃起来通常比较甜，推荐配合无糖的茶饮一起品尝。</p>
            <section class="mfw-pic"><img src="/travel/images/context_2.png" width="100%"><div class="description"><p>图：各式各样的和果子</p></div>
            </section><p>和果子的种类非常丰富，根据含水量和保存时间长短，分为生果子、半生果子和干果子三大类，而每个大类又包括多种小类和数不清的品种。如果让蚂小蜂一一列举，那真是几天几夜说不完。那么，和果子如此纷繁多样，要如何去选择呢？别怕，贴心的蚂小蜂这就向你推荐一系列纪录片——《甜言蜜语》。</p>

            <div id="1" style=""></div>
            <h3 class="h2">初见《甜言蜜语》</h3>
            <section class="mfw-pic"><img src="/travel/images/context_3.png" width="100%"></section><p>《甜言蜜语》系列是专门讲述和果子的纪录短片，一集只有2-3分钟，每次只介绍一种和果子与一家店，配上精良的画面和应景的音乐，看得根本停不下来！</p>

            <h4 class="h3">你熟悉或陌生の和果子</h4>

            <p>各式各样的和果子当然是当仁不让的主角。比如这样的↓</p>
            <section class="mfw-pic"><img src="/travel/images/context_4.png" width="100%"><div class="description"><p>图：草莓大福</p></div>
            </section><p>这样的↓</p>
            <section class="mfw-pic"><img src="/travel/images/context_5.png" width="100%"><div class="description"><p>图：铜锣烧</p></div>
            </section><p>还有这样的↓</p>
            <section class="mfw-pic"><img src="/travel/images/context_6.png" width="100%"><div class="description"><p>图：揉果子</p></div>
            </section><p>当然也有这样的↓</p>
            <section class="mfw-pic"><img src="/travel/images/context_7.png" width="100%"><div class="description"><p>图：糖腌菜</p></div>
            </section><p>和这样的↓</p>
            <section class="mfw-pic"><img src="/travel/images/context_8.png" width="100%"><div class="description"><p>图：仙贝</p></div>
            </section><h4 class="h3">季节中の和果子</h4>
            <section class="mfw-pic"><img src="/travel/images/context_9.png" width="100%"><div class="description"><p>图：春季气息浓郁的樱花揉果子</p></div>
            </section><section class="mfw-pic"><img src="/travel/images/context_10.png" width="100%"><div class="description"><p>图：映照着夏天的寒天果子</p></div>
        </section><section class="mfw-pic"><img src="/travel/images/context_11.png" width="100%"><div class="description"><p>图：秋季登场的是带有栗子的鹿之子</p></div>
        </section><section class="mfw-pic"><img src="/travel/images/context_12.png" width="100%"><div class="description"><p>图：适合寒冷冬季的温暖鲷鱼烧</p></div>
        </section><p>是不是单单看见和果子那可爱或精致的造型，就已经按捺不住内心的激动了呢？那么我们继续来看一看纪录片到底说些啥。</p>

            <div id="2" style=""></div>
            <h3 class="h2">细看《甜言蜜语》</h3>

            <h4 class="h3">和果子の由来</h4>

            <p>片子首先会简短介绍每种和果子的历史背景和由来，比如草莓大福的诞生：</p>
            <section class="mfw-pic"><img src="/travel/images/context_12.png" width="100%"><div class="description"><p>图：和果子中的经典——红豆大福</p></div>
            </section><section class="mfw-pic"><img src="/travel/images/context_14.png" width="100%"><div class="description"><p>图：水果界的偶像——草莓</p></div>
        </section><section class="mfw-pic"><img src="/travel/images/context_15.png" width="100%"><div class="description"><p>图：两者在昭和80年（1985年）相遇啦！</p></div>
        </section><h4 class="h3">和果子の制作</h4>

            <p>然后是最激动人心的和果子制作过程！你会发现，很多看似造型简单的和果子，背后却隐藏着非常不易制作的一面呢，比如蕨饼：</p>
            <section class="mfw-pic"><img src="/travel/images/context_16.png" width="100%"><div class="description"><p>图：将100%的蕨粉入水融化，然后以大火煮制粘稠状，期间要不停地搅拌</p></div>
            </section><section class="mfw-pic"><img src="/travel/images/context_17.png" width="100%"><div class="description"><p>图：然后不断地将之搅起并用力摔打，这个过程相当考验制作者臂力和腰力</p></div>
        </section><section class="mfw-pic"><img src="/travel/images/context_18.png" width="100%"><div class="description"><p>图：摔打完成后在里面加入馅并制成团子</p></div>
        </section><section class="mfw-pic"><img src="/travel/images/context_19.png" width="100%"><div class="description"><p>图：最后撒上黄豆粉才算完成</p></div>
        </section><h4 class="h3">职人与和果子の羁绊</h4>

            <p>说完了和果子，当然也要说说和果子职人的故事。如今我们能吃到这么丰富美味的和果子，并非偶然，这全靠背后那些和果子职人的传承与创新。他们大部分是继承家业，但也有因为喜爱和果子而投身其中的。但无论接触和果子的契机是什么，他们都怀有各自的愿望与梦想。</p>

            <p>有因为想做出地区特产的：</p>
            <section class="mfw-pic"><img src="/travel/images/context_20.png" width="100%"><div class="description"><p>图：初代店主提出“要做出结合人形町的特产”</p></div>
            </section><p>有因为自己觉得好吃而像制作出来与大家分享的：</p>
            <section class="mfw-pic"><img src="/travel/images/context_21.png" width="100%"><div class="description"><p>图：“正因为自己吃了觉得好吃才这样制作出来”</p></div>
            </section><p>有希望将少见的技法传承下去的：</p>
            <section class="mfw-pic"><img src="/travel/images/context_22.png" width="100%"><div class="description"><p>图：“如果有每天都可以做糖人的地方的话，捏糖人这个技术也能保留下来了吧”</p></div>
            </section><p>也有不希望金花糖失传而致力于复兴计划的：</p>
            <section class="mfw-pic"><img src="/travel/images/context_23.png" width="100%"><div class="description"><p>图：“我不想让它在我眼前失传”</p></div>
            </section><h4 class="h3">和果子の重逢</h4>

            <p>即便是小小的和果子，也有这么多讲究，不可小视。了解完和果子的故事，再次面对它们时，心情似乎也有了不同。</p>

            <div id="3" style=""></div>
            <h3 class="h2">和果子店铺大推荐</h3>

            <p>虽然《甜言蜜语》中有许多优质的选择，但是蚂小蜂还是忍不住先要推荐一些和果子店铺给你们。</p>','type','冯凯','line');
