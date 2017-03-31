 DROP TABLE IF EXISTS province;
CREATE TABLE province(
  id int(11) PRIMARY key not NULL AUTO_INCREMENT,
  provinceID varchar(6) default NULL,
  province varchar(40) default NULL,
  count int(11) DEFAULT 0
)DEFAULT CHARSET=utf8;
INSERT INTO province VALUES (1,'110000','北京市', 0);
INSERT INTO province VALUES (2,'120000','天津市', 0);
INSERT INTO province VALUES (3,'130000','河北省', 0);
INSERT INTO province VALUES (4,'140000','山西省', 0);
INSERT INTO province VALUES (5,'150000','内蒙古自治区', 0);
INSERT INTO province VALUES (6,'210000','辽宁省', 0);
INSERT INTO province VALUES (7,'220000','吉林省', 0);
INSERT INTO province VALUES (8,'230000','黑龙江省', 0);
INSERT INTO province VALUES (9,'310000','上海市', 0);
INSERT INTO province VALUES (10,'320000','江苏省', 0);
INSERT INTO province VALUES (11,'330000','浙江省', 0);
INSERT INTO province VALUES (12,'340000','安徽省', 0);
INSERT INTO province VALUES (13,'350000','福建省', 0);
INSERT INTO province VALUES (14,'360000','江西省', 0);
INSERT INTO province VALUES (15,'370000','山东省', 0);
INSERT INTO province VALUES (16,'410000','河南省', 0);
INSERT INTO province VALUES (17,'420000','湖北省', 0);
INSERT INTO province VALUES (18,'430000','湖南省', 0);
INSERT INTO province VALUES (19,'440000','广东省', 0);
INSERT INTO province VALUES (20,'450000','广西壮族自治区', 0);
INSERT INTO province VALUES (21,'460000','海南省', 0);
INSERT INTO province VALUES (22,'500000','重庆市', 0);
INSERT INTO province VALUES (23,'510000','四川省', 0);
INSERT INTO province VALUES (24,'520000','贵州省', 0);
INSERT INTO province VALUES (25,'530000','云南省', 0);
INSERT INTO province VALUES (26,'540000','西藏自治区', 0);
INSERT INTO province VALUES (27,'610000','陕西省', 0);
INSERT INTO province VALUES (28,'620000','甘肃省', 0);
INSERT INTO province VALUES (29,'630000','青海省', 0);
INSERT INTO province VALUES (30,'640000','宁夏回族自治区', 0);
INSERT INTO province VALUES (31,'650000','新疆维吾尔自治区', 0);
INSERT INTO province VALUES (32,'710000','台湾省', 0);
INSERT INTO province VALUES (33,'810000','香港特别行政区', 0);
INSERT INTO province VALUES (34,'820000','澳门特别行政区', 0);
alter table province add column travelid text not null;
