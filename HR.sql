-- Curso - Aprende Oracle SQL Desde Cero - Udemy - Ejercicios Resueltos

----------------------------------------------------------------------------------------------------------------------------
-- PRACTICAS CON SELECT
----------------------------------------------------------------------------------------------------------------------------

-- Visualizar el nombre y el número de teléfono de los empleados
SELECT CONCAT(CONCAT(first_name, ' '), last_name) AS name, phone_number AS phone FROM employees;

-- Visualizar el nombre y el tipo de trabajo de los empleados (FIRST_NAME, JOB_ID). 
-- Debe aparecer en la cabecera NOMBRE Y Tipo de Trabajo.
SELECT CONCAT(CONCAT(e.first_name, ' '), e.last_name) AS name, j.job_title AS "TIPO TRABAJO" 
FROM employees e JOIN jobs j USING(job_id);

-- Selecciona todas las columnas de la tabla REGIONS
SELECT * FROM regions;

-- Indicar los nombres de los países de la tabla COUNTRIES
SELECT country_name FROM countries;

-- Seleccionar las columnas STREET_ADDRESS, CITY, STATE_PROVINCE de la table LOCATIONS. 
-- Debemos poner las columnas como dirección, Ciudad y Estado
SELECT street_address AS dirección, city AS ciudad, state_province AS estado FROM locations;

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
-- concatenación ||
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

-- Usando la tabla LOCATIONS, averigua el nombre de la Ciudad (city) y la dirección 
-- (Street_address) de los departamentos situados en Estados Unidos (COUNTRY_ID=US)
SELECT city, street_address FROM locations WHERE country_id = 'US';

-- Visualiza los países que están en la región 3. (REGION_ID de la tabla COUNTRIES)
SELECT * FROM countries WHERE region_id = 3;

-- Averiguar el nombre y salario de los empleados que NO tengan como jefe al
-- MANAGER 114 (columna MANAGER_ID)
SELECT first_name, salary FROM employees WHERE manager_id != 114;

-- Visualizar los empleados que empezaron a trabajar a partir del año 2006
SELECT * FROM employees WHERE hire_date >= '01-01-06';

-- Seleccionar los empleados que tenga como tipo de trabajo ‘ST_CLERK’
SELECT * FROM employees WHERE job_id = 'ST_CLERK';

-- Indicar los datos de los empleados que tengan como apellidos “Smith” (LAST_NAME)
SELECT * FROM employees WHERE last_name = 'Smith';

----------------------------------------------------------------------------------------------------------------------------
-- PRACTICAS CON BETWEEN - IN
----------------------------------------------------------------------------------------------------------------------------

-- Averiguar los empleados que están entre el departamento 40 y el 60
SELECT * FROM employees WHERE department_id BETWEEN 40 AND 60;

-- Visualizar los empleados que entraron entre 2002 y 2004
SELECT * FROM employees WHERE hire_date BETWEEN '01-01-02' AND '31-12-04';

-- Indica los apellidos de los empleados que empiezan desde ‘D’ hasta ‘G’
SELECT last_name FROM employees WHERE SUBSTR(last_name, 1, 1) BETWEEN 'D' AND 'G';
-- Solucion propuesta por el curso???
SELECT LAST_NAME FROM EMPLOYEES WHERE LAST_NAME BETWEEN 'D' AND 'H';

-- Averiguar los empleados de los departamentos 30,60 y 90. Hay que usar la cláusula IN
SELECT * FROM employees WHERE department_id IN (30, 60, 90);

-- Averiguar los empleados que tienen el tipo de trabajo IT_PROG y PU_CLERK
SELECT * FROM employees WHERE job_id IN ('IT_PROG', 'PU_CLERK');

-- Indica las ciudades que están en Inglaterra (UK) y Japón (JP)...Tabla LOCATIONS
SELECT city FROM locations WHERE country_id IN ('UK', 'JP');

----------------------------------------------------------------------------------------------------------------------------
-- PRACTICAS CON LIKE
----------------------------------------------------------------------------------------------------------------------------

-- Indicar los datos de los empleados cuyo FIRST_NAME empieza por 'J'
SELECT * FROM employees WHERE first_name LIKE 'J%';

-- Averiguar los empleados que comienzan por 'S' y terminan en 'n'
SELECT * FROM employees WHERE first_name LIKE 'S%n';

-- Indicar los países que tienen una “r” en la segunda letra (Tabla COUNTRIES)
SELECT * FROM countries WHERE country_name LIKE '_r%';

