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