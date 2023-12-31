-- Curso - Aprende Oracle SQL Desde Cero - Udemy - Ejercicios Resueltos

----------------------------------------------------------------------------------------------------------------------------
-- PRACTICAS CON SELECT
----------------------------------------------------------------------------------------------------------------------------

-- Visualizar el nombre y el n�mero de tel�fono de los empleados
SELECT CONCAT(CONCAT(first_name, ' '), last_name) AS name, phone_number AS phone FROM employees;

-- Visualizar el nombre y el tipo de trabajo de los empleados (FIRST_NAME, JOB_ID). 
-- Debe aparecer en la cabecera NOMBRE Y Tipo de Trabajo.
SELECT CONCAT(CONCAT(e.first_name, ' '), e.last_name) AS name, j.job_title AS "TIPO TRABAJO" 
FROM employees e JOIN jobs j USING(job_id);

-- Selecciona todas las columnas de la tabla REGIONS
SELECT * FROM regions;

-- Indicar los nombres de los pa�ses de la tabla COUNTRIES
SELECT country_name FROM countries;

-- Seleccionar las columnas STREET_ADDRESS, CITY, STATE_PROVINCE de la table LOCATIONS. 
-- Debemos poner las columnas como direcci�n, Ciudad y Estado
SELECT street_address AS direcci�n, city AS ciudad, state_province AS estado FROM locations;

----------------------------------------------------------------------------------------------------------------------------
-- PRACTICAS CON OPERADORES ARITMETICOS
----------------------------------------------------------------------------------------------------------------------------

-- Realizar una SELECT para visualizar el siguiente resultado. 
-- El impuesto es el 20% del salario.
SELECT first_name, salary AS "Bruto", (salary * 0.20) AS "Impuestos", 
(salary - salary * 0.20) AS "Neto" FROM employees;

-- Visualizar el salario anual de cada empleado, por 14 pagas. 
-- Debemos visualizar las columnas como Nombre, Salario y Salario Anual
SELECT CONCAT(CONCAT(first_name, ' '), last_name) AS "Nombre", salary AS "Salario",
(salary * 14) AS "Salario Anual" FROM employees; 

----------------------------------------------------------------------------------------------------------------------------
-- PRACTICAS CON LITERALES
----------------------------------------------------------------------------------------------------------------------------

-- Crear la consulta para visualizar los siguientes datos, usando el operador de
-- concatenaci�n ||
SELECT 'El empleado ' || first_name || ' del departamento ' || department_id || 
' tiene un salario de ' || salary AS "DATOS" FROM employees;

-- Crear la siguiente consulta
SELECT 'La calle ' || street_address || ' pertenece a la ciudad: ' || 
city AS "Calle y Ciudad" FROM locations;

----------------------------------------------------------------------------------------------------------------------------
-- PRACTICAS CON DISTINCT
----------------------------------------------------------------------------------------------------------------------------

-- Visualizar las ciudades donde hay departamentos, de la tabla locations. 
-- No deben salir repetidos
SELECT DISTINCT city FROM locations;

-- Visualizar los distintos tipos de JOB_ID por departamento de la tabla Employees
SELECT DISTINCT department_id, job_id FROM employees;

----------------------------------------------------------------------------------------------------------------------------
-- PRACTICAS CON WHERE
----------------------------------------------------------------------------------------------------------------------------

-- Averigua los empleados que trabajen en el departamento 100
SELECT * FROM employees WHERE department_id = 100;

-- Usando la tabla LOCATIONS, averigua el nombre de la Ciudad (city) y la direcci�n 
-- (Street_address) de los departamentos situados en Estados Unidos (COUNTRY_ID=US)
SELECT city, street_address FROM locations WHERE country_id = 'US';

-- Visualiza los pa�ses que est�n en la regi�n 3. (REGION_ID de la tabla COUNTRIES)
SELECT * FROM countries WHERE region_id = 3;

-- Averiguar el nombre y salario de los empleados que NO tengan como jefe al
-- MANAGER 114 (columna MANAGER_ID)
SELECT first_name, salary FROM employees WHERE manager_id != 114;

-- Visualizar los empleados que empezaron a trabajar a partir del a�o 2006
SELECT * FROM employees WHERE hire_date >= '01-01-06';

-- Seleccionar los empleados que tenga como tipo de trabajo �ST_CLERK�
SELECT * FROM employees WHERE job_id = 'ST_CLERK';

-- Indicar los datos de los empleados que tengan como apellidos �Smith� (LAST_NAME)
SELECT * FROM employees WHERE last_name = 'Smith';

----------------------------------------------------------------------------------------------------------------------------
-- PRACTICAS CON BETWEEN - IN
----------------------------------------------------------------------------------------------------------------------------

-- Averiguar los empleados que est�n entre el departamento 40 y el 60
SELECT * FROM employees WHERE department_id BETWEEN 40 AND 60;

-- Visualizar los empleados que entraron entre 2002 y 2004
SELECT * FROM employees WHERE hire_date BETWEEN '01-01-02' AND '31-12-04';

-- Indica los apellidos de los empleados que empiezan desde �D� hasta �G�
SELECT last_name FROM employees WHERE SUBSTR(last_name, 1, 1) BETWEEN 'D' AND 'G';
-- Solucion propuesta por el curso???
SELECT LAST_NAME FROM EMPLOYEES WHERE LAST_NAME BETWEEN 'D' AND 'H';

-- Averiguar los empleados de los departamentos 30,60 y 90. Hay que usar la cl�usula IN
SELECT * FROM employees WHERE department_id IN (30, 60, 90);

-- Averiguar los empleados que tienen el tipo de trabajo IT_PROG y PU_CLERK
SELECT * FROM employees WHERE job_id IN ('IT_PROG', 'PU_CLERK');

-- Indica las ciudades que est�n en Inglaterra (UK) y Jap�n (JP)...Tabla LOCATIONS
SELECT city FROM locations WHERE country_id IN ('UK', 'JP');

