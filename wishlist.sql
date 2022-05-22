CREATE TABLE wishlist (
	id INT NOT NULL AUTO_INCREMENT,
    id_product VARCHAR(10) NOT NULL,
    description TEXT,
    PRIMARY KEY (id),
    CONSTRAINT fk_wishlist_product
		FOREIGN KEY (id_product) REFERENCES products (id)
) ENGINE = InnoDB;

SHOW CREATE TABLE wishlist;

DESC wishlist;

-- -- Jika ingin menghapus relasinya
ALTER TABLE wishlist
DROP CONSTRAINT fk_wishlist_product;

ALTER TABLE wishlist
ADD CONSTRAINT fk_wishlist_product 
	FOREIGN KEY (id_product) REFERENCES products (id)
		ON DELETE CASCADE ON UPDATE CASCADE;

INSERT INTO wishlist(id_product, description)
VALUES ('P0001', 'Makanan Faforitku');

SELECT * FROM wishlist;

-- Coba delete products with id P0001
-- Hasilnya (ERROR) karena data P0001 ada di relaasi wishlist
-- ini adalah mode behaviour RESTRICT (default)
DELETE FROM products
WHERE id = 'P0001';

INSERT INTO products(id, name, description, price, quantity)
VALUES ('Pxxxx', 'Contoh', 'Lain-lain', 1000, 1000);

INSERT INTO wishlist(id_product, description)
VALUE ('Pxxxx', 'Coba Cascade');

-- Setelah diteraplan behaviour CASCADE
-- Ketika kita menghapus product dengan id tertentu, maka semua relasinya akan dihapus juga.
DELETE FROM products
WHERE id = 'Pxxxx';

-- Baiknya tetap menggunakan RESTRICT 
-- atau bisa jika tidak ingin ditampilkan  buat kolom tampilkan valuenya TRUE / FALSE

