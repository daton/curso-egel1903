--CREACION DE LA TABLA PELICULA
CREATE TABLE PELICULA(ID_PELICULA INTEGER,
TITULO VARCHAR2(50), SINOPSIS VARCHAR2(250),
CONSTRAINT PK_ID_PELICULA PRIMARY KEY (ID_PELICULA)  );

--CREACION DE LA TABLA SALA
CREATE TABLE SALA(NUMERO_SALA INTEGER,
ID_PELICULA INTEGER, NUMERO_ASIENTOS INTEGER,
CONSTRAINT PK_NUMERO_SALA PRIMARY KEY (NUMERO_SALA),
CONSTRAINT FK1_ID_PELICULA FOREIGN KEY (ID_PELICULA) 
REFERENCES PELICULA(ID_PELICULA) );

-- GENERAMOS LA SECUENCIA QUE NOS INCREMENTARA EL ID_PELICULA
CREATE SEQUENCE SEC_PELICULA
START WITH 1
INCREMENT BY 1
NOMAXVALUE;--



--GENERAMOS UN PROCEDIMIENTO ALMACENADO PARA ASOCIAR
--NUESTRA SECUENCIA A NUESTRA TABLA PELICULA

CREATE OR REPLACE PROCEDURE GUARDAR_PELICULA( MY_ID OUT INTEGER,
MY_TITULO IN VARCHAR2, MY_SINOPSIS IN VARCHAR2)
AS
BEGIN
--INICIA LA LOGICA DE ASOCIACION DE LA SEC A LA TABLA
SELECT SEC_PELICULA.NEXTVAL INTO MY_ID FROM DUAL;
INSERT INTO PELICULA VALUES(MY_ID, MY_TITULO, MY_SINOPSIS);
END;
/

--PROCEDIMIENTO ALMACENADO PARA GUARDAR UNA SALA

CREATE OR REPLACE PROCEDURE GUARDAR_SALA(MY_NUM_SALA IN INTEGER,
MY_ID_PELICULA IN INTEGER, MY_NUM_ASIENTOS IN INTEGER)AS
BEGIN
INSERT INTO SALA VALUES(MY_NUM_SALA, MY_ID_PELICULA, MY_NUM_ASIENTOS);
END;
/






