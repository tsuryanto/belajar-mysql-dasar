-- COBA CROSS JOIN 

CREATE TABLE numbers(
	id INT NOT NULL,
    PRIMARY KEY (id)
) ENGINE = InnoDB;

DESC numbers;

INSERT INTO numbers(id) VALUES (1),(2),(3),(4),(5),(6),(7),(8),(9),(10);

SELECT * FROM numbers;

SELECT numbers1.id AS id1, numbers2.id AS id2, (numbers1.id * numbers2.id) AS hasil_kali
FROM numbers AS numbers1
CROSS JOIN numbers AS numbers2
ORDER BY numbers1.id, numbers2.id;