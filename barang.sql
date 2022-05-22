SHOW databases;
SHOW ENGINES;

USE belajar_mysql;

SHOW TABLES;

CREATE TABLE barang(
	id INT,
    nama VARCHAR(100),
    harga INT,
    jumlah INT
) ENGINE = innoDB;

-- Tampilkan script SQL untuk membuat tabel barang
SHOW CREATE TABLE barang;

DESC barang;

ALTER TABLE barang 
MODIFY jumlah INT AFTER nama;

ALTER TABLE barang
ADD COLUMN salah TEXT;

ALTER TABLE barang
DROP COLUMN salah;

ALTER TABLE barang
RENAME COLUMN jumlah TO quantity;

ALTER TABLE barang
RENAME COLUMN quantity TO jumlah;

ALTER TABLE barang
ADD COLUMN deskripsi TEXT;

ALTER TABLE barang
	MODIFY COLUMN id INT NOT NULL,
	MODIFY COLUMN nama VARCHAR(100) NOT NULL DEFAULT "",
    MODIFY COLUMN harga INT NOT NULL DEFAULT 0,
    MODIFY COLUMN jumlah INT NOT NULL DEFAULT 0;
    
ALTER TABLE barang
ADD COLUMN created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP;

ALTER TABLE barang
ADD PRIMARY KEY (id);

-- Reset tabel barang (dikosongkan dan dibuat baru)
TRUNCATE barang;

-- Hapus tabel barang 
-- DROP TABLE barang;

INSERT INTO barang(id, nama, jumlah, harga) 
VALUES (1, 'Buku Biografi', 20, 35000);

SELECT * from barang;

