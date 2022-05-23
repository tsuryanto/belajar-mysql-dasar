START TRANSACTION;

SELECT * FROM guestbooks;

-- Ini akan menunggu selama user 1 belum melakukan commit
-- karena mysql otomatis melakukan blocing pada transaction
UPDATE guestbooks
SET title = 'Diubah oleh User 2'
WHERE id = 9;

COMMIT;

START TRANSACTION;

SELECT * FROM products WHERE id = 'P0001' FOR UPDATE;

UPDATE products 
SET quantity = quantity - 10
WHERE id = 'P0001';

COMMIT;