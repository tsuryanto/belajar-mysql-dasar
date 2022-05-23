-- CONTOH ONE TO MANY RELATIONSHIP
-- Aantara Categories dan Produts
-- Dimana satu category bisa menjadi kategori di banyak produk

CREATE TABLE categories(
	id VARCHAR(10) NOT NULL,
    name VARCHAR(100) NOT NULL,
    PRIMARY KEY (id)
) ENGINE = InnoDB;

DESC categories;

INSERT INTO categories(id, name)
VALUES 	('C0001', 'Makanan'),
		('C0002', 'Minuman'),
        ('C0003', 'Lain-lain');
        
SELECT * FROM categories;        
        
-- ===================
-- Ubah table products
-- ===================
			
-- buat kolom id_category di products
ALTER TABLE products
ADD COLUMN id_category VARCHAR(10);
DESC products;

-- buat FOREIGN KEY di producs
ALTER TABLE products
ADD CONSTRAINT fk_products_category 
	FOREIGN KEY (id_category) REFERENCES categories (id);
    
UPDATE products
SET id_category = 'C0001'
WHERE category = 'Makanan';    

UPDATE products
SET id_category = 'C0002'
WHERE category = 'Minuman';  

UPDATE products
SET id_category = 'C0003'
WHERE category = 'Lain-lain';  

-- Menampilkan relasi 
SELECT products.id, products.name, categories.name
FROM products
JOIN categories ON (products.id_category = categories.id);

INSERT INTO categories(id, name)
VALUES 	('C0004', 'Oleh-oleh'),		
        ('C0005', 'Gadget');

-- INNER JOIN
SELECT * FROM categories
INNER JOIN products ON (products.id_category = categories.id);

-- LEFT JOIN 
-- memiliki Mekanisme seperti INEER JOIN, namun semua data di table pertama akan diambil juga
-- JIka tidak ada relasi di table kedua , maka hasilnya akan NULL
SELECT * FROM categories
LEFT JOIN products ON (products.id_category = categories.id);

-- RIGHT JOIN 
-- memiliki Mekanisme seperti INEER JOIN, namun semua data di table kedua akan diambil juga
-- JIka tidak ada relasi di table pertama , maka hasilnya akan NULL
SELECT * FROM categories
RIGHT JOIN products ON (products.id_category = categories.id);

-- CROSS JOIN
-- Hasilnya jumlah di tabel pertama akan dikalikan dengan jumlah di tabel kedua
-- Cross join sangat jarang digunakan
-- Tidak perlu kondisi ON
SELECT * FROM categories
CROSS JOIN products;