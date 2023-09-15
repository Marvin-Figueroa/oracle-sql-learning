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