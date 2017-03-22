DROP TABLE IF EXISTS photo;
CREATE TABLE photo(
  id INT(11) PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(255) NOT  NULL ,
  images VARCHAR(255) NOT  NULL ,
  count int(11) DEFAULT 0
)DEFAULT CHARSET=utf8;

INSERT INTO photo VALUES(1, '猫爪团粉丝同盟：王丽坤生日快乐', '/movie/image/photo/1_1.jpg!=end=!/movie/image/photo/1_2.jpg!=end=!/movie/image/photo/1_3.jpg!=end=!/movie/image/photo/1_4.jpg!=end=!/movie/image/photo/1_5.jpg!=end=!/movie/image/photo/1_6.jpg',6);
UPDATE photo set images ='/movie/image/photo/1_1.jpg!=end=!/movie/image/photo/1_2.jpg!=end=!/movie/image/photo/1_3.jpg!=end=!/movie/image/photo/1_4.png!=end=!/movie/image/photo/1_5.jpg!=end=!/movie/image/photo/1_6.png';