----------------------------------------------------------------------------------------------------------------------------
-- PRACTICAS CON LIKE
----------------------------------------------------------------------------------------------------------------------------

-- Indicar los datos de los empleados cuyo FIRST_NAME empieza por 'J'
SELECT * FROM employees WHERE first_name LIKE 'J%';

-- Averiguar los empleados que comienzan por 'S' y terminan en 'n'
SELECT * FROM employees WHERE first_name LIKE 'S%n';

-- Indicar los pa�ses que tienen una �r� en la segunda letra (Tabla COUNTRIES)
SELECT * FROM countries WHERE country_name LIKE '_r%';

----------------------------------------------------------------------------------------------------------------------------
-- PRACTICAS CON IS NULL
----------------------------------------------------------------------------------------------------------------------------

-- Listar las ciudades de la tabla LOCATIONS que no tienen STATE_PROVINCE
SELECT * FROM locations WHERE state_province IS NULL;

-- Averiguar el nombre, salario y comisi�n de aquellos empleados que tienen comisi�n. 
-- Tambi�n debemos visualizar una columna calculada denominada �Sueldo Total�, 
-- que sea el sueldo m�s la comisi�n
SELECT first_name, salary, commission_pct, salary + (salary * commission_pct) AS "Sueldo Total" 
FROM employees WHERE commission_pct IS NOT NULL;

----------------------------------------------------------------------------------------------------------------------------
-- PRACTICAS CON AND-OR-NOT
----------------------------------------------------------------------------------------------------------------------------

-- Obtener el nombre y la fecha de la entrada y el tipo de trabajo de los
-- empleados que sean IT_PROG y que ganen menos de 6000 d�lares
SELECT first_name, hire_date, job_id FROM employees 
WHERE job_id = 'IT_PROG' AND salary < 6000;

-- Seleccionar los empleados que trabajen en el departamento 50 o 80,
-- cuyo nombre comience por S y que ganen m�s de 3000 d�lares.
SELECT * FROM employees WHERE department_id IN (50, 80) AND first_name LIKE 'S%' AND salary > 3000;

-- �Qu� empleados de job_id IT_PROG tienen un prefijo 5 en el tel�fono
-- y entraron en la empresa en el a�o 2007?
SELECT * FROM employees WHERE job_id = 'IT_PROG' AND phone_number LIKE '5%' 
AND EXTRACT(YEAR FROM hire_date) = 2007;

SELECT * FROM employees WHERE job_id = 'IT_PROG' AND phone_number LIKE '5%' 
AND hire_date BETWEEN '01-01-07' AND '31-12-07';

SELECT * FROM employees WHERE job_id = 'IT_PROG' AND phone_number LIKE '5%' 
AND hire_date >= '01-01-07' AND hire_date <= '31-12-07'; 

----------------------------------------------------------------------------------------------------------------------------
-- PRACTICAS CON FUNCIONES TIPO CARACTER
----------------------------------------------------------------------------------------------------------------------------

/*
En la tabla LOCATIONS, averiguar las ciudades que son de Canada o
Estados unidos (Country_id=CA o US) y que la longitud del nombre de la
calle sea superior a 15.
*/
SELECT city, street_address, LENGTH(street_address) FROM locations 
WHERE country_id IN ('CA', 'US') AND LENGTH(street_address) > 15;

/*
Muestra la longitud del nombre y el salario anual (por 14) para los
empleados cuyo apellido contenga el car�cter 'b' despu�s de la 3�
posici�n.
*/
SELECT first_name, last_name, LENGTH(first_name), (salary * 14) AS "Annual Salary", 
INSTR(last_name, 'b') FROM employees WHERE INSTR(last_name, 'b') > 3;

/*
Averiguar los empleados que ganan entre 4000 y 7000 euros y que
tienen alguna 'a' en el nombre. (Debemos usar INSTR y da igual que sea
may�scula que min�sculas) y que tengan comisi�n.
*/
SELECT * FROM employees WHERE salary BETWEEN 4000 AND 7000 AND 
INSTR(LOWER(first_name), 'a') != 0 AND commission_pct IS NOT NULL;

-- Visualizar las iniciales de nombre y apellidos separados por puntos
SELECT first_name, last_name, SUBSTR(first_name, 1, 1) || '.' || 
SUBSTR(last_name, 1, 1) || '.' AS iniciales FROM employees;

-- Mostrar empleados donde el nombre o apellido comienza con S.
SELECT * FROM employees WHERE first_name LIKE 'S%' OR last_name LIKE 'S%';
SELECT * FROM employees WHERE INSTR(first_name, 'S') = 1 OR INSTR(last_name, 'S') = 1;
SELECT * FROM employees WHERE SUBSTR(first_name, 1, 1) = 'S' OR SUBSTR(last_name, 1, 1) = 'S';

/*
Visualizar el nombre del empleado, su salario, y con asteriscos, el n�mero miles de d�lares
que gana. Se asocia ejemplo. (PISTA: se puede usar RPAD. Ordenado por salario
*/
SELECT first_name, salary, RPAD('*', FLOOR(salary / 1000), '*') AS ranking, 
FLOOR(salary / 1000) AS "RANKING NUMBER" FROM employees ORDER BY salary DESC;

----------------------------------------------------------------------------------------------------------------------------
-- PRACTICAS CON FUNCIONES NUMERICAS
----------------------------------------------------------------------------------------------------------------------------

-- Visualizar el nombre y salario de los empleados de los que el n�mero de
-- empleado es impar (PISTA: MOD)
SELECT  employee_id, first_name, salary FROM employees WHERE MOD(employee_id , 2) != 0;

