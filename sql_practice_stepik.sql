	1. Вывести из таблицы trip информацию о командировках тех сотрудников, фамилия которых заканчивается на букву «а», 
в отсортированном по убыванию даты последнего дня командировки виде. 
В результат включить столбцы name, city, per_diem, date_first, date_last.

SELECT name, city, per_diem, date_first, date_last
FROM trip
WHERE name LIKE "%a %"
ORDER BY date_last DESC;

	2. Вывести в алфавитном порядке фамилии и инициалы тех сотрудников, которые были в командировке в Москве.

SELECT DISTINCT name
FROM trip
WHERE citu = "Москва"
ORDER BY name ASC;

	3. Для каждого города посчитать, сколько раз сотрудники в нем были.
Информацию вывести в отсортированном в алфавитном порядке по названию городов.
Вычисляемый столбец назвать Количество. 

SELECT city, count(city) 'Количество'
FROM trip
GROUP BY city
ORDER BY city ASC;

	4. Вывести два города, в которых чаще всего были в командировках сотрудники. Вычисляемый столбец назвать Количество.
SELECT city, count(name) AS "Количество"
FROM trip
ORDER BY city 
ORDER BY Количество DESC
LIMIT 2;