-- Pada TRANSACTION dilakukan LOCKING otomatis

START TRANSACTION;

SELECT * FROM guestbooks ORDER BY id DESC;

UPDATE guestbooks
SET title = 'Diubah oleh User 1'
WHERE id = 9;

COMMIT;