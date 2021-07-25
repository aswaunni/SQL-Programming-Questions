/*

You are given three tables: Students, Friends and Packages. Students contains two columns: ID and Name. Friends contains two columns: ID and Friend_ID (ID of the ONLY best friend). Packages contains two columns: ID and Salary (offered salary in $ thousands per month).

Write a query to output the names of those students whose best friends got offered a higher salary than them. Names must be ordered by the salary amount offered to the best friends. It is guaranteed that no two students got same salary offer.
*/

select s.Name from Students s
    inner join Friends f on f.ID = s.ID 
    inner join Packages p on p.ID = f.ID 
    inner join Packages p1 on p1.ID = f.Friend_ID
where p1.Salary > p.Salary order by p1.Salary;

//Or

select s.Name from Students s, Friends f, Packages p, Packages p1
where f.ID = s.ID and p.ID = f.ID and p1.ID = f.Friend_ID and p1.Salary > p.Salary order by p1.Salary;
