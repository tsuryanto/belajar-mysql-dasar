CREATE TABLE sellers(
	id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    name2 VARCHAR(100) NOT NULL,
    name3 VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    PRIMARY KEY (id),
    UNIQUE KEY email_unique (email),
    INDEX name_index (name),    
    INDEX name2_index (name2),
    INDEX name3_index (name3)
) ENGINE = InnoDB;

DESC sellers;
SHOW CREATE TABLE sellers;

ALTER TABLE sellers
ADD INDEX name1_name2_name3_index (name, name2, name3);

ALTER TABLE sellers
DROP INDEX name_index;

ALTER TABLE sellers
DROP INDEX name2_index;

ALTER TABLE sellers
DROP INDEX name3_index;