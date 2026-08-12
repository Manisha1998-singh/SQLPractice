USE SQLPractice;
GO


SELECT *
FROM Employees1;

SELECT  Name, Salary
FROM Employees1;

SELECT * 
FROM Employees1
WHERE Department = 'IT';

----Salary greater than 60,000
SELECT * 
FROM Employees1
WHERE Salary > 60000;

----Salary less than 60,000
SELECT * 
FROM Employees1
WHERE Salary < 60000;

----Employees from IT and salary greater than 60,000:

SELECT * 
FROM Employees1
WHERE Department = 'IT'
AND Salary > 60000;

----Employees from Delhi or Noida:

SELECT * 
FROM Employees1
WHERE City = 'Delhi'
OR City = 'Noida';


---Highest salary first:

SELECT * 
FROM Employees1
ORDER BY Salary DESC;

---Lowest salary first:

SELECT * 
FROM Employees1
ORDER BY Salary ASC;

---Find unique departments

SELECT DISTINCT Department
FROM Employees1;

---Names starting with M:

SELECT * 
FROM Employees1
WHERE Name LIKE 'M%';

---Names containing i:

SELECT *
FROM Employees1
WHERE Name LIKE '%i%';

---Salary between 50,000 and 75,000:

SELECT *
FROM Employees1
WHERE Salary BETWEEN 40000 AND 80000;

---Employees from Delhi or Noida:

SELECT * 
FROM Employees1
WHERE City IN ('Delhi', 'Noida');

----⭐ Aggregate queries

---Count employees

SELECT COUNT(*) AS TotalEmployees
FROM Employees1;

----Highest salary

SELECT MAX(Salary) AS MaxSalary
FROM Employees1;


---Lowest salary

SELECT MIN(Salary) AS MinSalary
FROM Employees1;

---Average salary

SELECT AVG(Salary) AS AvgSalary
FROM Employees1;


---Total salary

SELECT SUM(Salary) AS TotalSalary
FROM Employees1;


----⭐ GROUP BY — very important for interviews

---Number of employees in each department:

SELECT Department, COUNT(*) AS  TotalEmp
FROM Employees1
GROUP BY Department;

---Average salary in each department:

SELECT Department, AVG(Salary) AS  AvgSalary
FROM Employees1
GROUP BY Department;


---Find departments where the average salary is greater than ₹60,000.

SELECT Department, AVG(Salary) AS  AvgSalary
FROM Employees1
GROUP BY Department
HAVING AVG(Salary) > 60000;


----ORDER BY

---Find the top 3 highest-paid employees.

SELECT TOP 3 *
FROM Employees1
ORDER BY Salary DESC;

