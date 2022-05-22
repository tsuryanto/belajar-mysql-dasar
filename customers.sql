CREATE TABLE customers
(
	id INT NOT NULL AUTO_INCREMENT,
    email VARCHAR(100) NOT NULL,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100),
    PRIMARY KEY (id),
    UNIQUE KEY email_unique (email)
) ENGINE = InnoDB;

DESC customers;

ALTER TABLE customers
DROP CONSTRAINT email_unique;

-- Menambahkan UNIQUE CONSTRAINT
-- Membuat email harus unik , tidak boleh ada record yg sama di kolom email
ALTER TABLE customers
ADD CONSTRAINT email_unique UNIQUE (email);

DESC customers;