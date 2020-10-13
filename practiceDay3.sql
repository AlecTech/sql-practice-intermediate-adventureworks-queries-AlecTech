-- AdventureWorks2012
-- 1.Q: Determine the employee with the highest accumulated vacation hours.

SELECT employee.EmployeeID, employee.VacationHours
FROM employee
WHERE  employee.VacationHours = (SELECT MAX(employee.VacationHours) FROM employee);
-- 2. Q: Determine how many employees there are whose names start with the letter S.

SELECT employee.ContactID, contact.FirstName
FROM employee INNER JOIN contact
ON employee.ContactID = contact.ContactID
WHERE contact.FirstName LIKE 'S%';

-- 3.Q: Determine the current pay rate of the CEO of Adventure Works.
SELECT employee.Title, employee.EmployeeID, employeepayhistory.Rate
FROM employee INNER JOIN employeepayhistory
ON employee.EmployeeID = employeepayhistory.EmployeeID
WHERE employee.Title = 'Chief Executive Officer';
