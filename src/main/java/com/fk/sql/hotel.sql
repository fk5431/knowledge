DROP TABLE IF EXISTS hotel;

CREATE TABLE hotel(
  id int(11) PRIMARY KEY NOT NULL auto_increment,
  title VARCHAR(255) NOT NULL,
  etitle VARCHAR(255) NOT NULL,
  star int(11) NOT NULL,
  score VARCHAR(255) NOT NULL,
  adress VARCHAR(255) NOT NULL,
  img VARCHAR(255) NOT NULL ,
  summary VARCHAR(255) not null
) DEFAULT CHARSET=utf8;
INSERT INTO hotel VALUES(1, '万事达酒店（深圳文锦渡店）','Master hotel Wenjindu',3,'6.3','深圳新安路2号','','非常不错的一家酒店，服务很好，很干净');
INSERT INTO hotel VALUES(2, '香港丽东酒店','Newton Hong Kong Hotel',4, '8.7','香港北角电器道218号','','香港的房价和房子大小，所以性价比这个东西，你们懂的！丽东酒店隔壁就是炮台山站，很方便，酒店也很干净，还有免费寄存');
UPDATE hotel SET img = '/travel/images/hotel/1.jpeg' where id = 1;
UPDATE hotel SET img = '/travel/images/hotel/2.jpeg' where id = 2;
INSERT INTO hotel VALUES(3, '苏梅岛布日扎海滩度假酒店','The Briza Beach Resort, Samui',4,'7.7','Chaweng Beach, Bophu','/travel/images/hotel/3.jpeg','客房很大，自带露台和泳池很不错，最大优点靠近海滩，有自己沙滩。适合家庭游，酒店景观漂亮，全独栋洋楼，每栋只上下两');
INSERT INTO hotel VALUES(4, '苏梅岛波普宜必思酒店','Hotel Ibis Samui Bophut',3,'8.0','Bophut Beach, Surat Thani, Koh .','/travel/images/hotel/4.jpeg','一个经济实惠的酒店，远离了嘈杂的人群，能享受一份难得的安静，酒店附近有fishmanvillage步行街');

INSERT INTO hotel VALUES(5, '苏梅岛布日扎海滩度假酒店','The Briza Beach Resort, Samui',4,'7.7','Chaweng Beach, Bophu','/travel/images/hotel/3.jpeg','客房很大，自带露台和泳池很不错，最大优点靠近海滩，有自己沙滩。适合家庭游，酒店景观漂亮，全独栋洋楼，每栋只上下两');
INSERT INTO hotel VALUES(6, '苏梅岛波普宜必思酒店','Hotel Ibis Samui Bophut',3,'8.0','Bophut Beach, Surat Thani, Koh .','/travel/images/hotel/4.jpeg','一个经济实惠的酒店，远离了嘈杂的人群，能享受一份难得的安静，酒店附近有fishmanvillage步行街');
