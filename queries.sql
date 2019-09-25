-- Selecciona los libros donde su stock sea menor que 10
SELECT * FROM books WHERE stock < 10

-- Muestra el registro mas viejo
SELECT * FROM books ORDER BY published ASC LIMIT 1;

-- Muestra el registro mas viejo
SELECT * FROM books WHERE published = (SELECT MIN(published) FROM books);