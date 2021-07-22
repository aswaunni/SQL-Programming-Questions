/*
Julia asked her students to create some coding challenges. Write a query to print the hacker_id, name, and the total number of challenges created by each student. Sort your results by the total number of challenges in descending order. If more than one student created the same number of challenges, then sort the result by hacker_id. If more than one student created the same number of challenges and the count is less than the maximum number of challenges created, then exclude those students from the result.

Input Format

The following tables contain challenge data:

Hackers: The hacker_id is the id of the hacker, and name is the name of the hacker.

Challenges: The challenge_id is the id of the challenge, and hacker_id is the id of the student who created the challenge.
*/

select h.hacker_id, h.name, count(c.challenge_id) as cnt 
from Challenges as c INNER JOIN Hackers as h
on c.hacker_id = h.hacker_id
group by c.hacker_id, h.name
    having cnt = (select max(cnts.cnt) 
                                 from (select count(challenge_id) as cnt 
                                       from Challenges 
                                       group by hacker_id) as cnts)
    OR cnt IN (select cnts.cnt 
                              from (select count(challenge_id) as cnt 
                                       from Challenges 
                                       group by hacker_id) as cnts
                              group by cnts.cnt
                                having count(cnts.cnt) = 1)
order by cnt desc, hacker_id