----------------------------------------------------------------------------------------------------------------------------
-- PRACTICAS CON IS NULL
----------------------------------------------------------------------------------------------------------------------------

-- Listar las ciudades de la tabla LOCATIONS que no tienen STATE_PROVINCE
SELECT * FROM locations WHERE state_province IS NULL;

-- Averiguar el nombre, salario y comisión de aquellos empleados que tienen comisión. 
-- También debemos visualizar una columna calculada denominada “Sueldo Total”, 
-- que sea el sueldo más la comisión
SELECT first_name, salary, commission_pct, salary + (salary * commission_pct) AS "Sueldo Total" 
FROM employees WHERE commission_pct IS NOT NULL;

----------------------------------------------------------------------------------------------------------------------------
-- PRACTICAS CON AND-OR-NOT
----------------------------------------------------------------------------------------------------------------------------

-- Obtener el nombre y la fecha de la entrada y el tipo de trabajo de los
-- empleados que sean IT_PROG y que ganen menos de 6000 dólares
SELECT first_name, hire_date, job_id FROM employees 
WHERE job_id = 'IT_PROG' AND salary < 6000;

-- Seleccionar los empleados que trabajen en el departamento 50 o 80,
-- cuyo nombre comience por S y que ganen más de 3000 dólares.
SELECT * FROM employees WHERE department_id IN (50, 80) AND first_name LIKE 'S%' AND salary > 3000;

-- ¿Qué empleados de job_id IT_PROG tienen un prefijo 5 en el teléfono
-- y entraron en la empresa en el año 2007?
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
empleados cuyo apellido contenga el carácter 'b' después de la 3ª
posición.
*/
SELECT first_name, last_name, LENGTH(first_name), (salary * 14) AS "Annual Salary", 
INSTR(last_name, 'b') FROM employees WHERE INSTR(last_name, 'b') > 3;

/*
Averiguar los empleados que ganan entre 4000 y 7000 euros y que
tienen alguna 'a' en el nombre. (Debemos usar INSTR y da igual que sea
mayúscula que minúsculas) y que tengan comisión.
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
Visualizar el nombre del empleado, su salario, y con asteriscos, el número miles de dólares
que gana. Se asocia ejemplo. (PISTA: se puede usar RPAD. Ordenado por salario
*/
SELECT first_name, salary, RPAD('*', FLOOR(salary / 1000), '*') AS ranking, 
FLOOR(salary / 1000) AS "RANKING NUMBER" FROM employees ORDER BY salary DESC;

----------------------------------------------------------------------------------------------------------------------------
-- PRACTICAS CON FUNCIONES NUMERICAS
----------------------------------------------------------------------------------------------------------------------------

-- Visualizar el nombre y salario de los empleados de los que el número de
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

-- Indicar el número de días que los empleados llevan en la empresa
SELECT first_name, hire_date, TRUNC(SYSDATE - hire_date, 0) AS "DAYS SINCE HIRE" FROM employees;

-- Indicar la fecha que será dentro de 15 días
SELECT SYSDATE + 15 AS "FUTURE DATE" FROM DUAL;

-- ¿Cuántos MESES faltan para la navidad? La cifra debe salir redondeada, con 1 decimal
SELECT ROUND(MONTHS_BETWEEN('25-12-23', SYSDATE), 1) AS "MONTHS UNTIL CHRISTMASS" FROM DUAL;

-- Indicar la fecha de entrada de un empleado y el último día del mes que entró
SELECT first_name, hire_date, LAST_DAY(hire_date) FROM employees;

-- Utilizando la función ROUND, indicar los empleados que entraron en los 
-- últimos 15 días de cada mes.
SELECT first_name, hire_date FROM employees WHERE ROUND(LAST_DAY(hire_date) - hire_date) <= 15;

----------------------------------------------------------------------------------------------------------------------------
-- PRACTICAS CON CONVERSION TO_CHAR
----------------------------------------------------------------------------------------------------------------------------

-- Indicar los empleados que entraron en Mayo en la empresa. Debemos
-- buscar por la abreviatura del mes
SELECT first_name, hire_date, TO_CHAR(hire_date, 'MON') AS "MONTH HIRE" 
FROM employees WHERE TO_CHAR(hire_date, 'MON') = 'MAY';

