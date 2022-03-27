SELECT MAX(Salary) AS SecondHighestSalary
FROM person
WHERE Salary NOT IN (SELECT MAX(Salary) FROM person);

-- Or ("NOT IN" = "<")

SELECT MAX(Salary) AS SecondHighestSalary
FROM person
WHERE Salary < (SELECT MAX(Salary) FROM person);

-- Or 

SELECT Salary AS SecondHighestSalary
FROM person
ORDER BY Salary DESC
LIMIT 1 OFFSET 1;