-- Prueba con los siguientes valores aplicando las funciones TRUNC y ROUND, con 1 y 2 decimales.
-- 25.67,0
-- 25.67,1
-- 25.34,1
-- 25.34,2
-- 25.67,-1
SELECT TRUNC(25.67, 0) FROM DUAL;
SELECT TRUNC(25.67, 1) FROM DUAL;
SELECT TRUNC(25.34, 1) FROM DUAL;
SELECT TRUNC(25.34, 2) FROM DUAL;
SELECT TRUNC(25.34, -1) FROM DUAL;
SELECT ROUND(25.67, 0) FROM DUAL;
SELECT ROUND(25.67, 1) FROM DUAL;
SELECT ROUND(25.34, 1) FROM DUAL;
SELECT ROUND(25.34, 2) FROM DUAL;
SELECT ROUND(25.34, -1) FROM DUAL;

----------------------------------------------------------------------------------------------------------------------------
-- PRACTICAS CON FUNCIONES DE FECHA
----------------------------------------------------------------------------------------------------------------------------

-- Indicar el n�mero de d�as que los empleados llevan en la empresa
SELECT first_name, hire_date, TRUNC(SYSDATE - hire_date, 0) AS "DAYS SINCE HIRE" FROM employees;

-- Indicar la fecha que ser� dentro de 15 d�as
SELECT SYSDATE + 15 AS "FUTURE DATE" FROM DUAL;

-- �Cu�ntos MESES faltan para la navidad? La cifra debe salir redondeada, con 1 decimal
SELECT ROUND(MONTHS_BETWEEN('25-12-23', SYSDATE), 1) AS "MONTHS UNTIL CHRISTMASS" FROM DUAL;

-- Indicar la fecha de entrada de un empleado y el �ltimo d�a del mes que entr�
SELECT first_name, hire_date, LAST_DAY(hire_date) FROM employees;

-- Utilizando la funci�n ROUND, indicar los empleados que entraron en los 
-- �ltimos 15 d�as de cada mes.
SELECT first_name, hire_date FROM employees WHERE ROUND(LAST_DAY(hire_date) - hire_date) <= 15;

----------------------------------------------------------------------------------------------------------------------------
-- PRACTICAS CON CONVERSION TO_CHAR
----------------------------------------------------------------------------------------------------------------------------

-- Indicar los empleados que entraron en Mayo en la empresa. Debemos
-- buscar por la abreviatura del mes
SELECT first_name, hire_date, TO_CHAR(hire_date, 'MON') AS "MONTH HIRE" 
FROM employees WHERE TO_CHAR(hire_date, 'MON') = 'MAY';

-- Indicar los empleados que entraron en el a�o 2007 usando la funci�n to_char
SELECT first_name, hire_date FROM employees WHERE TO_CHAR(hire_date, 'YY') = 07;
SELECT first_name, hire_date FROM employees WHERE TO_CHAR(hire_date, 'YYYY') = 2007;

-- �Qu� d�a de la semana (en letra) era el d�a que naciste?
SELECT TO_CHAR(TO_DATE('10-10-2010'), 'DAY') AS "DAY OF BIRTH" FROM DUAL;

/*
Averiguar los empleados que entraron en el mes de Junio. Debemos preguntar por el 
mes en letra. Nota: La funci�n TO_CHAR puede devolver espacios a la derecha)
*/
SELECT first_name, hire_date, '[' || TO_CHAR(hire_date, 'MONTH') || ']' AS "RIGHT SPACES" FROM employees;

SELECT first_name, hire_date, TO_CHAR(hire_date, 'MONTH') AS "HIRE MONTH" FROM employees 
WHERE RTRIM(TO_CHAR(hire_date, 'MONTH')) = 'JUNIO';

/*
Visualizar el salario de los empleados con dos decimales y en d�lares y tambi�n en la 
moneda local (el ejemplo es con euros, suponiendo que el cambio est� en 0,79$)
*/
SELECT first_name, salary, TO_CHAR(salary, '$99,999.99') AS "DOLARES", 
TO_CHAR(salary * 8.75, 'L999,999.99') AS "COLONES(Deprecated)" FROM employees; 

----------------------------------------------------------------------------------------------------------------------------
-- PRACTICAS CON CONVERSION TO_DATE Y TO_NUMBER
----------------------------------------------------------------------------------------------------------------------------

-- Convertir las siguientes cadenas a n�meros '1210.73' �$127.2�
SELECT TO_NUMBER('1210.73') FROM DUAL;
SELECT TO_NUMBER('$127.2', '$999.9') FROM DUAL;

-- Convertir los 3 primeros caracteres del n�mero de tel�fono en n�meros y
-- multiplicarlos por 2.
SELECT phone_number, (TO_NUMBER(SUBSTR(phone_number, 1,3)) * 2) AS RESULT FROM employees;

/*
Convertir las siguientes cadenas en fecha (NOTA: el mes lo debemos poner en el idioma que 
tengamos en el SqlDeveloper. Por ejemplo, en espa�ol ser�a

10 DE FEBRERO DE 2018
FACTURA: MARZO0806
*/
SELECT TO_DATE(REPLACE('10 DE FEBRERO DE 2018', ' DE ', '-'), 'DD-MONTH-YYYY') AS RESULT FROM DUAL;
SELECT TO_DATE('10 DE FEBRERO DE 2018', 'DD "DE" MONTH "DE" YYYY') AS RESULT FROM DUAL;

SELECT TO_DATE(REPLACE('FACTURA: MARZO0806', 'FACTURA: ', ''), 'MONTHDDYY') AS RESULT FROM DUAL;
SELECT TO_DATE('FACTURA: MARZO0806', '"FACTURA:" MONTHDDYY') AS RESULT FROM DUAL;

----------------------------------------------------------------------------------------------------------------------------
-- PRACTICAS CON NULOS
----------------------------------------------------------------------------------------------------------------------------

/*
De la tabla LOCATIONS visualizar el nombre de la ciudad y el estadoprovincia. 
En el caso de que no tenga que aparezca el texto �No tiene�
*/
SELECT city, NVL(state_province, 'No tiene') AS STATE_PROVINCE FROM locations;

