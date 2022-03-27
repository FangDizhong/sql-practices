-- In self_JOIN,
-- for each row in each TABLE,
-- IF the-ON-condition is true,
-- JOINed as one row.

-- in JOIN, AND is more efficient,
-- because WHERE will be handle after the JOIN clause
SELECT e.FirstName AS Employee
FROM Person e JOIN Person m
ON e.ManagerID = m.PersonID
AND e.Salary > m.Salary;

-- NOT GOOD 
-- because people whose ManagerID IS NULL 
-- is not necessary to be a Manager
WITH ManagerSalary AS (
  SELECT PersonID,Salary 
  FROM person 
  WHERE ManagerID IS NULL
)

SELECT FirstName
FROM person p
WHERE Salary >(
  SELECT Salary 
  FROM ManagerSalary m
  WHERE m.PersonID = p.ManagerID
  );