-- Indicar los empleados que entraron en el año 2007 usando la función to_char
SELECT first_name, hire_date FROM employees WHERE TO_CHAR(hire_date, 'YY') = 07;
SELECT first_name, hire_date FROM employees WHERE TO_CHAR(hire_date, 'YYYY') = 2007;

-- ¿Qué día de la semana (en letra) era el día que naciste?
SELECT TO_CHAR(TO_DATE('10-10-2010'), 'DAY') AS "DAY OF BIRTH" FROM DUAL;

/*
Averiguar los empleados que entraron en el mes de Junio. Debemos preguntar por el 
mes en letra. Nota: La función TO_CHAR puede devolver espacios a la derecha)
*/
SELECT first_name, hire_date, '[' || TO_CHAR(hire_date, 'MONTH') || ']' AS "RIGHT SPACES" FROM employees;

SELECT first_name, hire_date, TO_CHAR(hire_date, 'MONTH') AS "HIRE MONTH" FROM employees 
WHERE RTRIM(TO_CHAR(hire_date, 'MONTH')) = 'JUNIO';

/*
Visualizar el salario de los empleados con dos decimales y en dólares y también en la 
moneda local (el ejemplo es con euros, suponiendo que el cambio esté en 0,79$)
*/
SELECT first_name, salary, TO_CHAR(salary, '$99,999.99') AS "DOLARES", 
TO_CHAR(salary * 8.75, 'L999,999.99') AS "COLONES(Deprecated)" FROM employees; 

----------------------------------------------------------------------------------------------------------------------------
-- PRACTICAS CON CONVERSION TO_DATE Y TO_NUMBER
----------------------------------------------------------------------------------------------------------------------------

-- Convertir las siguientes cadenas a números '1210.73' ‘$127.2’
SELECT TO_NUMBER('1210.73') FROM DUAL;
SELECT TO_NUMBER('$127.2', '$999.9') FROM DUAL;

-- Convertir los 3 primeros caracteres del número de teléfono en números y
-- multiplicarlos por 2.
SELECT phone_number, (TO_NUMBER(SUBSTR(phone_number, 1,3)) * 2) AS RESULT FROM employees;

/*
Convertir las siguientes cadenas en fecha (NOTA: el mes lo debemos poner en el idioma que 
tengamos en el SqlDeveloper. Por ejemplo, en español sería

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
En el caso de que no tenga que aparezca el texto “No tiene”
*/
SELECT city, NVL(state_province, 'No tiene') AS STATE_PROVINCE FROM locations;

/*
Visualizar el salario de los empleados incrementado en la comisión
(PCT_COMMISSION). Si no tiene comisión solo debe salir el salario
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
- Si el departamento es 90 ponemos Dirección
- Cualquier otro número ponemos “Otro departamento”
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
Mostrar de la tabla LOCATIONS, la ciudad y el país. Ponemos los
siguientes datos dependiendo de COUNTRY_ID.
- Si es US y CA ponemos América del Norte
- Si es CH, UK, DE,IT ponemos Europa
- Si es BR ponemos América del Sur
- Si no es ninguno ponemos ‘Otra zona’
*/
SELECT 
    city, 
    country_id,
    CASE 
        WHEN country_id IN ('US', 'CA') THEN 'América del Norte'
        WHEN country_id IN ('CH', 'UK', 'DE', 'IT') THEN 'Europa'
        WHEN country_id IN ('BR') THEN 'América del Sur'
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

-- Indicar el número de empleados del departamento 50
SELECT COUNT(employee_id) AS "NUMBER OF EMPLOYEES" FROM employees 
WHERE department_id = 50;

-- Indicar el número de empleados que entraron en el año 2007 a trabajar
SELECT COUNT(employee_id) FROM employees WHERE TO_CHAR(hire_date, 'YY') = '07';
SELECT COUNT(employee_id) FROM employees WHERE EXTRACT(YEAR FROM hire_date) = '2007';

-- Indicar la diferencia entre el sueldo más alto y al mínimo
SELECT MAX(salary), MIN(salary), MAX(salary) - MIN(salary) AS "SALARY DIFFERENCE" FROM employees;

-- Visualizar la suma del salario del departamento 100
SELECT SUM(salary) AS "DEP 100 TOTAL SALARY" FROM employees WHERE department_id = 100;

-- Mostrar el salario medio por departamento, con dos decimales
SELECT department_id, TO_CHAR(AVG(salary), '$99,999.99') AS "AVERAGE SALARY" 
FROM employees GROUP BY department_id;

