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