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
