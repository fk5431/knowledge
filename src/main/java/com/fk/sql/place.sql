DROP TABLE IF EXISTS place;
CREATE TABLE place(
  id INT(11) PRIMARY KEY AUTO_INCREMENT,
  placename VARCHAR(255) NOT NULL
)DEFAULT CHARSET=utf8;
INSERT INTO place(id, placename) VALUES(0, '全部');
INSERT INTO place(placename) VALUES( '大陆');
INSERT INTO place(placename) VALUES( '美国');
INSERT INTO place(placename) VALUES( '韩国');
INSERT INTO place(placename) VALUES( '日本');
INSERT INTO place(placename) VALUES( '中国香港');
INSERT INTO place(placename) VALUES('中国台湾');
INSERT INTO place(placename) VALUES( '泰国');
INSERT INTO place(placename) VALUES( '印度');
INSERT INTO place(placename) VALUES( '法国');
INSERT INTO place(placename) VALUES( '英国');
INSERT INTO place(placename) VALUES( '俄罗斯');
INSERT INTO place(placename) VALUES( '意大利');
INSERT INTO place(placename) VALUES( '西班牙');
INSERT INTO place(placename) VALUES( '德国');
INSERT INTO place(placename) VALUES( '波兰');
INSERT INTO place(placename) VALUES( '澳大利亚');
INSERT INTO place(placename) VALUES( '伊朗');
INSERT INTO place(placename) VALUES( '其他');
