/*

-- Example case create statement:
CREATE TABLE sessions (
  id INTEGER NOT NULL PRIMARY KEY,
  userId INTEGER NOT NULL,
  duration DECIMAL NOT NULL
);

INSERT INTO sessions(id, userId, duration) VALUES(1, 1, 10);
INSERT INTO sessions(id, userId, duration) VALUES(2, 2, 18);
INSERT INTO sessions(id, userId, duration) VALUES(3, 1, 14);

-- Expected output:
-- UserId  AverageDuration
-- -----------------------
-- 1       12

Write SQL query to get the userId and Average session duration of users with more than one session.

*/

select userId, av from (
select userId, avg(duration) as av, count(*) as cnt from sessions group by userId having cnt > 1)
