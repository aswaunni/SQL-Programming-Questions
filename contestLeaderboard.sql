/*

The total score of a hacker is the sum of their maximum scores for all of the challenges. Write a query to print the hacker_id, name, and total score of the hackers ordered by the descending score. If more than one hacker achieved the same total score, then sort the result by ascending hacker_id. Exclude all hackers with a total score of  from your result.

Input Format

The following tables contain contest data:

Hackers: The hacker_id is the id of the hacker, and name is the name of the hacker.

Submissions: The submission_id is the id of the submission, hacker_id is the id of the hacker who made the submission, challenge_id is the id of the challenge for which the submission belongs to, and score is the score of the submission.
*/

select h.hacker_id, h.name, sum(tb.scores) as totals from Hackers h,
  (select hacker_id, max(score) as scores from Submissions group by hacker_id, challenge_id) tb 
where tb.hacker_id = h.hacker_id group by h.hacker_id, h.name having totals > 0 order by totals desc, h.hacker_id ;
