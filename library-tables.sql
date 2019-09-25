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
VALUES ('Como Programar Volumen 1', 'Raul Rios', '2015-08-24',50),
       ('Hija de humo y hueso', 'Valeria Medina', '2011-09-23',5),
       ('El Jardin Perdido', 'Kate Austen', '2014-04-03',150);

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
       ('Arlet', 'Rodriguez'),
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