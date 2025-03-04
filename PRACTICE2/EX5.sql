SELECT CANDIDATE_ID
FROM CANDIDATES
WHERE skill IN ('Python', 'Tableau', 'PostgreSQL')

GROUP BY CANDIDATE_ID

HAVING COUNT( skill) = 3

  
Hint #1

First, we'll filter out any rows that don't fit within the necessary skillset. All we care about is Python, PostgreSQL, and Tableau.

We can use the IN clause to accomplish this step:

SELECT
  candidate_id
FROM candidates
WHERE 
skill IN ('Python', 'Tableau', 'PostgreSQL')
The query above will show all candidates having -at least one- of the required skills. But, this is not -exactly- what we want, since we're going for a candidate with all required skills.

Next, we need to determine how many of these skills each candidate have. You might want to look into GROUP BY, HAVING and COUNT functions to get a head start.

Hint #2

Did you put everything together? Let's find out!

We already eliminated the rows with unnecessary skills. Moreover, there are no duplicate records in the table. Therefore, a candidate is qualified for the job if they have all the required skills; in other words, if their skill-count is 3.

We'll separate the entries in the candidates table into groups using the GROUP BY clause. Then, we'll count the number of skills for each group using the COUNT function and filter the records using a HAVING clause.

SELECT
  candidate_id
FROM candidates
WHERE 
skill IN ('Python', 'Tableau', 'PostgreSQL')
GROUP BY fill_in_column
HAVING COUNT(skill) = 3
For the above query, can you guess what fill in column might be? Don't forget to sort the output as per problem description :)

Hint #3

From the last hint, for GROUP BY fill_in_column we want to group by candidate_id!

Also, the question asks us to "Sort the the output by candidate ID in ascending order" so we'll do:

ORDER BY candidate_id ASC;
