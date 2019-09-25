CREATE TABLE books (
  bookid INT NOT NULL AUTO_INCREMENT,
  title VARCHAR(250) NOT NULL,
  author VARCHAR(250) NOT NULL,
  published DATE NOT NULL,
  stock INT NOT NULL,
  PRIMARY KEY (bookid)
);

INSERT INTO books (title, author, published, stock)
VALUES ('Como Programar Volumen 1', 'Raul Rios', '2015-08-24',50),
       ('Hija de humo y hueso', 'Valeria Medina', '2011-09-23',5),
       ('El Jardin Perdido', 'Kate Austen', '2014-04-03',150);