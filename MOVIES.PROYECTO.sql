select
	peliculas.pelicula_id as id,
	peliculas.titulo,
	count(1) as numero_rentas
from
	rentas
inner join inventarios on
	rentas.inventario_id = inventarios.inventario_id
inner join peliculas on
	peliculas.pelicula_id = inventarios.pelicula_id
group by
	peliculas.pelicula_id,
	peliculas.titulo
order by
	numero_rentas desc
limit 10;

#Usando rank y percent rank

SELECT 
	p.pelicula_id AS id,
	p.titulo,
	COUNT(*) AS numero_rentas,
	DENSE_RANK() OVER (ORDER BY COUNT(*) DESC) AS lugar
FROM rentas AS r
JOIN inventarios AS i
ON   r.inventario_id = i.inventario_id
JOIN peliculas AS p
ON   i.pelicula_id = p.pelicula_id
GROUP BY p.pelicula_id
ORDER BY numero_rentas DESC;


# Ordenando datos geográficos

select ciudades.ciudad_id,
	   ciudades.ciudad,
	   count(*) as renta_por_ciudad
from   ciudades
	inner join direcciones on ciudades.ciudad_id = direcciones.ciudad_id
	inner join tiendas on tiendas.direccion_id = direcciones.direccion_id
	inner join inventarios on inventarios.tienda_id = tiendas.tienda_id
	inner join rentas on inventarios.inventario_id = rentas.inventario_id
group by ciudades.ciudad_id;