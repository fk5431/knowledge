DROP TABLE IF EXISTS forthcoming;
CREATE TABLE forthcoming(
  id INT(11) PRIMARY KEY AUTO_INCREMENT,
  count INT(11) NOT NULL,
  movieid INT(11) not null,
  FOREIGN KEY(id)  REFERENCES movie(id)
)DEFAULT CHARSET=utf8;

INSERT INTO forthcoming VALUES(1,8,3);

INSERT INTO forthcoming VALUES(2,8,9);
INSERT INTO forthcoming VALUES(3,8,10);
INSERT INTO forthcoming VALUES(4,8,11);
INSERT INTO forthcoming VALUES(5,8,12);
INSERT INTO forthcoming VALUES(6,8,13);
INSERT INTO forthcoming VALUES(7,8,14);

INSERT INTO forthcoming VALUES(8,8,5);