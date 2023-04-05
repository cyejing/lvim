CREATE DATABASE test;

SHOW DATABASES;

CREATE TABLE IF NOT EXISTS `runoob_tbl`(
   `runoob_id` INT UNSIGNED AUTO_INCREMENT,
   `runoob_title` VARCHAR(100) NOT NULL,
   `runoob_author` VARCHAR(40) NOT NULL,
   `submission_date` DATE,
   PRIMARY KEY ( `runoob_id` )
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

SHOW TABLES;

USE test;

INSERT INTO runoob_tbl(runoob_title,runoob_author) VALUES('test','test');

SELECT * FROM runoob_tbl;

SELECT * FROM mysql.user limit 200;


