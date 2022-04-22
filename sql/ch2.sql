use lego;
-- Select the name and part_num columns from the parts table. Show only names that include the substring 'Hair', and order them with the part_num in descending order
SELECT
	name,
    part_num
FROM
	parts
WHERE
	name REGEXP 'Hair'
ORDER BY
	part_num DESC;
-- From the sets table, select all the sets that included the word 'Showdown' in the name between 1990 and 2015
SELECT
	set_num,
	name,
    year
FROM
	sets
WHERE
	name REGEXP 'Showdown' AND
    year REGEXP '(199[0-9]|20[0-1][0-5])';

-- Aliasing the part_categories table as p, show the id and name of the values in that table where the name includes the word 'Bricks'
SELECT
    p.id, 
    p.name
FROM
    part_categories AS p
WHERE
    name REGEXP 'Bricks';
    
-- Select all the ids from the themes table where the name is in 'Pirates' or 'Star Wars'. This is your subquery.
-- Then show the names of all the sets where the theme_id matches an id in that subquery.
SELECT
	name AS set_name,
    theme_id
FROM
	sets
WHERE
	theme_id IN (
SELECT
	id
FROM
	themes
WHERE
	name IN ('Pirates','Star Wars'));    