/*
Visualizar el salario de los empleados incrementado en la comisi�n
(PCT_COMMISSION). Si no tiene comisi�n solo debe salir el salario
*/
SELECT first_name, commission_pct, salary,NVL2(commission_pct, salary + (salary * commission_pct), 
salary) AS TOTAL FROM employees;

-- Seleccionar el nombre del departamento y el manager_id. Si no tiene, debe salir un -1
SELECT department_name, NVL(manager_id, -1) AS MANAGER_ID FROM departments;

-- De la tabla LOCATIONS, devolver NULL si la ciudad y la provincia son
-- iguales. Si no son iguales devolver la CITY.
SELECT NULLIF(city, state_province) AS "NULL WHEN CITY = PROVINCE" FROM locations;

----------------------------------------------------------------------------------------------------------------------------
-- PRACTICAS CON EXPRESIONES CONDICIONALES
----------------------------------------------------------------------------------------------------------------------------

/*
Visualizar los siguientes datos con CASE.
- Si el departamento es 50 ponemos Transporte
- Si el departamento es 90 ponemos Direcci�n
- Cualquier otro n�mero ponemos �Otro departamento�
*/
SELECT 
    first_name, 
    department_id, 
    CASE department_id  
        WHEN 50 THEN 'Transporte'
        WHEN 90 THEN 'Direccion'
        ELSE 'Otro departamento'
    END AS RESULT
FROM employees;

/*
Mostrar de la tabla LOCATIONS, la ciudad y el pa�s. Ponemos los
siguientes datos dependiendo de COUNTRY_ID.
- Si es US y CA ponemos Am�rica del Norte
- Si es CH, UK, DE,IT ponemos Europa
- Si es BR ponemos Am�rica del Sur
- Si no es ninguno ponemos �Otra zona�
*/
SELECT 
    city, 
    country_id,
    CASE 
        WHEN country_id IN ('US', 'CA') THEN 'Am�rica del Norte'
        WHEN country_id IN ('CH', 'UK', 'DE', 'IT') THEN 'Europa'
        WHEN country_id IN ('BR') THEN 'Am�rica del Sur'
        ELSE 'Otra zona'
    END AS RESULT
FROM locations;

-- Realizar el primer ejercicio con DECODE en vez de con CASE
SELECT 
    first_name, 
    department_id, 
    DECODE(department_id, 50, 'Transporte', 90, 'Direccion', 'Otro departamento') AS RESULT   
FROM employees;

----------------------------------------------------------------------------------------------------------------------------
-- PRACTICAS CON AGRUPACIONES
----------------------------------------------------------------------------------------------------------------------------

-- Indicar el n�mero de empleados del departamento 50
SELECT COUNT(employee_id) AS "NUMBER OF EMPLOYEES" FROM employees 
WHERE department_id = 50;

-- Indicar el n�mero de empleados que entraron en el a�o 2007 a trabajar
SELECT COUNT(employee_id) FROM employees WHERE TO_CHAR(hire_date, 'YY') = '07';
SELECT COUNT(employee_id) FROM employees WHERE EXTRACT(YEAR FROM hire_date) = '2007';

-- Indicar la diferencia entre el sueldo m�s alto y al m�nimo
SELECT MAX(salary), MIN(salary), MAX(salary) - MIN(salary) AS "SALARY DIFFERENCE" FROM employees;

-- Visualizar la suma del salario del departamento 100
SELECT SUM(salary) AS "DEP 100 TOTAL SALARY" FROM employees WHERE department_id = 100;

-- Mostrar el salario medio por departamento, con dos decimales
SELECT department_id, TO_CHAR(AVG(salary), '$99,999.99') AS "AVERAGE SALARY" 
FROM employees GROUP BY department_id;

-- Mostrar el country_id y el n�mero de ciudades que hay en ese pa�s.
SELECT country_id, COUNT(city) AS "NUMBER OF CITIES" FROM locations GROUP BY country_id;

-- Mostrar el promedio de salario de los empleados por departamento que tengan comisi�n
SELECT department_id, ROUND(AVG(salary), 2) AS "SALARIO PROMEDIO" FROM employees 
WHERE commission_pct IS NOT NULL GROUP BY department_id;

-- Mostrar los a�os en que ingresaron m�s de 10 empleados
SELECT EXTRACT(YEAR FROM hire_date) AS A�O, COUNT(employee_id) AS "CANTIDAD EMPLEADOS NUEVOS" 
FROM employees GROUP BY EXTRACT(YEAR FROM hire_date) HAVING COUNT(employee_id) > 10 ORDER BY 1;

-- Mostrar por departamento y a�o el n�mero de empleados que ingresaron
SELECT department_id, EXTRACT(YEAR FROM hire_date) AS A�O, COUNT(employee_id) 
AS "CANTIDAD EMPLEADOS NUEVOS" FROM employees GROUP BY department_id, 
EXTRACT(YEAR FROM hire_date) ORDER BY 1;

-- Mostrar los departament_id de los departamentos que tienen managers que 
-- tienen a cargo m�s de 5 empleados
SELECT department_id, manager_id, COUNT(manager_id) AS "EMPLEADOS A CARGO" 
FROM employees GROUP BY department_id, manager_id HAVING COUNT(manager_id) > 5; 

----------------------------------------------------------------------------------------------------------------------------
-- PRACTICAS CON JOINS, USING Y ON
----------------------------------------------------------------------------------------------------------------------------

-- Visualizar el nombre del pa�s y el nombre de la regi�n. (tablas COUNTRIES y REGIONS). 
-- Usar un natural join.
SELECT c.country_name, r.region_name FROM countries c JOIN regions r USING (region_id);

-- Usando el ejemplo anterior visualizar tambi�n el nombre de la ciudad a�adiendo una
-- nueva tabla (LOCATIONS)
SELECT c.country_name, r.region_name, l.city FROM countries c 
JOIN regions r USING (region_id) JOIN locations l USING (country_id);

