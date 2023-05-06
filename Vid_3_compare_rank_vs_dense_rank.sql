--source code for this video is located at:
--GITHUB Account
--https://github.com/softwareNuggets/SQL_Server_shorts
--Vid_3_compare_rank_vs_dense_rank

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
    (4, 1,'Samantha', 'Lee', 50000.00),
    (5, 2,'David', 'Davis', 35000.00),
    (6, 2,'Emily', 'Jones', 70000.00),
    (7, 1,'Tom', 'Wilson', 24000.00),
    (8, 1,'Amy', 'Martin', 85000.00),
    (9, 2,'Michael', 'Brown', 80000.00),
    (10, 1,'Laura', 'Garcia', 50000.00);

SELECT DeptId, LastName, salary, 
		rank() 
			OVER (partition by deptId ORDER BY salary DESC) 
			as salary_rank
FROM #EmployeeSalary


SELECT DeptId, LastName, salary, 
		dense_rank() 
			OVER (partition by deptId ORDER BY salary DESC) 
			as salary_rank
FROM #EmployeeSalary



