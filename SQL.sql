-- Identify the museums which are open on both Sunday and Monday. Display museum name, city*/
SELECT m.name as museum_name, m.city 
FROM museum_hours mh1
join museum m on m.museum_id=mh1.museum_id
WHERE day='Sunday'
and exists (select 1 from museum_hours mh2
			where mh2.museum_id = mh1.museum_id
            and mh2.day = 'Monday');


-- Which museum is open for the longest during a day. Display museum name, state and hours open and which day?*/
SELECT * FROM (
	SELECT m.name as museum_name, m.state, mh.day,
	STR_TO_DATE(TRIM(open), '%h:%i:%p') as Open_Time,
	STR_TO_DATE(TRIM(close), '%h:%i:%p') as Close_Time,
	TIMEDIFF(STR_TO_DATE(TRIM(close), '%h:%i:%p'), STR_TO_DATE(TRIM(open), '%h:%i:%p')) as Duration,
	RANK() OVER (ORDER BY TIMEDIFF(STR_TO_DATE(TRIM(close), '%h:%i:%p'), STR_TO_DATE(TRIM(open), '%h:%i:%p')) DESC) as Rnk
	FROM museum_hours mh
	join museum m on m.museum_id=mh.museum_id
) as subquery
WHERE Rnk=1;


-- Display the country and the city with most no of museums. Output 2 separate columns to mention the city and country.If there are multiple value, separate them with comma--
WITH cte_country as	
		(SELECT country, count(1)
		, RANK() OVER(ORDER BY count(1) DESC) AS rnk
		FROM museum
		GROUP BY country),
	  cte_city AS
		(SELECT city, count(1)
        , RANK() over(ORDER BY count(1) DESC) AS rnk
		FROM museum
		GROUP BY city)
SELECT group_concat( distinct country, ', ' ) AS Country
, group_concat(city, ', ') AS City
FROM cte_country
CROSS JOIN cte_city
WHERE cte_country.rnk = 1 AND cte_city.rnk = 1;