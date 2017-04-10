DROP TABLE IF EXISTS record;
CREATE TABLE record(
    id INT(11) PRIMARY KEY not NULL AUTO_INCREMENT,
    siteId int(11) NOT NULL ,
    siteName VARCHAR(255) NOT NULL ,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    wechat VARCHAR(255) NOT NULL,
    mob VARCHAR(255) NOT NULL,
    other VARCHAR(255) NOT NULL,
    movieId int(11) not NULL ,
    movieName VARCHAR(255) not NULL,
    userId int(11) not NULL
)DEFAULT CHARSET=utf8;
