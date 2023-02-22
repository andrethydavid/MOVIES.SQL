CREATE TABLE  ordenes (
    ID serial NOT NULL PRIMARY KEY,
	info json NOT null

)

CREATE TABLE ordenes (
   ID serial NOT NULL PRIMARY KEY,
   info json NOT NULL
);

INSERT INTO ordenes (info)
VALUES
   (
      '{ "cliente": "David Sanchez", "items": {"producto": "Biberón","cantidad": 24}}'
   ),
   (
      '{ "cliente": "Edna Cardenas", "items": {"producto": "Carro de juguete","cantidad": 1}}'
   ),
   (
      '{ "cliente": "Israel Vazquez", "items": {"producto": "Tren de juguete","cantidad": 2}}'
   );

SELECT
   info -> 'cliente' AS cliente
FROM
   ordenes;

SELECT
   info ->> 'cliente' AS cliente
FROM
   ordenes
WHERE
   info -> 'items' ->> 'producto' = 'Biberón'
   
   
Agregando objetos
   
   
SELECT
   MIN (
      CAST (
         info -> 'items' ->> 'cantidad' AS INTEGER
      )
   ),
   MAX (
      CAST (
         info -> 'items' ->> 'cantidad' AS INTEGER
      )
   ),
   SUM (
      CAST (
         info -> 'items' ->> 'cantidad' AS INTEGER
      )
   ),
   AVG (
      CAST (
         info -> 'items' ->> 'cantidad' AS INTEGER
      )
   )
FROM
   ordenes;   
   
   
   
   