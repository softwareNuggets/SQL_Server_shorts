--GITHUB
--softwareNuggets/SQL_Server_shorts
--create_alzheimer_table_and_data.sql


select the_year, disease_name, [state], deaths
from  [dbo].[Alzheimer]
WHERE state = 'Florida'
order by the_year

--The purpose of using the LAG() function is to compare 
--the number of deaths in the current year with the number 
--of deaths in the previous year. It helps identify trends, 
--changes, or variations in the number of deaths 
--from Alzheimer's disease over time.



SELECT the_year, disease_name, state, deaths,
       lag(deaths) 
			OVER (PARTITION BY [state] ORDER BY the_year) 
			AS previous_year_deaths
FROM [dbo].[Alzheimer]
WHERE state = 'Florida'
ORDER BY disease_name, the_year;












