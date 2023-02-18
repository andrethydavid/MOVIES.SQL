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

>al haber un insert en un tabla duplica ese registro en otra tabla

``````

CREATE OR REPLACE FUNCTION duplicate_records()
RETURNS trigger
LANGUAGE plpgsql
AS $$
BEGIN
  -- NEW es el registro que se acaba de hacer insert
  INSERT INTO aaab(bbba, ccca)
  VALUES (NEW.bbb, NEW.ccc);
  
  RETURN NEW;
END
$$;

-- creando el trigger
CREATE TRIGGER aaa_changes
  BEFORE INSERT
  ON aaa
  FOR EACH ROW
  EXECUTE PROCEDURE duplicate_records();

-- insertando valores para probar el trigger
INSERT INTO aaa(bbb, ccc)
VALUES ('abcde', 'efghi');

```

![image](https://user-images.githubusercontent.com/72534486/219828263-151a6179-d15c-4c59-9f6f-50c0138fd0b3.png)


![image](https://user-images.githubusercontent.com/72534486/219828364-fd2b4504-4433-429b-b09e-76c315bb2500.png)

