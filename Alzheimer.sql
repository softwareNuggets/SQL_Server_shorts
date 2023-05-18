--GitHub
--https://github.com/softwareNuggets/SQL_Server_shorts
--       /Alzheimer.sql

--   NewValue - OrigValue
--   --------------------     * 100
--         OrigValue
--
select s1.the_year, s1.deaths, s2.the_year, s2.deaths,
	(cast(s2.deaths-s1.deaths as float) / s1.deaths)*100 as pct
from [dbo].[Alzheimer] s1
	left join [dbo].[Alzheimer] s2
		on(s1.state_abbr =s2.state_abbr
			and s1.the_year+1 = s2.the_year)
where s1.state = 'Florida'
order by s1.the_year
