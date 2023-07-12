--GITHUB Account
--https://github.com/softwareNuggets/SQL_Server_shorts
--vid_11_calculate_y_m_d_between_two_dates.sql

declare 
	@start_date date = DateFromParts(2000,01,01),
	@start_year int, @start_month int, @start_day int,

	@stop_date date = DateFromParts(2023,05,16),
	@stop_year int, @stop_month int, 
	@stop_day int;

set @start_year		= year(@start_date)
set @start_month	= month(@start_date)
set @start_day		= day(@start_date)

set @stop_year	= year(@stop_date)
set @stop_month	= month(@stop_date)
set @stop_day	= day(@stop_date)

/* getdate() = today's date
set @stop_year	= year(getdate())
set @stop_month	= month(getdate())
set @stop_day	= day(getdate())
*/

if(@start_day > @stop_day)
begin
	set @stop_month	= @stop_month - 1;
	set @stop_day	= @stop_day + 
		   DAY(EOMONTH(DATEADD(MONTH, -1, @start_date)));
end;

if(@start_month > @stop_month)
begin
	set @stop_year	= @stop_year-1;
	set @stop_month	= @stop_month+12;
end;

select	
	cast(@stop_year - @start_year  as varchar(3)) 
									+ '- years - '+
	cast(@stop_month - @start_month  as varchar(3)) 
									+ '- months -'+
	cast(@stop_day - @start_day	  as varchar(3)) 
									+ '- days'

--set @stop_day	= @stop_day + 
--		   DAY(EOMONTH(DATEADD(MONTH, -1, @start_date)));
/*
declare @start_date date = DateFromParts(2023,05,25);
select month(@start_date)
select dateadd(month, -1, @start_date)
select EOMONTH(dateadd(month, -1, @start_date))
select DAY(EOMONTH(DATEADD(MONTH, -1, @start_date)));
*/
