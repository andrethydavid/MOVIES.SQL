SELECT	ciudad,
	COUNT(cliente_id) AS n
FROM clientes AS c
INNER JOIN direcciones AS d ON c.direccion_id = d.direccion_id
INNER JOIN ciudades AS ci ON d.ciudad_id = ci.ciudad_id
GROUP BY ciudad
ORDER BY n DESC

SELECT MAX (precio_renta)
from peliculas;

SELECT titulo, MAX (precio_renta)
FROM peliculas 
GROUP BY titulo;


SELECT clasificacion, COUNT(*)
FROM peliculas 
GROUP BY clasificacion;

SELECT AVG (precio_renta)
FROM peliculas;


SELECT clasificacion, AVG(precio_renta) AS duracion_renta_promedio
FROM peliculas
GROUP BY  clasificacion
ORDER BY duracion_renta_promedio DESC;