-- Indicar el nombre del departamento y la media de sus salarios
SELECT d.department_name, ROUND(AVG(e.salary), 2) AS "AVERAGE SALARY" 
FROM employees e JOIN departments d USING (department_id) 
GROUP BY d.department_name;

/*
Mostrar el nombre del departamento, el del manager a cargo y la ciudad a la que pertenece. 
Debemos usar la cl�usula ON y/o la cl�usula USING para realizar la operaci�n 
*/
SELECT d.department_name, e.first_name , l.city FROM employees e JOIN departments d 
USING (department_id) JOIN locations l USING (location_id) WHERE e.employee_id = d.manager_id;

/*
Mostrar job_title, el department_name, el last_name de empleado y hire_date de todos los 
empleados que entraron entre el 2000 y el 2004. Usar cl�usulas using
*/
SELECT j.job_title, d.department_name, e.last_name, e.hire_date FROM employees e 
JOIN jobs j USING(job_id) JOIN departments d USING(department_id) WHERE 
EXTRACT(YEAR FROM hire_date) BETWEEN 2000 AND 2004;

-- Mostrar el job_title y la media de los salarios de cada uno, siempre que la
-- media supere los 7000
SELECT j.job_title, AVG(e.salary) FROM employees e JOIN jobs j USING(job_id) 
GROUP BY j.job_title HAVING AVG(e.salary) > 7000;

-- Mostrar el nombre de la regi�n y el n�mero de departamentos en cada una de las regiones
SELECT r.region_name, COUNT(d.department_id) FROM departments d JOIN locations l 
USING(location_id) JOIN countries c USING(country_id) JOIN regions r 
USING(region_id) GROUP BY r.region_name;

-- Mostrar el nombre del empleado, el departamento y el pa�s donde trabaja 
-- (debemos usar la cl�usual using)
SELECT e.employee_id, e.first_name, d.department_name, c.country_name FROM employees e 
JOIN departments d USING(department_id) JOIN locations l USING(location_id)
JOIN countries c USING(country_id);

----------------------------------------------------------------------------------------------------------------------------
-- PRACTICAS CON OTROS JOIN
----------------------------------------------------------------------------------------------------------------------------

-- Indicar el nombre del empleado y el de su jefe (SELF_JOIN de la tabla EMPLOYEES)
SELECT e.first_name AS empleado, j.first_name AS jefe FROM employees e 
JOIN employees j ON e.manager_id = j.employee_id;

/*
Indica el DEPARTMENT_NAME y la suma de salarios de ese departamento ordenados ascendentemente
y que aparezcan tambi�n los DEPARTMENT_NAME que no tengan empleados.
*/
SELECT d.department_name, SUM(e.salary) AS "SUMA SALARIOS" FROM departments d 
LEFT JOIN employees e USING(department_id) GROUP BY d.department_name
ORDER BY SUM(e.salary);

-- Visualizar la ciudad y el nombre del departamento, incluidas aquellas ciudades que 
-- no tengan departamentos
SELECT l.city, d.department_name FROM locations l LEFT JOIN departments d
ON l.location_id = d.location_id;

----------------------------------------------------------------------------------------------------------------------------
-- PRACTICAS CON SUBCONSULTAS
----------------------------------------------------------------------------------------------------------------------------

-- Mostrar los compa�eros que trabajan en el mismo departamento que John Chen
SELECT first_name, last_name FROM employees WHERE department_id = 
(SELECT department_id FROM employees WHERE first_name = 'John' AND last_name = 'Chen');

-- �Qu� departamentos tienen su sede en Toronto?
SELECT department_name FROM departments WHERE location_id = 
(SELECT location_id FROM locations WHERE city = 'Toronto');

-- Visualizar los empleados que tengan m�s de 5 empleados a su cargo.
SELECT first_name FROM employees WHERE employee_id IN (SELECT manager_id FROM employees 
GROUP BY manager_id HAVING COUNT(employee_id) > 5);

-- �En qu� ciudad trabaja Guy Himuro?
SELECT city FROM locations JOIN departments USING(location_id) WHERE department_id =
(SELECT department_id FROM employees WHERE first_name = 'Guy' AND last_name = 'Himuro');

-- �Qu� empleados tienen el salario m�nimo?
SELECT last_name, job_id, salary FROM employees WHERE salary =
(SELECT MIN(salary) FROM employees);

-- Mostrar los detalles de los departamentos en los cuales el salario
-- m�ximo sea mayor a 10000.
SELECT * FROM departments WHERE department_id IN ( 
SELECT department_id FROM employees GROUP BY department_id 
HAVING MAX(salary) > 10000 );

-- Indicar los tipos de trabajo de los empleados que entraron en la empresa
-- entre 2002 y 2003
SELECT * FROM jobs WHERE job_id IN (
SELECT job_id FROM employees WHERE EXTRACT(YEAR FROM hire_date) BETWEEN 2002 AND 2003); 

----------------------------------------------------------------------------------------------------------------------------
-- PRACTICAS CON OTRAS SUBCONSULTAS
----------------------------------------------------------------------------------------------------------------------------

/*
Seleccionar el nombre, salario y departamento de los empleados que ganen mas que cualquiera
de los salarios m�ximos de los departamentos 50, 60 y 70. Usar el operador ANY
*/
SELECT first_name, salary, department_id FROM employees WHERE salary > ANY (SELECT MAX(salary)
FROM employees WHERE department_id IN (50,60,70) GROUP BY department_id); 

-- Indicar el nombre de los departamentos cuyo salario medio sea superior
-- a 9000. Usar el operador IN
SELECT department_name FROM departments WHERE department_id IN ( SELECT department_id
FROM employees GROUP BY department_id HAVING AVG(salary) > 9000);

