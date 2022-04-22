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

-- Selecting from the sets table:
-- Select the name and year column. 
-- Construct an additional column in your SELECT clause using the MySQL MAKEDATE() function.
-- This column's value should be a date corresponding to January 1st of the year.
-- Hint: You should use the year column and day 1 with MAKEDATE(). Read the MySQL documentation for MAKEDATE().
SELECT
	name,
    year,
    MAKEDATE(year, 1) AS make_date
FROM
	sets;

-- Count the total number of transparent colors in the colors table
-- (Note: is_trans is a binary value, and you want to show how many rows there are where it equals 1).
SELECT
	name,
    is_trans,
	COUNT(is_trans) AS trans_count
FROM colors
WHERE
	is_trans = 1
GROUP BY
	name;
-- Im not exactly sure what this question is asking, the note part threw me off. Did it want to display 28(total number of trans values) for each row and then display only those 28 rows?
-- I included both of these queries, one which will display 1 for the count next to each color that has a trans value and one that just counts all values showing 1 value.
SELECT
	COUNT(is_trans) AS trans_count
FROM colors
WHERE is_trans = 1;

-- Show the sum of all the parts for all the sets that came out since the year 2000.
SELECT
	year,
    SUM(num_parts) AS total_parts
FROM
	sets
WHERE
	year >= 2000
GROUP BY
	year;

-- Show the average number of parts for sets that came out since the year 2000.
SELECT
	year,
    AVG(num_parts) AS average_parts
FROM
	sets
WHERE
	year >= 2000
GROUP BY
	year;

-- Using GROUP BY, show the average number of parts for each theme_id in sets.
SELECT
	theme_id,
    AVG(num_parts) AS average_parts
FROM
	sets
GROUP BY theme_id;
