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
WHERE city = "Москва"
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
<<<<<<< HEAD
=======

	5. Вывести информацию о командировках во все города кроме Москвы и Санкт-Петербурга 
(фамилии и инициалы сотрудников, город ,  длительность командировки в днях, при этом первый и последний день относится к периоду командировки). 
Последний столбец назвать Длительность. Информацию вывести в упорядоченном по убыванию длительности поездки, а потом по убыванию названий городов (в обратном алфавитном порядке).

SELECT name, city, (DATEDIFF (date_last, date_first) + 1) AS "Длительность"
FROM trip
WHERE city NOT IN ("Москва", "Санкт-Петербург")
ORDER BY Длительность DESC, city DESC;

	6. Вывести информацию о командировках сотрудника(ов), которые были самыми короткими по времени. В результат включить столбцы name, city, date_first, date_last.

SELECT name, city, date_first, date_last
FROM trip
WHERE DATEDIFF (date_last, date_first) = (SELECT(date_last, date_first)) FROM trip);

	7. Вывести информацию о командировках, начало и конец которых относятся к одному месяцу (год может быть любой). 
В результат включить столбцы name, city, date_first, date_last. Строки отсортировать сначала  в алфавитном порядке по названию города, а затем по фамилии сотрудника.

SELECT name, city, date_first, date_last
FROM trip
WHERE MONTH(date_first) = MONTH(date_last)
ORDER BY city ASC, name ASC;

	8. Вывести название месяца и количество командировок для каждого месяца. 
Считаем, что командировка относится к некоторому месяцу, если она началась в этом месяце. 
Информацию вывести сначала в отсортированном по убыванию количества, а потом в алфавитном порядке по названию месяца виде. Название столбцов – Месяц и Количество.

SELECT MONTHNAME(date_first) AS 'Месяц', 
COUNT(MONTHNAME(date_first)) AS 'Количество'
FROM trip 
GROUP BY 1 
ORDER BY 2 DESC, 1 ASC;

	9. Вывести сумму суточных (произведение количества дней командировки и размера суточных) для командировок, первый день которых пришелся на февраль или март 2020 года. 
Значение суточных для каждой командировки занесено в столбец per_diem. Вывести фамилию и инициалы сотрудника, город, первый день командировки и сумму суточных. 
Последний столбец назвать Сумма. Информацию отсортировать сначала  в алфавитном порядке по фамилиям сотрудников, а затем по убыванию суммы суточных.

SELECT 
    name, 
    city, 
    date_first,
    (DATEDIFF(date_last, date_first)+1) * per_diem AS "Сумма"
FROM trip
WHERE MONTHNAME(date_first) IN ('March', 'February')
ORDER BY name ASC, СУММА DESC;

	10. Вывести фамилию с инициалами и общую сумму суточных, полученных за все командировки для тех сотрудников, которые были в командировках больше чем 3 раза, в отсортированном по убыванию сумм суточных виде. 
Последний столбец назвать Сумма.

SELECT name, 
SUM(DATEDIFF(date_last + 1, date_first) * per_diem) AS Сумма
FROM trip
GROUP BY name
HAVING COUNT(name)>3
ORDER BY name ASC;


