--source code for this video is located at:
--GITHUB Account
--https://github.com/softwareNuggets/SQL_Server_shorts
--Vid_2_dense_rank_partition_by

--drop table #EmployeeSalary
CREATE TABLE #EmployeeSalary (
    EmployeeID INT,
	DeptId int,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Salary DECIMAL(10,2)
);

INSERT INTO #EmployeeSalary 
	(EmployeeID, DeptId, FirstName, LastName, Salary)
VALUES
    (1, 1,'John', 'Doe', 50000.00),
    (2, 1,'Jane', 'Smith', 30000.00),
    (3, 2,'Bob', 'Johnson', 80000.00),
    (4, 1,'Samantha', 'Lee', 65000.00),
    (5, 2,'David', 'Davis', 35000.00),
    (6, 2,'Emily', 'Jones', 70000.00),
    (7, 1,'Tom', 'Wilson', 24000.00),
    (8, 1,'Amy', 'Martin', 85000.00),
    (9, 2,'Michael', 'Brown', 80000.00),
    (10, 1,'Laura', 'Garcia', 50000.00);

select EmployeeID, DeptId, 
		FirstName, LastName, Salary
from #EmployeeSalary
order by DeptId asc, Salary Desc


SELECT DeptId, LastName, salary, 
		dense_rank() 
			OVER (partition by deptId ORDER BY salary DESC) 
			as salary_rank
FROM #EmployeeSalary



SELECT EmployeeID, DeptId, FirstName, LastName, Salary, salary_rank
FROM (
  SELECT EmployeeID, DeptId, FirstName, LastName, Salary,
         dense_rank() 
			OVER (PARTITION BY DeptId ORDER BY Salary DESC) 
			AS salary_rank
  FROM #EmployeeSalary
) AS subquery
WHERE salary_rank <= 2;