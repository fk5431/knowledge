DROP TABLE IF EXISTS line;

CREATE TABLE line(
  id int(11) PRIMARY key NOT NULL auto_increment,
  title VARCHAR(255) NOT NULL,
  summary VARCHAR(255) NOT NULL,
  hotle VARCHAR(255) NOT NULL,
  meal VARCHAR(255) NOT NULL,
  orderId int(11) not null,
  FOREIGN KEY(orderId) REFERENCES orders(id)
) DEFAULT CHARSET=utf8;
INSERT INTO line VALUES(1, '深圳（全天自由活动）','深圳全天24小时接机接站，送至酒店休息自由活动，同时可以感受下特区的繁华；','深圳万事达酒店/同级酒店','早餐:自理，中餐:自理，晚餐:自理',1);
INSERT INTO line VALUES(2, '香港','早上8点左右出发到皇岗口岸3楼出境大厅集合。抵达后前往：香港会展中心新翼、金紫荆广场，午餐后浏览闻名世界的海洋公园（含228元/人、约4个多小时），浅水湾、而后前往太平山（约20分钟）欣赏东方之珠美丽景色，晚餐后在码头乘观光船游览维多利亚港（含船票160元/人、约45分钟），沿着九龙半岛及港岛北面海岸畅游维多利亚港夜景，借宿一天形成后入住酒店。','香港邮轮酒店/同级酒店','早餐:自理，中餐:团餐，晚餐:团餐',1);
INSERT INTO line VALUES(3, '香港','早餐后-黄大仙（约45分钟）-免税商城（国际珠宝行+DFS免税商场）-午餐迪士尼乐园-返回酒店','香港邮轮酒店/同级酒店','早餐:团餐，中餐:团餐，晚餐:自理',1);
INSERT INTO line VALUES(4, '香港（全天自由活动）','香港是个比较年轻的城市，充满奇迹和深神话的城市，世界级建筑、快节奏的生活、时尚摩登的娱乐享受，时时体现惊艳的魅力，香港在全球经济自由度指数排名第一，香港同时为全球其中一个最安全、最富裕繁荣城市，素有“东方之珠”、“美食天堂”和“购物天堂”等美誉，“亚洲国际都会”则为官方的香港品牌。','香港邮轮酒店/同级酒店','早餐:自理，中餐:自理，晚餐:自理',1);
INSERT INTO line VALUES(5, '澳门','早餐后-乘大型豪华快艇往澳门（含船票160元/人）-午餐-大三巴牌坊-妈祖庙-澳门大桥-渔人码头-手信店-威尼斯艳舞表演（自费）-晚餐-葡京-珠海酒店','珠海大金山酒店（准三星）','早餐:团餐，中餐:团餐，晚餐:团餐',1);
INSERT INTO line VALUES(6, '珠海','早餐后-情侣路-渔女像-石景山-免税商场-和信公司-午餐-珠宝商场-深圳机场（或广州机场）','','早餐:团餐，中餐:团餐，晚餐:自理',1);

INSERT INTO line VALUES(7, '苏梅岛','早餐后-乘大型豪华快艇往澳门（含船票160元/人）-午餐-大三巴牌坊-妈祖庙-澳门大桥-渔人码头-手信店-威尼斯艳舞表演（自费）-晚餐-葡京-珠海酒店','珠海大金山酒店（准三星）','早餐:团餐，中餐:团餐，晚餐:团餐',2);
INSERT INTO line VALUES(8 , '广州','早餐后-情侣路-渔女像-石景山-免税商场-和信公司-午餐-珠宝商场-深圳机场（或广州机场）','','早餐:团餐，中餐:团餐，晚餐:自理',2);

INSERT INTO line VALUES(9, '北京','早餐后-乘大型豪华快艇往澳门（含船票160元/人）-午餐-大三巴牌坊-妈祖庙-澳门大桥-渔人码头-手信店-威尼斯艳舞表演（自费）-晚餐-葡京-珠海酒店','珠海大金山酒店（准三星）','早餐:团餐，中餐:团餐，晚餐:团餐',3);
INSERT INTO line VALUES(10 , '马累 -','早餐后-情侣路-渔女像-石景山-免税商场-和信公司-午餐-珠宝商场-深圳机场（或广州机场）','','早餐:团餐，中餐:团餐，晚餐:自理',3);