-- Indicar el nombre del empleado, el nombre del departamento, el salario
-- de los empleados que tengan el salario m�ximo de su departamento.
-- Ordenado por salario descendentemente. Usar el operador IN
SELECT first_name, department_name, salary FROM employees e JOIN departments d USING(department_id)
WHERE (department_id, salary) IN ( SELECT department_id, MAX(salary) FROM employees GROUP BY department_id) 
ORDER BY salary DESC;

-- Realizar la misma consulta anterior pero usando una subconsulta sincronizada
SELECT first_name, department_name, salary FROM employees e JOIN departments d 
ON e.department_id = d.department_id
WHERE salary = ( SELECT MAX(salary) FROM employees 
WHERE department_id = e.department_id GROUP BY department_id) 
ORDER BY salary DESC;

-- Indicar los datos de los empleados que ganen m�s que todos los empleados del departamento 100. 
-- Usar el operador ALL
SELECT * FROM employees WHERE salary > ALL (SELECT salary FROM employees WHERE department_id = 100);

-- Mostrar los empleados que tienen el mayor salario de su departamento. Usar subconsultas sincronizadas.
SELECT department_id, first_name, salary FROM employees e WHERE salary = (
SELECT MAX(salary) FROM employees WHERE department_id = e.department_id);

-- Visualizar las ciudades en las que haya alg�n departamento. 
-- Debemos usar consultas sincronizadas y el operador EXISTS
SELECT city FROM locations l WHERE EXISTS (SELECT location_id FROM departments 
WHERE location_id = l.location_id);

-- Visualizar el nombre de las regiones donde no hay departamentos. Usar
-- subconsultas sincronizadas y el operador NOT EXISTS
SELECT region_name FROM regions r WHERE NOT EXISTS (
    SELECT * FROM countries NATURAL JOIN locations NATURAL JOIN departments
    WHERE region_id = r.region_id
);

----------------------------------------------------------------------------------------------------------------------------
-- PRACTICAS CON OPERADORES DE CONJUNTO
----------------------------------------------------------------------------------------------------------------------------

--CREAR LAS TABLAS
CREATE TABLE COCHES1 (CODIGO NUMBER, NOMBRE VARCHAR2(100));
CREATE TABLE COCHES2 (CODE NUMBER, NAME VARCHAR2(100));

--INSERTAR DATOS EN LAS TABLAS
INSERT INTO COCHES1 VALUES(1,'BMW 3');
INSERT INTO COCHES1 VALUES(2,'AUDI A5');
INSERT INTO COCHES1 VALUES(3,'CITROEN C5');
INSERT INTO COCHES1 VALUES(4,'RENAULT CLIO');
INSERT INTO COCHES2 VALUES(1,'BMW 3');
INSERT INTO COCHES2 VALUES(6,'MERCEDES C');
INSERT INTO COCHES2 VALUES(3,'CITROEN C5');
INSERT INTO COCHES2 VALUES(7,'FORD MUSTANG');

COMMIT;

-- Probar los 4 operadores de conjunto: UNION, UNION ALL, INTERSECT, MINUS
SELECT * FROM coches1
UNION
SELECT * FROM coches2;

SELECT * FROM coches1
UNION ALL
SELECT * FROM coches2;

SELECT * FROM coches1
INTERSECT
SELECT * FROM coches2;

SELECT * FROM coches1
MINUS
SELECT * FROM coches2;

----------------------------------------------------------------------------------------------------------------------------
-- PRACTICAS CON SENTENCIAS DML
----------------------------------------------------------------------------------------------------------------------------

-- CREAR LA TABLA
CREATE TABLE PRODUCTOS
(
 CODIGO NUMBER NOT NULL
, NOMBRE VARCHAR2(100) NOT NULL
, PRECIO NUMBER NOT NULL
, UNIDADES NUMBER
, FECHA_ALTA DATE
);

/*
INSERT - Insertar los siguientes datos en la tabla, indicando todas las columnas

C�digo 1
Nombre tornillos
Precio 100
Unidades 10
Fecha_alta 01-09-2017
*/
INSERT INTO productos (codigo, nombre, precio, unidades, fecha_alta) 
VALUES (1, 'Tornillos', 100, 10, '01-09-2017');

/*
Insertar los siguientes datos en la tabla, sin indicar las columnas

C�digo 2
Nombre Tuercas
Precio 50
Unidades 5
Fecha_alta 01-10-2009
*/
INSERT INTO productos VALUES(2, 'Tuercas', 50, 5, '01-10-2009');


/*
Insertar los siguientes datos en la tabla

C�digo 3
Nombre Martillo
Precio 90
*/
INSERT INTO productos VALUES(3, 'Martillo', 90, DEFAULT, DEFAULT);

/*
�Este INSERT funciona?

INSERT INTO PRODUCTOS (CODIGO,NOMBRE,unidades) VALUES (4,'Arandela',10);

En el caso de que no funcione, solucionarlo
*/
-- No funciona debido a que el precio NO puede ser NULL
INSERT INTO productos (codigo,nombre,precio,unidades) VALUES (4,'Arandela',2,10);

-- Crear la siguiente tabla

CREATE TABLE PRODUCTOS2
(CODE NUMBER,
NAME VARCHAR2(100));

-- Insertar en la tabla PRODUCTOS2 las filas de la tabla PRODUCTOS que tengan m�s
-- de 8 unidades. Comprobar las filas.
INSERT INTO productos2 (SELECT codigo, nombre FROM productos WHERE unidades > 8);

-- Modificar el campo NOMBRE de la tabla PRODUCTOS y poner en may�sculas el nombre
-- de aquellas filas que valgan m�s de 50. Comprobar el resultado.
UPDATE productos SET nombre = (UPPER(nombre)) WHERE precio > 50;

-- Modificar el precio de la tabla productos de aquellas filas cuyo nombre
-- comienza por 'T'. Debemos incrementarlo en 5. Comprobar el resultado.
UPDATE productos SET precio = precio + 5 WHERE nombre LIKE 'T%';

