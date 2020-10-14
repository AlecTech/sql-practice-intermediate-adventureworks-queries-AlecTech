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

-- Drop down list shows 31 


-- 3.Q: Determine the current pay rate of the CEO of Adventure Works.
SELECT employee.Title, employee.EmployeeID, employeepayhistory.Rate
FROM employee INNER JOIN employeepayhistory
ON employee.EmployeeID = employeepayhistory.EmployeeID
WHERE employee.Title = 'Chief Executive Officer';

-- 4.Q: Determine how many employees are currently employed in each department.
SELECT COUNT(*) as TotalEmp, department.DepartmentID, department.Name
FROM employeedepartmenthistory INNER JOIN department
ON employeedepartmenthistory.DepartmentID = department.DepartmentID
WHERE employeedepartmenthistory.EndDate IS NULL
GROUP BY department.DepartmentID, department.Name;

-- 5.Challenge: Determine how many employees have a login ID ending with each number (0-9).

SELECT

(SELECT COUNT(employee.LoginID) 
FROM employee
WHERE  employee.LoginID LIKE '%0') as Totals_0,
(SELECT COUNT(employee.LoginID) 
FROM employee
WHERE  employee.LoginID LIKE '%1') as Totals_1,
(SELECT COUNT(employee.LoginID) 
FROM employee
WHERE  employee.LoginID LIKE '%2') as Totals_2,
(SELECT COUNT(employee.LoginID) 
FROM employee
WHERE  employee.LoginID LIKE '%3') as Totals_3,
(SELECT COUNT(employee.LoginID) 
FROM employee
WHERE  employee.LoginID LIKE '%4') as Totals_4,
(SELECT COUNT(employee.LoginID) 
FROM employee
WHERE  employee.LoginID LIKE '%5') as Totals_5,
(SELECT COUNT(employee.LoginID) 
FROM employee
WHERE  employee.LoginID LIKE '%6') as Totals_6,
(SELECT COUNT(employee.LoginID) 
FROM employee
WHERE  employee.LoginID LIKE '%7') as Totals_7,
(SELECT COUNT(employee.LoginID) 
FROM employee
WHERE  employee.LoginID LIKE '%8') as Totals_8,
(SELECT COUNT(employee.LoginID) 
FROM employee
WHERE  employee.LoginID LIKE '%9') as Totals_9;


-- maybe substr makes is shorter
SELECT SUBSTR(employee.LoginID,1,1) as Totals, count(employee.EmployeeID)
FROM employee
WHERE employee.LoginID LIKE '%0'
GROUP BY SUBSTR(employee.LoginID, 1, 1);



