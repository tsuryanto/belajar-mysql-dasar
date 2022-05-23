CREATE TABLE guestbooks(
	id INT NOT NULL AUTO_INCREMENT,
    email VARCHAR(100),
    title VARCHAR(200),
    content TEXT,
    PRIMARY KEY (id)
) ENGINE = InnoDB;

DESC guestbooks;

INSERT INTO guestbooks(email, title, content)
VALUES 	('guest@gmail.com', 'Hello', 'Hello'),
		('guest2@gmail.com', 'Hello', 'Hello'),
        ('guest3@gmail.com', 'Hello', 'Hello'),
        ('tsuryanto16@gmail.com', 'Hello', 'Hello'),
        ('tsuryanto16@gmail.com', 'Hello', 'Hello'),
        ('tsuryanto16@gmail.com', 'Hello', 'Hello');        
        
SELECT * FROM guestbooks;

-- Menggabungkan data dari 2 query
-- Dimana data yang duplikat antar tabel tidak dimunculkan
-- UNION otomatid meng DISTINCT masing2 tabel
SELECT email from customers
UNION
SELECT email from guestbooks;

-- Menggabungkan data dari 2 query
-- Dimana data yang duplikat antar tabel dimunculkan
SELECT email from customers
UNION ALL
SELECT email from guestbooks;

-- Mengetahui berapa kali muncul nya masing-masing email
SELECT emails.email, COUNT(emails.email)
FROM 	(SELECT email from customers
		UNION ALL
		SELECT email from guestbooks) AS emails
GROUP BY emails.email;

-- INTERSECT adalah operasi menggabungkan dua query, 
-- namun yang diambil hanya data yang terdapat pada hasil query pertama dan query kedua
-- mirip seperti INNER join 
-- Di MySQL tidak ada syntax INTERSEC cara mengunakannya bisa seperti dibawah ini

SELECT email from customers
WHERE email IN (SELECT DISTINCT email from guestbooks);

SELECT DISTINCT customers.email from customers
JOIN guestbooks ON (customers.email = guestbooks.email);

-- MINUS adalah operasi dimana query pertama akan dihilangkan oleh query kedua.
-- Jika ada data di query portama yang sama dengan data di query kedua, maka data tersebut dihapus dari hasil query MINUS
-- di Mysql tidak ada operator MINUS, bisakita lakukan menggunakan JOIN

SELECT DISTINCT customers.email 
FROM customers 
LEFT JOIN guestbooks ON (customers.email = guestbooks.email)
WHERE guestbooks.email IS NULL;

-- TRANSACTION
-- Hanya bisa dilakukan operasi DML , yaitu syntax untuk mengolah data
-- Operasi DDL (syntax untuk mengubah struktur tabel) tidak bisa digunakan di transaction

START TRANSACTION;
INSERT INTO guestbooks (email, title, content)
VALUES	('contoh@gmail.com', 'Contoh', 'Contoh'),
		('contoh1@gmail.com', 'Contoh', 'Contoh'),
        ('contoh2@gmail.com', 'Contoh', 'Contoh');
SELECT * FROM guestbooks;
-- Sampai sini data berhasil masuk ,
-- namun jika diakses dari user/aplikasi lain, data belum ada karena transaction belum di commit
COMMIT; 
-- Setelah di commit, data akan fully tersimpan dan bisa diakses oleh aplikasi/user lain
-- untuk membatalkan aksi , jangan di commit, tapi menggunakan perintah ROLLBACK;

START TRANSACTION;
DELETE FROM guestbooks WHERE id > 1; -- Data dihapus , tapi belum permanen
SELECT * FROM guestbooks;
ROLLBACK; -- Data terhapus dikembalikan

SELECT * FROM guestbooks;