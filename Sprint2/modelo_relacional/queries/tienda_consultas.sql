USE tienda;

#Ejercicio MYSQL queries

#1
SELECT nombre FROM producto;

#2
SELECT nombre, precio FROM producto
;
#3
SELECT * FROM producto;

#4  euros a dolares * 1.17
SELECT nombre, precio AS 'precio en euros', (precio*1.17) AS 'precio en dolares' FROM producto;

#5
SELECT nombre AS 'producto', precio AS 'euros', (precio*1.17) AS 'dolares' FROM producto;

#6
SELECT UPPER(nombre), precio FROM producto;

#7
SELECT LOWER(nombre), precio FROM producto;

#8
SELECT nombre, UPPER(SUBSTRING(nombre , 1, 2)) AS'abrviatura' FROM fabricante;

#9
SELECT nombre, ROUND(precio) FROM producto;

#10
SELECT nombre, TRUNCATE(precio, 0) FROM producto;

#11
SELECT codigo_fabricante, nombre FROM producto;

#12
SELECT DISTINCT codigo_fabricante FROM producto;

#13
SELECT nombre FROM fabricante ORDER BY nombre;

#14
SELECT nombre FROM fabricante ORDER BY nombre DESC;

#15
SELECT nombre, precio FROM producto ORDER BY nombre, precio DESC;

#16
SELECT * FROM fabricante LIMIT 0, 5;

#17
SELECT * FROM fabricante LIMIT 3, 2;

#18
SELECT nombre, precio FROM producto ORDER BY precio LIMIT 1; 

#19
SELECT nombre, precio FROM producto ORDER BY precio DESC LIMIT 1;

#20
SELECT * FROM producto WHERE codigo_fabricante = 2;

#21
SELECT p.nombre, p.precio, f.nombre AS 'nombre fabricante' FROM producto p, fabricante f WHERE p.codigo_fabricante = f.codigo;

#22
SELECT p.nombre, p.precio, f.nombre AS 'nombre fabricante' FROM producto p, fabricante f WHERE p.codigo_fabricante = f.codigo ORDER BY f.nombre;

#23
SELECT p.codigo, p.nombre, f.codigo AS 'codigo fabricante', f.nombre AS 'nombre fabricante' FROM producto p, fabricante f WHERE p.codigo_fabricante = f.codigo; 

#24
SELECT p.nombre, p.precio, f.nombre FROM producto p, fabricante f WHERE p.codigo_fabricante = f.codigo AND precio = (SELECT MIN(precio) FROM producto);

#25
SELECT p.nombre, p.precio, f.nombre FROM producto p, fabricante f WHERE p.codigo_fabricante = f.codigo AND precio = (SELECT MAX(precio) FROM producto);

#26
SELECT p.nombre, f.nombre AS 'nombre fabricante' FROM producto p, fabricante f WHERE p.codigo_fabricante = f.codigo AND f.nombre = 'lenovo';

#27
SELECT p.nombre, f.nombre AS 'nombre fabricante' FROM producto p, fabricante f WHERE p.codigo_fabricante = f.codigo AND f.nombre = 'crucial' AND p.precio > 200;

#28
SELECT p.nombre, f.nombre FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre='asus' OR f.nombre='hewlett-packard' OR f.nombre ='seagate';

#29
SELECT p.nombre, f.nombre FROM producto p, fabricante f WHERE p.codigo_fabricante = f.codigo AND f.nombre IN ('asus', 'hewlett-packard', 'seagate');

#30
SELECT p.nombre, p.precio, f.nombre FROM producto p, fabricante f WHERE p.codigo_fabricante = f.codigo AND f.nombre LIKE '%e';

#31
SELECT p.nombre, p.precio, f.nombre FROM producto p, fabricante f WHERE p.codigo_fabricante = f.codigo AND f.nombre LIKE '%w%';

#32
SELECT p.nombre, p.precio, f.nombre FROM producto p, fabricante f WHERE p.codigo_fabricante = f.codigo AND p.precio > '180' ORDER BY p.precio DESC, p.nombre;

#33
SELECT f.codigo, f.nombre FROM fabricante f, producto p WHERE p.codigo_fabricante = f.codigo AND EXISTS (SELECT p.nombre FROM producto p);

#34
SELECT f.nombre AS 'fabricante', p.nombre FROM fabricante f LEFT JOIN producto p ON f.codigo = p.codigo_fabricante;

#35
SELECT f.nombre AS 'fabricante', p.nombre FROM fabricante f LEFT JOIN producto p ON f.codigo = p.codigo_fabricante WHERE p.nombre IS NULL;

#36
SELECT p.nombre, f.nombre FROM producto p, fabricante f WHERE p.codigo_fabricante = f.codigo AND f.nombre = 'lenovo';

#37
SELECT * FROM producto WHERE precio=(SELECT MAX(p.precio) FROM fabricante f, producto p WHERE  p.codigo_fabricante = f.codigo AND f.nombre = 'lenovo');

#38
SELECT p.nombre, MAX(p.precio), f.nombre FROM producto p, fabricante f WHERE p.codigo_fabricante = f.codigo AND f.nombre = 'lenovo';

#39
SELECT p.nombre, MIN(p.precio), f.nombre FROM producto p, fabricante f WHERE p.codigo_fabricante = f.codigo AND f.nombre = 'hewlett-packard';

#40
SELECT * FROM producto WHERE precio>=(SELECT MAX(precio) FROM producto INNER JOIN fabricante f ON codigo_fabricante = f.codigo WHERE f.nombre = 'lenovo');

#41
SELECT p.nombre, p.precio, f.nombre FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE p.precio>(SELECT AVG(p.precio) FROM producto p INNER JOIN fabricante f ON codigo_fabricante = f.codigo WHERE f.nombre='asus') AND f.nombre='asus';







 
