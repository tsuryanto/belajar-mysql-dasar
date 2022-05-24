
-- @localhost berarti dia hanya bisa mengakses dari localhost aplikasi
-- @% berarti user bisa mengakses dari mana saja , dari mana saja dan dengan apa saja
-- @198.20.20.2 user hanya bisa mengakses dari IP ini 

CREATE USER 'taufiq'@'localhost';
CREATE USER 'suryanto'@'%';

GRANT SELECT ON belajar_mysql.* TO 'taufiq'@'localhost';
GRANT SELECT ON belajar_mysql.* TO 'suryanto'@'%';
GRANT INSERT, UPDATE, DELETE ON belajar_mysql.* TO 'suryanto'@'%';

SHOW GRANTS FOR 'taufiq'@'localhost';
SHOW GRANTS FOR 'suryanto'@'%';

SET PASSWORD FOR 'taufiq'@'localhost' = 'rahasia';
SET PASSWORD FOR 'suryanto'@'%' = 'rahasia';