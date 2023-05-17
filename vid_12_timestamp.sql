--GITHUB Account
--https://github.com/softwareNuggets/SQL_Server_shorts
--vid_12_timestamp.sql

--drop table temp
create table temp
(
id		int			not null,
msg		varchar(10) not null,
ts		timestamp
)

insert into temp(id,msg)
values
(1,'sql server')

--timestamp is an integer, displayed in hex
--has nothing to do with date or time
--has everything to do with "concurrency"
select *, cast(ts as int)
from temp

update temp set msg='sql server' where id=1;
select *, cast(ts as int) from temp;


--Timestamp datatype empowers us to 
--implement a concurrency control 

--safeguarding data integrity and enabling 
--smooth multi-user interactions.

declare @user1 timestamp,
		@user2 timestamp;

set @user1 = (select ts from temp where id = 1)
set @user2 = (select ts from temp where id = 1)

--this update command will change the value of
--the timestamp column
update temp
set msg='11111111'
where id=1
and ts = @user1

--@user2 timestamp value is now old, no longer value
--this record will fail
update temp
set msg='22222222'
where id=1
and ts = @user2

select *
from temp
where id = 1