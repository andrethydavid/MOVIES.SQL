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








