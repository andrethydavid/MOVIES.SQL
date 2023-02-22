# PROYECTO

* debes usara la base de datos que esta en el github movies
* esta base de datos se realiza con lenguaje sql-posgres 

Vamos a realizar la creacion de nuevas tablas generando nuevas funciones sql y plpsql

```
CREATE OR REPLACE PROCEDURE test_drpcreate_procedure()
LANGUAGE SQL
AS $$
	DROP TABLE IF EXISTS aaa;
	CREATE TABLE aaa (bbb char(5) CONSTRAINT firstkey PRIMARY KEY);
$$;
CALL test_drpcreate_procedure();

```

```
CREATE OR REPLACE FUNCTION test_dropcreate_function()
RETURNS VOID
LANGUAGE plpgsql
AS $$
BEGIN
	DROP TABLE IF EXISTS aaa;
	CREATE TABLE aaa(bbb char(5) CONSTRAINT firstkey PRIMARY KEY, ccc char(5));
	DROP TABLE IF EXISTS aaab;
	CREATE TABLE aaab (bbba char(5) CONSTRAINT secondkey PRIMARY KEY,ccca char(5));
END
$$;
SELECT test_dropcreate_function();

```

![image](https://user-images.githubusercontent.com/72534486/219827469-adaed4dd-561e-4a54-b8f3-0d6b606f468c.png)


Vamos a realizar el conteo total de peliculas  

```
CREATE OR REPLACE FUNCTION count_total_movies()
RETURNS int
LANGUAGE plpgsql
AS $$
BEGIN
  RETURN COUNT(*) FROM peliculas;
END
$$;

SELECT count_total_movies();

```

![image](https://user-images.githubusercontent.com/72534486/219827928-c09eac73-9a3d-47a8-9330-005c8c157722.png)


#  Agregación de datos


```
SELECT MAX (precio_renta)
from peliculas


```
![image](https://user-images.githubusercontent.com/72534486/219989838-45144d53-6f9d-42b6-8d0d-fc72c8c8ebd5.png)

```
SELECT titulo, MAX (precio_renta)
FROM peliculas 
GROUP BY titulo;


```

![image](https://user-images.githubusercontent.com/72534486/219990110-d9b80bcb-c250-4747-9296-cbf472169e19.png)

# CLASIFIACAION DE LAS PELICULAS POR GENERO 

```
SELECT clasificacion, COUNT(*)
FROM peliculas 
GROUP BY clasificacion;

```
![image](https://user-images.githubusercontent.com/72534486/219990455-8f7bb0bb-7eac-4f75-93f8-2cd00c102785.png)

# PRECIO  PROMEDIO POR RENTA 

```
SELECT AVG (precio_renta)
FROM peliculas;


```
![image](https://user-images.githubusercontent.com/72534486/219990646-3585ec87-d1b1-4573-add2-7561fb4a7db2.png)


# PRECIO PROMECIO POR PELICULA SEGUN EL GENENERO 

```
SELECT clasificacion, AVG(precio_renta) AS precio_promedio
FROM peliculas
GROUP BY  clasificacion
ORDER BY precio_promedio DESC;


```
![image](https://user-images.githubusercontent.com/72534486/219991114-9dcb2001-a9a0-4ad3-aaac-29e442f11154.png)

# duracion por regresar las peliculas por renta 

```

SELECT clasificacion, AVG(precio_renta) AS duracion_renta_promedio
FROM peliculas
GROUP BY  clasificacion
ORDER BY duracion_renta_promedio DESC;

```
![image](https://user-images.githubusercontent.com/72534486/219991394-f9f305a4-afac-4214-a054-815ee1813746.png)


Una caracteristica muy importante de PostgreSQL es su capacidad de trabajar con estructuras JSON.


* JSON Texto plano - Es unicamente un string de texto.
* JSON Binary - Es más rápido de procesar ya que se guarda como un archivo binario.
* El uso de objetos nos dará más flexibilidad en el trabajo.


```

CREATE TABLE  ordenes (
    ID serial NOT NULL PRIMARY KEY,
	info json NOT null

)
```


