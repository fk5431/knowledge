DROP TABLE IF EXISTS movie;
CREATE TABLE movie(
    id INT(11) PRIMARY KEY not NULL AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL ,
    movietime DATE ,
    venue VARCHAR(255) NOT NULL ,
    screenings VARCHAR(255) NOT NULL ,
    tickettime DATE,
    price INT(11) NOT NULL ,
    artist VARCHAR(255) NOT NULL ,
    duration VARCHAR(255) NOT NULL ,
    introduce TEXT NOT NULL ,
    type INT(3) NOT NULL,
    FOREIGN KEY(id) REFERENCES type(id)
)DEFAULT CHARSET=utf8;
