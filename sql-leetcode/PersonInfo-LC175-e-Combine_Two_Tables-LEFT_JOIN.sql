-- more efficient when the previous table has less columns

SELECT 
p.FirstName,p.LastName,a.City,a.State
FROM Person p
LEFT JOIN Address a ON p.PersonID = a.PersonID;