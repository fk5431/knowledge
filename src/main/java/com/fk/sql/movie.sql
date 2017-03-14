DROP TABLE IF EXISTS movie;
CREATE TABLE movie(
    id INT(11) PRIMARY KEY not NULL AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL ,
    etitle VARCHAR(255) NOT NULL ,
    type VARCHAR(255) NOT NULL,
    area VARCHAR(255) NOT NULL,
    time VARCHAR(255) NOT NULL,
    showtime DATE NOT NULL,
    lookcount INT(11) DEFAULT 0,
    score DOUBLE DEFAULT 0,
    boxoffice INT(11) DEFAULT 0,
    introduce text not NULL,
    directorId INT(11) NOT NULL,
    performerIds VARCHAR(255) NOT NULL,
    prizeIds VARCHAR(255) NOT NULL,
    image VARCHAR(255) NOT NULL,
    atlas text NOT NULL,
    FOREIGN KEY(directorId) REFERENCES director(id)
)DEFAULT CHARSET=utf8;

