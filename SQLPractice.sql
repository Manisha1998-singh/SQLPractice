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

---Find all unique cities.
---DISTINCT removes duplicate values.

SELECT DISTINCT city
FROM Employees1;

---⭐ Find all employees whose age is greater than 28.

SELECT age, name
FROM Employees1
WHERE age > 28;

---Find the employee with the highest salary.

SELECT MAX(salary) AS highestSal
FROM Employees1;

---Find all employees from the HR department whose salary is greater than ₹45,000.

SELECT *
FROM Employees1
WHERE  department = 'HR' 
AND salary > 45000;


---Find the number of employees in each city.

SELECT city, COUNT(*) AS empCount
FROM Employees1
GROUP BY city;

---Find the department with the highest average salary.

SELECT TOP 1  department, AVG(salary) AS empsalary
FROM Employees1
GROUP BY department
ORDER BY AVG(salary) DESC;



--Find employees from IT or HR:

SELECT * 
FROM Employees1
WHERE department IN ('IT', 'HR');

--Find employees who are not from IT:

SELECT * 
FROM Employees1
WHERE department NOT IN ('IT');


----Change an employee's salary:


UPDATE Employees1
SET Salary = 65000
WHERE EmployeeID = 2;

SELECT *
FROM Employees1;


--Delete one employee:

DELETE FROM Employees1
WHERE EmployeeID = 2;

---Find the 5 highest-paid employees:

SELECT TOP 5 *
FROM Employees1
ORDER BY Salary DESC;

---Find unique departments:

SELECT DISTINCT department
FROM Employees1;

---COUNT ---Total employees:

SELECT COUNT(*) AS totalEmp
FROM Employees1;

--Count IT employees:

SELECT COUNT(*) AS totalITEmp
FROM Employees1
WHERE Department = 'IT';

---CASE --Create a salary category:
SELECT 
Name, 
Salary,
CASE 
 WHEN Salary >= 70000 THEN 'High'
 WHEN Salary  >= 50000 THEN 'Mid'
 ELSE 'Low'
 END AS salaryCat
 FROM Employees1;


 ---Find employees whose city is missing:

 SELECT Name
 FROM Employees1
 WHERE City IS NULL;

  ---COALESCE --Replace NULL values:
 UPDATE Employees1
SET City = NULL
 WHERE EmployeeID = 1;
  


 ---COALESCE --Replace NULL values:
 SELECT 
 Name,
 COALESCE(City, 'Not Available') AS City
 FROM Employees1;
  

  ---Deparments

 CREATE TABLE Departments
(
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(45),
    Manager VARCHAR(100)
);
  USE SQLPractice;
  GO

  INSERT INTO Departments (DepartmentID, DepartmentName, Manager)
  VALUES 
  (1, 'IT',  'Rahul'),
  (2, 'HR',  'Priya'),
  (3, 'Finance',  'Amit'),
  (4, 'Sales',  'Neha');
  GO
  SELECT *
FROM Departments;

SELECT * 
FROM Employees1 
INNER JOIN Departments 
ON Employees1.Department = Departments.DepartmentName;

SELECT Employees1.Name, Employees1.Department, Departments.Manager 
FROM Employees1 
INNER JOIN Departments 
ON Employees1.Department = Departments.DepartmentName;


SELECT E.Name, E.Department, D.Manager
From Employees1 AS E
INNER JOIN Departments AS D
ON E.Department = D.DepartmentName;

---Find IT employees and their manager.

SELECT E.Name, E.Department, E.Salary, D.Manager
From Employees1 AS E
INNER JOIN Departments AS D
ON E.Department = D.DepartmentName
WHERE E.Department = 'IT';

--JOIN + ORDER BY
---Show all employees with their managers, highest salary first.
SELECT E.Name, E.Salary, D.Manager
FROM Employees1 AS E
INNER JOIN Departments AS D
ON E.Department = D.DepartmentName
ORDER BY E.Salary DESC;


SELECT *
FROM Employees1;

ALTER TABLE Employees1
ADD DepartmentID INT;





UPDATE Employees1
SET DepartmentID = 1
WHERE Department = 'IT';

UPDATE Employees1
SET DepartmentID = 2
WHERE Department = 'HR';

UPDATE Employees1
SET DepartmentID = 3
WHERE Department = 'Finance';

UPDATE Employees1
SET DepartmentID = 4
WHERE Department = 'Sales';

SELECT *
FROM Employees1;

ALTER TABLE Employees1
ADD CONSTRAINT FK_Employees_Departments
FOREIGN KEY (DepartmentID)
REFERENCES Departments(DepartmentID);



SELECT 
    EmployeeID,
    Name,
    Department,
    DepartmentID,
    Salary,
    City
FROM Employees1;
SELECT *
FROM Departments;
