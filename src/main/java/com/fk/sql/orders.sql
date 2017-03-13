 DROP TABLE IF EXISTS orders;

CREATE TABLE orders(
  id int(11) PRIMARY key NOT NULL auto_increment,
  place VARCHAR(255) NOT NULL,
  image VARCHAR(255) NOT NULL,
  images VARCHAR(255) NOT NULL,
  title VARCHAR (255) NOT NULL ,
  hotel VARCHAR(255) NOT NULL,
  cost TEXT NOT NULL,
  type VARCHAR(255) NOT NULL,
  count int(11) DEFAULT 0,
  sellcount int(11) DEFAULT 0,
  price int(11) DEFAULT 999,
  subject VARCHAR(255) NOT NULL
) DEFAULT CHARSET=utf8;
INSERT INTO orders VALUES (1,'深圳!=end=!香港!=end=!澳门', '','','深圳 香港澳门6天5晚半自由行（四星酒店+海洋公园门票+迪士尼门票+夜游维港）','1!=end=!2', '1.交通:深圳往返香港大巴；
2.酒店:深圳四星级酒店1晚，香港三星级酒店三晚+珠海准三星酒店一晚；不含早；
3.用餐:3早7正；
4.门票:行程中所列的景点门票；
5.用车:游览中的用车以及往返接送机（自由活动期间除外）；
6.导游:含领队以及当地导游服务费。','6天5晚半自由行',1,1,999,'购物天堂!=end=!维港夜景!=end=!主题乐园!=end=!四星酒店');
UPDATE orders set images = '/travel/images/orders/1/1.jpeg!=end=!/travel/images/orders/1/2.jpeg!=end=!/travel/images/orders/1/3.jpeg!=end=!/travel/images/orders/1/4.jpeg';
UPDATE orders set sellcount = 1;
INSERT INTO orders(id, place,image, images, title, hotel, cost, type, count, sellcount, price, subject) VALUES (2,'苏梅岛','/travel/images/orders/2/1.jpeg','/travel/images/orders/2/2.jpeg',
'广州直飞苏梅岛6天4晚自由行','3!=end=!4','1. 交通： 广州直飞苏梅岛往返机票（按最低舱位核算，如升舱需补差价）。机票开具后不得退票，改期，签转
    2. 住宿：4晚苏梅酒店住宿含早餐。（小童价格不占床，不含早餐。）
    3. 接送机：苏梅岛机场至酒店往返接送,拼车为主','6天4晚自由行',1,0,3999,' 奢华五星!=end=!可私人定制!=end=!强势控房');

INSERT INTO orders(id,place, image, images, title, hotel, cost, type, count, sellcount, price, subject) VALUES (3,'马尔代夫','/travel/images/orders/3/1.jpeg','/travel/images/orders/3/2.jpeg!=end=!/travel/images/orders/3/3.jpeg!=end=!/travel/images/orders/3/4.jpeg!=end=!/travel/images/orders/3/5.jpeg',
'北京直飞马尔代夫马累6-7天往返含税机票','5!=end=!6','1. 机票：北京直飞马尔代夫6/7天往返经济舱含税机票。（机票一经开出，不得更改、不得签转、不得退票）','直飞6天往返-美佳航空',1,0,4600,' 特价!=end=!多个航空可选!=end=!直飞!=end=!度假胜地');

UPDATE orders set hotel = '1!=end=!2' where id = 3;