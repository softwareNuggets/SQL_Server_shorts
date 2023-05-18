CREATE TABLE #Alzheimer
(
	the_year		[int] NOT NULL,
	disease_name	[nvarchar](50) NOT NULL,
	[state]			[nvarchar](50) NOT NULL,
	deaths			[int] NOT NULL,
	ID				[int] IDENTITY(1,1) primary key not null,
	state_abbr		[char](2) NULL
)
 
insert into #Alzheimer(the_year, disease_name,state, deaths,state_abbr)
values
(1999,'Alzheimer disease','Florida',3059,'FL'),
(2000,'Alzheimer disease','Florida',3265,'FL'),
(2001,'Alzheimer disease','Florida',3643,'FL'),
(2002,'Alzheimer disease','Florida',4052,'FL'),
(2003,'Alzheimer disease','Florida',4316,'FL'),
(2004,'Alzheimer disease','Florida',4307,'FL'),
(2005,'Alzheimer disease','Florida',4608,'FL'),
(2006,'Alzheimer disease','Florida',4689,'FL'),
(2007,'Alzheimer disease','Florida',4644,'FL'),
(2008,'Alzheimer disease','Florida',4743,'FL'),
(2009,'Alzheimer disease','Florida',4617,'FL'),
(2010,'Alzheimer disease','Florida',4831,'FL'),
(2011,'Alzheimer disease','Florida',4507,'FL'),
(2012,'Alzheimer disease','Florida',4422,'FL'),
(2013,'Alzheimer disease','Florida',5093,'FL'),
(2014,'Alzheimer disease','Florida',5874,'FL'),
(2015,'Alzheimer disease','Florida',7031,'FL'),
(2016,'Alzheimer disease','Florida',7155,'FL'),
(2017,'Alzheimer disease','Florida',6980,'FL')