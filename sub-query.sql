--drop table #TempTable
CREATE TABLE #TempTable (
  ID			INT,
  student_name	VARCHAR(255),
  Age			INT,
  grade			INT
);

INSERT INTO #TempTable 
		(ID, student_name, 
		 Age, grade) 
VALUES 
(1, 'Baron', 25,3), 
(2, 'Jason', 20,2), 
(3, 'Robin', 23,3),
(4, 'Pete', 18,1);

SELECT student_name
FROM #TempTable
WHERE grade in (select grade
				from #TempTable
				where age < 22
				);
				
SELECT student_name
FROM #TempTable
WHERE grade in (1,3);	

SELECT student_name
FROM #TempTable
WHERE age > (select avg(age)
			from #TempTable
			);			