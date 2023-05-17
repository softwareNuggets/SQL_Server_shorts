--GITHUB Account
--https://github.com/softwareNuggets/SQL_Server_shorts
--vid13_5_ways_to_create_non_clustered_primary_key.sql


CREATE TABLE Department1
(
	DeptId INT IDENTITY(1,1) PRIMARY KEY,
	DeptName NVARCHAR(64) NOT NULL,
	IsActive BIT DEFAULT('true'),
	create_date DATETIME DEFAULT(GETDATE()),
	create_user NVARCHAR(30) NOT NULL,
	last_updated DATETIME,
	last_user_updated NVARCHAR(30)
);

CREATE TABLE Department2
(
	DeptId INT IDENTITY(1,1) 
				CONSTRAINT PK_Department2 PRIMARY KEY,
	DeptName NVARCHAR(64) NOT NULL,
	IsActive BIT DEFAULT('true'),
	create_date DATETIME DEFAULT(GETDATE()),
	create_user NVARCHAR(30) NOT NULL,
	last_updated DATETIME,
	last_user_updated NVARCHAR(30)
);

create table Department3
(
	DeptId int identity(1,1),
	DeptName nvarchar(64) not null,
	IsActive bit default('true'),
	create_date datetime default(getdate()),
	create_user nvarchar(30) not null,
	last_upated datetime,
	last_user_updated nvarchar(30),
	CONSTRAINT PK_Department3 
			PRIMARY KEY (DeptId)
)

create table Department4
(
	DeptId int identity(1,1),
	DeptName nvarchar(64) not null,
	IsActive bit default('true'),
	create_date datetime default(getdate()),
	create_user nvarchar(30) not null,
	last_upated datetime,
	last_user_updated nvarchar(30),
	CONSTRAINT PK_Department4 
			PRIMARY KEY NONCLUSTERED (DeptId)
)

CREATE TABLE Department5
(
	DeptId INT IDENTITY(1,1),
	DeptName NVARCHAR(64) NOT NULL,
	IsActive BIT DEFAULT('true'),
	create_date DATETIME DEFAULT(GETDATE()),
	create_user NVARCHAR(30) NOT NULL,
	last_updated DATETIME,
	last_user_updated NVARCHAR(30)
);

ALTER TABLE Department5
ADD CONSTRAINT PK_Department5 PRIMARY KEY (DeptId);

select *
from INFORMATION_SCHEMA.TABLE_CONSTRAINTS
where table_name like '%Dep%'

drop table Department1;
drop table Department2;
drop table Department3;
drop table Department4;
drop table Department5;