-- Mostrar el country_id y el número de ciudades que hay en ese país.
SELECT country_id, COUNT(city) AS "NUMBER OF CITIES" FROM locations GROUP BY country_id;

-- Mostrar el promedio de salario de los empleados por departamento que tengan comisión
SELECT department_id, ROUND(AVG(salary), 2) AS "SALARIO PROMEDIO" FROM employees 
WHERE commission_pct IS NOT NULL GROUP BY department_id;

-- Mostrar los años en que ingresaron más de 10 empleados
SELECT EXTRACT(YEAR FROM hire_date) AS AÑO, COUNT(employee_id) AS "CANTIDAD EMPLEADOS NUEVOS" 
FROM employees GROUP BY EXTRACT(YEAR FROM hire_date) HAVING COUNT(employee_id) > 10 ORDER BY 1;

-- Mostrar por departamento y año el número de empleados que ingresaron
SELECT department_id, EXTRACT(YEAR FROM hire_date) AS AÑO, COUNT(employee_id) 
AS "CANTIDAD EMPLEADOS NUEVOS" FROM employees GROUP BY department_id, 
EXTRACT(YEAR FROM hire_date) ORDER BY 1;

-- Mostrar los departament_id de los departamentos que tienen managers que 
-- tienen a cargo más de 5 empleados
SELECT department_id, manager_id, COUNT(manager_id) AS "EMPLEADOS A CARGO" 
FROM employees GROUP BY department_id, manager_id HAVING COUNT(manager_id) > 5; 

----------------------------------------------------------------------------------------------------------------------------
-- PRACTICAS CON JOINS, USING Y ON
----------------------------------------------------------------------------------------------------------------------------

-- Visualizar el nombre del país y el nombre de la región. (tablas COUNTRIES y REGIONS). 
-- Usar un natural join.
SELECT c.country_name, r.region_name FROM countries c JOIN regions r USING (region_id);

-- Usando el ejemplo anterior visualizar también el nombre de la ciudad añadiendo una
-- nueva tabla (LOCATIONS)
SELECT c.country_name, r.region_name, l.city FROM countries c 
JOIN regions r USING (region_id) JOIN locations l USING (country_id);

-- Indicar el nombre del departamento y la media de sus salarios
SELECT d.department_name, ROUND(AVG(e.salary), 2) AS "AVERAGE SALARY" 
FROM employees e JOIN departments d USING (department_id) 
GROUP BY d.department_name;

/*
Mostrar el nombre del departamento, el del manager a cargo y la ciudad a la que pertenece. 
Debemos usar la cláusula ON y/o la cláusula USING para realizar la operación 
*/
SELECT d.department_name, e.first_name , l.city FROM employees e JOIN departments d 
USING (department_id) JOIN locations l USING (location_id) WHERE e.employee_id = d.manager_id;

/*
Mostrar job_title, el department_name, el last_name de empleado y hire_date de todos los 
empleados que entraron entre el 2000 y el 2004. Usar cláusulas using
*/
SELECT j.job_title, d.department_name, e.last_name, e.hire_date FROM employees e 
JOIN jobs j USING(job_id) JOIN departments d USING(department_id) WHERE 
EXTRACT(YEAR FROM hire_date) BETWEEN 2000 AND 2004;

-- Mostrar el job_title y la media de los salarios de cada uno, siempre que la
-- media supere los 7000
SELECT j.job_title, AVG(e.salary) FROM employees e JOIN jobs j USING(job_id) 
GROUP BY j.job_title HAVING AVG(e.salary) > 7000;

-- Mostrar el nombre de la región y el número de departamentos en cada una de las regiones
SELECT r.region_name, COUNT(d.department_id) FROM departments d JOIN locations l 
USING(location_id) JOIN countries c USING(country_id) JOIN regions r 
USING(region_id) GROUP BY r.region_name;

-- Mostrar el nombre del empleado, el departamento y el país donde trabaja 
-- (debemos usar la cláusual using)
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
y que aparezcan también los DEPARTMENT_NAME que no tengan empleados.
*/
SELECT d.department_name, SUM(e.salary) AS "SUMA SALARIOS" FROM departments d 
LEFT JOIN employees e USING(department_id) GROUP BY d.department_name
ORDER BY SUM(e.salary);

-- Visualizar la ciudad y el nombre del departamento, incluidas aquellas ciudades que 
-- no tengan departamentos
SELECT l.city, d.department_name FROM locations l LEFT JOIN departments d
ON l.location_id = d.location_id;