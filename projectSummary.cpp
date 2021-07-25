/*
You are given a table, Projects, containing three columns: Task_ID, Start_Date and End_Date. It is guaranteed that the difference between the End_Date and the Start_Date is equal to 1 day for each row in the table.



If the End_Date of the tasks are consecutive, then they are part of the same project. Samantha is interested in finding the total number of different projects completed.

Write a query to output the start and end dates of projects listed by the number of days it took to complete the project in ascending order. If there is more than one project that have the same number of completion days, then order by the start date of the project.

Sample Input
Task_ID Start_Date End_Date
1 2015-10-01 2015-10-02
24 2015-10-02 2015-10-03
2 2015-10-03 2015-10-04
23 2015-10-04 2015-10-05
3 2015-10-11 2015-10-12
22 2015-10-12 2015-10-13
4 2015-10-15 2015-10-16
21 2015-10-17 2015-10-18
5 2015-10-19 2015-10-20
20 2015-10-21 2015-10-22
6 2015-10-25 2015-10-26
19 2015-10-26 2015-10-27
7 2015-10-27 2015-10-28
18 2015-10-28 2015-10-29
8 2015-10-29 2015-10-30
17 2015-10-30 2015-10-31
9 2015-11-01 2015-11-02
16 2015-11-04 2015-11-05
10 2015-11-07 2015-11-08
15 2015-11-06 2015-11-07
11 2015-11-05 2015-11-06
14 2015-11-11 2015-11-12
12 2015-11-12 2015-11-13
13 2015-11-17 2015-11-18

Sample Output
2015-10-15 2015-10-16 
2015-10-17 2015-10-18 
2015-10-19 2015-10-20 
2015-10-21 2015-10-22 
2015-11-01 2015-11-02 
2015-11-17 2015-11-18 
2015-10-11 2015-10-13 
2015-11-11 2015-11-13 
2015-10-01 2015-10-05 
2015-11-04 2015-11-08 
2015-10-25 2015-10-31

*/

select Start_Date, min(End_Date)
from (select Start_Date from Projects where Start_Date not in(select End_Date from Projects)) a,
     (select End_Date from Projects where End_Date not in (select Start_Date from Projects)) b
where Start_Date < End_Date 
group by Start_Date
order by datediff(min(End_Date), Start_Date);
