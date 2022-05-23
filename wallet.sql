-- Contoh ONE TO ONE Relationship
-- Dimana setiap Customer hanya boleh punya 1 Wallet
-- Caranya FOREIGN Key Customer dibuat UNIQUE agar tidak ada data duplikat untuk kepemilikan data wallet nya

CREATE TABLE wallet(
	id INT NOT NULL AUTO_INCREMENT,
    id_customer INT NOT NULL,
    balance INT NOT NULL DEFAULT 0,
    PRIMARY KEY (id),
    UNIQUE id_customer_unique (id_customer),
    CONSTRAINT fk_wallet_customer 
		FOREIGN KEY (id_customer) REFERENCES customers (id)
) ENGINE = InnoDB;

DESC wallet;

INSERT INTO wallet(id_customer) 
VALUES 	(1), 
		(2);
        
SELECT * FROM wallet;

SELECT customers.email, wallet.balance
FROM wallet
JOIN customers ON (wallet.id_customer = customers.id);

ALTER TABLE wallet
ADD CONSTRAINT fk_wallet_customer
	FOREIGN KEY(id_customer) REFERENCES customers(id);

SHOW CREATE TABLE wallet;