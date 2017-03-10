 DROP TABLE IF EXISTS orders;

CREATE TABLE orders(
  id int(11) PRIMARY key NOT NULL auto_increment,
  images VARCHAR(255) NOT NULL,
  title VARCHAR (255) NOT NULL ,
  hotel VARCHAR(255) NOT NULL,
  cost TEXT NOT NULL,
  type VARCHAR(255) NOT NULL,
  count int(11) DEFAULT 0,
  subject VARCHAR(255) NOT NULL
) DEFAULT CHARSET=utf8;
INSERT INTO orders VALUES (1, '','深圳 香港澳门6天5晚半自由行（四星酒店+海洋公园门票+迪士尼门票+夜游维港）','1!=end=!2', '1.交通:深圳往返香港大巴；
2.酒店:深圳四星级酒店1晚，香港三星级酒店三晚+珠海准三星酒店一晚；不含早；
3.用餐:3早7正；
4.门票:行程中所列的景点门票；
5.用车:游览中的用车以及往返接送机（自由活动期间除外）；
6.导游:含领队以及当地导游服务费。','6天5晚半自由行',1,'购物天堂!=end=!维港夜景!=end=!主题乐园!=end=!四星酒店');
UPDATE orders set images = '/travel/images/orders/1/1.jpeg!=end=!/travel/images/orders/1/2.jpeg!=end=!/travel/images/orders/1/3.jpeg!=end=!/travel/images/orders/1/4.jpeg';