-- Borrar las filas de la tabla productos que tengan menos de 10 unidades
-- o un valor nulo. Comprobar el resultado.
DELETE FROM productos WHERE unidades < 10 OR unidades IS NULL;

-- Truncar la tabla PRODUCTOS2. Comprobar el resultado.
TRUNCATE TABLE productos2;

----------------------------------------------------------------------------------------------------------------------------
-- PRACTICAS CON TRANSACCIONES
----------------------------------------------------------------------------------------------------------------------------

-- Abrir otro SqlDeveloper y entrar tambi�n como el usuario HR

-- Entrar en el primer SqlDeveloper
-- Realizar un insert en la tabla productos
INSERT INTO productos2 (code,name) VALUES (1,'CLAVOS');

-- Comprobar que lo podemos ver
-- Acceder al otro SqlDeveloper. �Podemos ver la fila?
-- Volver al primer SqlDeveloper y realizar un commit
COMMIT;

-- Volvemos a acceder al otro SqlDeveloper. �Podemos ver ahora la fila?
-- Regresemos al primer SqlDeveloper
-- Hacer un DELETE de la fila
DELETE FROM productos2 WHERE code = 1;

-- Comprobar que se ha borrado
-- Realizar un ROLLBACK
ROLLBACK;

-- Comprobar que se ha recuperado.
SELECT * FROM productos2;

-- Vamos a probar un SAVEPOINT

-- Realizamos estas dos operaciones:
INSERT INTO productos2 ( code,name ) VALUES (2,'ARANDELAS');
INSERT INTO productos2 ( code,name ) VALUES (3,'ESCARPIAS');

-- Ponemos un SAVEPOINT
SAVEPOINT X;

-- Comprobar que vemos las inserciones
SELECT * FROM productos2;

-- Hacemos ahora esta operaci�n
UPDATE PRODUCTOS2 SET NAME='TORNILLOS' WHERE CODE=3;

-- Realizar una ROLLBACK hasta el SAVEPOINT anterior.
ROLLBACK TO X;

-- Comprobar que solo ha desaparecido el UPDATE.
SELECT * FROM productos2;

-- Hacer un COMMIT
COMMIT;

----------------------------------------------------------------------------------------------------------------------------
-- PRACTICAS CON CREACION DE TABLAS Y CONSTRAINTS PRIMARY-UNIQUE
----------------------------------------------------------------------------------------------------------------------------

-- Crear la siguiente tabla usando el comando CREATE TABLE
CREATE TABLE students (
    cod_matricula NUMBER,
    nombre VARCHAR2(20),
    apellido1 VARCHAR2(20),
    apellido2 VARCHAR2(20),
    edadi NUMBER,
    fecha_matricula DATE
);

-- Comprobar con el comando DESC que existe y que tiene esa estructura
DESC students;

-- Crear una tabla denominada CENTROS, con la siguiente estructura
CREATE TABLE centros (
    codigo_centro NUMBER,
    nombre VARCHAR2(100),
    provincia VARCHAR2(100) DEFAULT 'MADRID',
    fecha_alta DATE DEFAULT SYSDATE,
    num_alumnos NUMBER DEFAULT 0
);

-- Insertar una fila que no tengo los tres �ltimos campos y comprobar que
-- lo genera de forma autom�tica.
INSERT INTO centros (codigo_centro,nombre) VALUES(1,'MATEM�TICAS');
SELECT * FROM centros;

/*
Crear la siguiente tabla con las caracter�sticas indicadas

* Tabla CURSOS

? COD_CURSO NUMBER Y CLAVE PRIMARIA
? NOMBRE VARCHAR2(100) NO PUEDE SER NULO Y DEBE SER �NICO
? RESPONSABLE VARCHAR2(100)
*/
CREATE TABLE cursos (
    cod_curso NUMBER PRIMARY KEY,
    nombre VARCHAR2(100) NOT NULL UNIQUE,
    responsable VARCHAR2(100)
);

-- Insertar algunas filas y comprobar que funciona la clave primaria y
-- la clave �nica/not null
INSERT INTO cursos VALUES (1, NULL, 'Juan');
INSERT INTO cursos VALUES (1,'Programacion', 'Juan');
INSERT INTO cursos VALUES (2,'Programacion', 'Marvin');
INSERT INTO cursos VALUES (3, 'Estructuras de datos', NULL);

----------------------------------------------------------------------------------------------------------------------------
-- PRACTICAS CON MODIFICACION Y ELIMINACION DE TABLAS
----------------------------------------------------------------------------------------------------------------------------

-- Crear la siguiente tabla PAISES
CREATE TABLE paises (
    cod_pais NUMBER PRIMARY KEY,
    nombre VARCHAR2(100) NOT NULL CHECK (UPPER(nombre) = nombre)
);

-- Crear la siguiente tabla CIUDADES con las siguientes caracter�sticas
CREATE TABLE ciudades (
    cod_ciudad NUMBER PRIMARY KEY,
    nombre VARCHAR2(100) NOT NULL CHECK ((UPPER(nombre) = nombre)),
    poblacion NUMBER NOT NULL CHECK (poblacion > 0),
    cod_pais NUMBER REFERENCES paises(cod_pais)
);

-- Insertar una fila en PAISES, por ejemplo 28, ESTADOS UNIDOS
INSERT INTO paises VALUES (28, 'ESTADOS UNIDOS');

-- Insertar otra fila con el nombre en min�sculas, por ejemplo 29, Francia.
-- Debe generar un error de CHEK.
INSERT INTO paises VALUES (29, 'Francia');

-- Grabar la fila correctamente.
INSERT INTO paises VALUES (29, 'FRANCIA');

-- Insertar alguna fila en la tabla CIUDADES, por ejemplo (1,NUEVA YORK,4000000,18) 
-- Debe funcionar correctamente porque cumple todas las constraints
INSERT INTO ciudades VALUES (1,'NUEVA YORK',4000000,28);

