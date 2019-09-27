-- Creando una tabla de datos con cierto formato
CREATE TABLE books (
  bookid INT NOT NULL AUTO_INCREMENT,
  title VARCHAR(250) NOT NULL,
  author VARCHAR(250) NOT NULL,
  published DATE NOT NULL,
  stock INT NOT NULL,
  PRIMARY KEY (bookid)
);

-- Insertando datos en una tabla
INSERT INTO books (title, author, published, stock)
VALUES ('Don Quijote de la Mancha', 'Miguel de Cervantes', '2012-03-02',5),
       ('Historia de dos ciudades', 'Charles Dickens', '1989-02-16',120),
       ('El Señor de los Anillos', 'J. R. R. Tolkien', '2009-02-25',189),
       ('El principito', 'Antoine de Saint-Exupéry', '2003-07-09',245),
       ('El Hobbit', 'J. R. R. Tolkien', '2004-08-22',1),
       ('Sueño en el pabellón rojo', 'Cao Xueqin', '2010-06-28',283),
       ('Las aventuras de Alicia en el país de las maravillas', 'Lewis Carroll', '2000-08-30',130),
       ('Triple representatividad', 'Jiang Zemin', '2008-01-15',12),
       ('Y no quedó ninguno (Diez negritos)', 'Agatha Christie', '2005-04-19',489),
       ('El león, la bruja y el armario', 'C. S. Lewis', '2009-05-01',98),
       ('Ella', 'Henry Rider Haggard', '2014-05-18',48),
       ('El código Da Vinci', 'Dan Brown', '2011-10-16',188),
       ('El guardián entre el centeno', 'J. D. Salinger', '2018-08-13',101),
       ('El alquimista', 'Paulo Coelho', '2002-07-19',90),
       ('El camino a Cristo', 'Ellen G. White', '2009-05-23',20),
       ('Heidi', 'Johanna Spyri', '2001-03-27',38),
       ('El libro del sentido del común del cuidado de bebés y niños (Tu hijo)', 'Dr. Benjamin Spock', '2017-08-25',290),
       ('Ana de las Tejas Verdes', 'Lucy Maud Montgomery', '2012-10-22',498),
       ('Azabache (Bella Negra)', 'Anna Sewell', '2015-12-29',304),
       ('El nombre de la rosa', 'Umberto Eco', '1999-02-05',222);


-- Creando tabla de usuarios
CREATE TABLE members (
  memberid INT NOT NULL AUTO_INCREMENT,
  firstname VARCHAR(250) NOT NULL,
  lastname VARCHAR(250) NOT NULL,
  PRIMARY KEY (memberid)
);

-- Insertando datos en una tabla
INSERT INTO members (firstname, lastname)
VALUES ('Carlos', 'Diaz'),
       ('Sofia', 'Vergara'),
       ('Julio', 'Guevara'),
       ('Scarlet', 'Gomez'),
       ('Valeria', 'Bracamontes'),
       ('Aimee', 'Gonzalez'),
       ('Cesar', 'Piñeda'),
       ('Daniel', 'Vazquez'),
       ('Jose', 'Palacios'),
       ('Roberto', 'Bolaños');

-- Insertando una nueva columna
ALTER TABLE members
ADD cellphone VARCHAR(10);

-- Update de varios campos
UPDATE members
SET cellphone = '3334053998'
WHERE memberid = 1

-- Insertando miembro nuevo ya con el campo de cellphone
INSERT INTO members (firstname, lastname, cellphone)
VALUES ('Alfredo', 'Cardenas', '8789476509');

-- Borrar una fila
DELETE FROM members WHERE memberid = 6;

-- Insertando una nueva columna en members country
ALTER TABLE members
ADD country VARCHAR(50) NOT NULL;

-- Agregando Default en campo de country como Mexico
ALTER TABLE members ALTER country SET DEFAULT 'Mexico'

-- Creando nueva tabla de libros prestados
CREATE TABLE borrowings (
  borrowingid INT NOT NULL AUTO_INCREMENT,
  bookid INT NOT NULL,
  memberid INT NOT NULL,
  borrowdate DATE NOT NULL,
  returndate DATE NOT NULL,
  PRIMARY KEY (borrowingid),
  FOREIGN KEY (bookid) REFERENCES books(bookid),
  FOREIGN KEY (memberid) REFERENCES members(memberid)
);

--
INSERT INTO borrowings (bookid, memberid, borrowdate, returndate)
VALUES (3, 1, '2019-09-23', '2020-01-01'),
       (2, 3, '2019-02-23', '2020-08-05'),
       (13, 6, '2019-08-28', '2020-08-09'),
       (1, 9, '2019-05-10', '2020-01-30'),
       (4, 10, '2019-02-12', '2020-04-30'),
       (11, 2, '2019-09-15', '2020-07-25'),
       (7, 1, '2019-05-11', '2020-10-22'),
       (2, 4, '2019-02-10', '2020-12-21'),
       (10, 8, '2019-01-22', '2020-08-22'),
       (5, 10, '2019-01-23', '2019-03-23');

-- Usando INNER JOIN
SELECT *
FROM books
INNER JOIN borrowings
  ON books.bookid = borrowings.borrowingid;

-- Usando INNER JOIN
SELECT *
FROM books
INNER JOIN borrowings
  ON books.bookid = borrowings.borrowingid
INNER JOIN members
  ON members.memberid = borrowings.memberid;

-- Usando ALIAS en los queries
SELECT *
FROM books AS b
INNER JOIN borrowings AS bor
  ON b.bookid = bor.borrowingid;

-- Usando ALIAS en los queries
SELECT *
FROM books AS b
INNER JOIN borrowings AS bor
  ON b.bookid = bor.borrowingid
INNER JOIN members AS m
  ON m.memberid = bor.memberid;

-- Query para saber cual libro se ha rentado mas veces
SELECT b.title, COUNT(b.title) AS total_veces_rentado
FROM books AS b
INNER JOIN borrowings AS bor
  ON b.bookid = bor.bookid
  GROUP BY b.title
  ORDER BY total_veces_rentado DESC;

-- Cuales libros han rentado las personas.
SELECT CONCAT (m.firstname, ' ', m.lastname) AS fullname, b.title
FROM borrowings AS bor
INNER JOIN members AS m ON m.memberid = bor.memberid
INNER JOIN books AS b ON b.bookid = bor.bookid
GROUP BY fullname, b.title
ORDER BY fullname;

-- Al día de hoy que libros hay rentados y quien los tiene
SELECT CONCAT (m.firstname, ' ', m.lastname) AS fullname, b.title, bor.borrowdate, bor.returndate
FROM borrowings AS bor
INNER JOIN members AS m ON m.memberid = bor.memberid
INNER JOIN books AS b ON b.bookid = bor.bookid
WHERE CURDATE() BETWEEN bor.borrowdate AND bor.returndate
GROUP BY fullname, b.title, bor.borrowdate, bor.returndate
ORDER BY fullname;

-- Reporte de cuantos libros se rentan por mes
SELECT CONCAT(MONTHNAME(borrowdate), '-', YEAR(borrowdate)) AS monunt_name,
      COUNT(*) rented_books
FROM borrowings
GROUP BY monunt_name;