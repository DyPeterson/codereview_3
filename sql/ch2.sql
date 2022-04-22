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

-- Select the ids of the values in the inventories table that have more than one version (i.e. version > 1). This is your subquery. 
-- Then select everything from the inventory_parts table where the inventory_id matches an id in that subquery. Limit the output to 10 rows.
SELECT *
FROM inventory_parts
WHERE inventory_id IN (
    SELECT
        id
    FROM
        inventories
    WHERE
        version > 1)
LIMIT 10;

-- Aliasing the sets table as 's', select the year and name of the values in that table that include the substring
-- 'Batman'. Concatenate three exclamation marks to the end of each name, and make all the names upper case.
SELECT
	s.name,
    s.year,
    UPPER(CONCAT(s.name, '!!!')) AS loud_names
FROM sets AS s
WHERE
	s.name REGEXP 'Batman';
    
-- For every quantity value greater than 1 in the inventory_parts table, double the value of the quantity. 
-- Limit your output to 20 rows, and order it by quantity.
SELECT 
	*,
	quantity * 2 AS double_quantity
FROM inventory_parts
WHERE quantity > 1
ORDER BY quantity
LIMIT 20;