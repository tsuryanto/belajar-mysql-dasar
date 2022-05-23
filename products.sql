-- Buat table products
CREATE TABLE products(
	id VARCHAR(10) NOT NULL,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    price INT UNSIGNED NOT NULL,
    quantity INT UNSIGNED NOT NULL DEFAULT 0,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
) ENGINE = InnoDB;

SHOW CREATE TABLE products;

DESC products;

INSERT INTO products(id, name, price, quantity)
VALUES ('P0001', 'Mie Ayam Original', 15000, 100);

INSERT INTO products(id, name, description, price, quantity)
VALUES ('P0002', 'Mie Ayam Bakso', 'Mie ayam dengan bakso urat besar', 20000, 30);

-- Insert banyak data sekaligus
INSERT INTO products(id, name, price, quantity)
VALUES 	('P0003', 'Mie Ayam Ceker', 15000, 10),
		('P0004', 'Mie Ayam Spesial', 18000, 10),
        ('P0005', 'Mie Ayam Yamin', 15000, 10);
        
SELECT * FROM products;
SELECT id, name, price, quantity FROM products;
SELECT * FROM products WHERE quantity = 10;
SELECT * FROM products WHERE id = 'P0002';

ALTER table products
ADD COLUMN category ENUM("Makanan", "Minuman", "Lain-lain")
AFTER NAME;

UPDATE products
SET category = 'Makanan'
WHERE id = 'P0001'; -- Jika id tidak ketemu, tidak akan ada data yang di update

UPDATE products
SET	category = 'Makanan',
	description = 'Mie Ayam Ceker & Kulit'
WHERE id = 'P0003';

UPDATE products
SET price = price + 3000
WHERE id = 'P0003';

DELETE FROM products 
WHERE id = 'P0005'; -- Jika id tidak ketemu, tidak akan ada data yang di delete

INSERT INTO products(id, category, name, price, quantity)
VALUES ('P0006', 'Makanan', 'Bakso Rusuk', 25000, 200),
       ('P0007', 'Minuman', 'Es Jeruk', 10000, 300),
       ('P0008', 'Minuman', 'Es Campur', 15000, 500),
       ('P0009', 'Minuman', 'Es Teh Manis', 5000, 400),
       ('P0010', 'Lain-Lain', 'Kerupuk', 2500, 1000),
       ('P0011', 'Lain-Lain', 'Keripik Udang', 10000, 300),
       ('P0012', 'Lain-Lain', 'Es Krim', 5000, 200),
       ('P0013', 'Makanan', 'Mie Ayam Jamur', 20000, 50),
       ('P0014', 'Makanan', 'Bakso Telor', 20000, 150),
       ('P0015', 'Makanan', 'Bakso Jando', 25000, 300);

-- Select semua daftar kategori secara unik di tabel products
SELECT DISTINCT category FROM products;

SELECT id, name, price, price DIV 1000 AS price_in_k
FROM products
ORDER BY price_in_k DESC;

SELECT id,
       price,
       IF(price <= 15000, 'Murah', IF(price <= 20000, 'Mahal', 'Mahal Banget')) as 'Mahal?'
FROM products;

SELECT SUM(quantity) AS 'Total Stock', category
FROM products
GROUP BY category;

-- Menambahkan CHECK Constraint
-- untuk melakukan pengecekan sebelum insert
-- misal dibawah ini untuk check bahwa price yang bisa diinput minimal 1000
ALTER TABLE products
ADD CONSTRAINT price_check CHECK (price >= 1000);

-- Menambahkan Full Text Search 
-- Untuk mempercepat pencarian di text , dibanding menggunakan LIKE
ALTER TABLE products
ADD FULLTEXT product_fulltext (name, description);

-- -- Jika ingin menghapus fulltext, menggunakan INDEX
-- ALTER TABLE products
-- DROP INDEX product_fulltext;

-- Pencarian dengan LIKE
SELECT id, name, description 
FROM products 
WHERE name LIKE '%ayam%' OR description LIKE '%ayam%';

-- Pencarian dengan FULLTEXT SEARCH Natural Mode
-- mencari data yang mengandung kata ayam di kolom (name, description)
-- data diurutkan dari skoring otomatis , dimana kaya ayam terbanyak ditemukan
SELECT id, name, description 
FROM products
WHERE MATCH(name, description)
	AGAINST('ayam' IN NATURAL LANGUAGE MODE);

-- Pencarian dengan FULLTEXT SEARCH Boolean Mode
-- mencari data yang mengandung kata ayam, namun tidak mengandung kata bakso di kolom (name, description)
SELECT id, name, description 
FROM products
WHERE MATCH(name, description)
	AGAINST('+ayam -bakso' IN BOOLEAN MODE);

-- Pencarian dengan FULLTEXT SEARCH Query Expansion
-- DIlakukan 2 kali pencarian sehingga mysql bisa memperkirakan kata apa yang akan dicari setelahnya
SELECT id, name, description 
FROM products
WHERE MATCH(name, description)
	AGAINST('bakso' WITH QUERY EXPANSION);
    
SELECT * FROM products;

INSERT INTO products(id, name, price, quantity)
VALUES	('X0001', 'X Satu', 25000, 200),
		('X0002', 'X Dua', 10000, 300),
        ('X0003', 'X Tiga', 15000, 500);        

-- Sub Query di WHERE
-- Contoh Mencari products yang harganya diatas rata-rata harga products
SELECT * FROM products
WHERE price > (SELECT AVG(price) from products); 

UPDATE products
SET price = 1000000
WHERE id = 'X0003';

-- Sub Query di FROM
-- Menampilkan harga termahal dari product yang memiliki kategori
SELECT MAX(price) FROM products;

SELECT products.id, products.name, price
FROM categories 
JOIN products ON (products.id_category = categories.id);

-- SUb Query nya 
SELECT MAX(cp.price) FROM (
	SELECT products.id, products.name, price
	FROM categories 
	JOIN products ON (products.id_category = categories.id) 
) AS cp;