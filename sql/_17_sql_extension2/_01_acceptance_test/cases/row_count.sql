--ROW_COUNT FUNCTION
CREATE TABLE loo(a int PRIMARY KEY AUTO_INCREMENT, b char(10));

INSERT INTO loo(b) VALUES('AAA');

SELECT ROW_COUNT();

INSERT INTO loo(b) VALUES ('FFF'), ('GGG'), ('HHH');

SELECT ROW_COUNT();

DROP TABLE loo;