-- Intentar insertar una fila de alg�n pa�s que no exista. Por ejemplo (2,ROMA,3000000,40). 
-- Debe generar un error ya que el pa�s 40 no existe en la tabla PAISES
INSERT INTO ciudades VALUES (2,'ROMA',3000000,40);

-- Insertar ITALIA con el c�digo 40 en la tabla PAISES
INSERT INTO paises VALUES (40, 'ITALIA');

-- Volver a insertar la fila con ROMA. Deber�a funcionar.
INSERT INTO ciudades VALUES (2,'ROMA',3000000,40);

-- Intentar grabar una ciudad con el nombre en min�sculas. Debe generar un error
INSERT INTO ciudades VALUES (3,'Santa Ana',100000,2);

-- Intentar grabar una ciudad con una poblaci�n de 0. Debe generar un error
INSERT INTO ciudades VALUES (3,'SANTA ANA',0,2);

-- Insertamos varias ciudades con poblaciones entre 1.000.000 y 5.000.000
INSERT INTO ciudades VALUES (2, 'LOS ANGELES', 3000000, 28);

INSERT INTO ciudades VALUES (3, 'CHICAGO', 2500000, 28);

INSERT INTO ciudades VALUES (4, 'HOUSTON', 2000000, 28);

INSERT INTO ciudades VALUES (5, 'PHILADELPHIA', 1500000, 28);

INSERT INTO ciudades VALUES (6, 'PHOENIX', 3500000, 28);

INSERT INTO ciudades VALUES (7, 'SAN ANTONIO', 1800000, 28);

INSERT INTO ciudades VALUES (8, 'SAN DIEGO', 2700000, 28);

INSERT INTO ciudades VALUES (9, 'DALLAS', 2200000, 28);

INSERT INTO ciudades VALUES (10, 'SAN JOSE', 1300000, 28);

INSERT INTO ciudades VALUES (11, 'AUSTIN', 1900000, 28);

INSERT INTO ciudades VALUES (12, 'JACKSONVILLE', 1700000, 28);

INSERT INTO ciudades VALUES (13, 'INDIANAPOLIS', 2800000, 28);

INSERT INTO ciudades VALUES (14, 'COLUMBUS', 2100000, 28);

INSERT INTO ciudades VALUES (15, 'FORT WORTH', 1100000, 28);

INSERT INTO ciudades VALUES (16, 'CHARLOTTE', 3200000, 28);

INSERT INTO ciudades VALUES (17, 'SEATTLE', 3900000, 28);

INSERT INTO ciudades VALUES (18, 'DENVER', 2400000, 28);

INSERT INTO ciudades VALUES (19, 'EL PASO', 1700000, 28);

INSERT INTO ciudades VALUES (20, 'DETROIT', 2600000, 28);

INSERT INTO ciudades VALUES (21, 'MEMPHIS', 1400000, 28);

-- Creamos una tabla denominada CIUDADES_PEQUE, basada en CIUDADES, 
-- pero solo con las que tengan una poblaci�n inferior a 2.000.000. 
--Lo hacemos mediante la opci�n de crear una tabla basada en otra
CREATE TABLE ciudades_peque AS SELECT * FROM ciudades WHERE poblacion < 2000000;

-- A�adimos la clave primaria a CIUDADES_PEQUE sobre la columna CODIGO
ALTER TABLE ciudades_peque ADD CONSTRAINT pk_cod_ciudad PRIMARY KEY (cod_ciudad);

-- A�adimos una nueva columna a la tabla llamada BANDERA de tipo VARCHAR2(100)
ALTER TABLE ciudades_peque ADD (bandera VARCHAR2(100));

-- A�adimos alguna fila y comprobamos el resultado
INSERT INTO ciudades_peque VALUES (30, 'RANDOM', 1900000, 28, 'Unknown');
SELECT * FROM ciudades_peque;

-- Eliminamos la columna BANDERA
ALTER TABLE ciudades_peque DROP COLUMN bandera;

-- Borramos la tabla CIUDADES_PEQUE
DROP TABLE ciudades_peque;

----------------------------------------------------------------------------------------------------------------------------
-- PRACTICAS CON INDICES, SECUENCIAS Y VISTAS
----------------------------------------------------------------------------------------------------------------------------

-- Crear una vista llamada CIUDADES_GRANDES con las ciudades que tengan m�s de 3.000.000 de habitantes
CREATE VIEW ciudades_grandes AS SELECT * FROM ciudades WHERE poblacion > 3000000;

-- Comprobar que funciona
SELECT * FROM ciudades_grandes;

-- Crear una vista llamada CIUDADES_USA con las ciudades de Estados Unidos 
-- (c�digo 28 seg�n la pr�ctica anterior)
CREATE VIEW ciudades_usa AS SELECT * FROM ciudades WHERE cod_pais = 28;

-- Comprobar que funciona
SELECT * FROM ciudades_usa;

-- Borrar las dos vistas
DROP VIEW ciudades_grandes;
DROP VIEW ciudades_usa;

-- Crear un �ndice en la tabla ciudades sobre el nombre de la ciudad
CREATE INDEX nombre_ciudad_index ON ciudades(nombre);

-- Crear una secuencia denominada SEQ1, que comience por 1 y que
-- devuelve n�meros de 5 en cinco.
CREATE SEQUENCE seq1 INCREMENT BY 5 START WITH 1 CACHE 20;

-- Insertar un par de pa�ses usando la secuencia como clave primaria, en
-- vez de poner un n�mero directamente
INSERT INTO paises VALUES (seq1.NEXTVAL,'EL SALVADOR');
INSERT INTO paises VALUES (seq1.NEXTVAL,'COLOMBIA');
INSERT INTO paises VALUES (seq1.NEXTVAL,'ARGENTINA');

-- Comprobar el resultado
SELECT * FROM paises;