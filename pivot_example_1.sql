drop table Sales;

CREATE TABLE Sales (
    Product VARCHAR(50),
    SalesYR INT,
    Qty INT
);

INSERT INTO Sales (Product, SalesYR, Qty)
VALUES
    ('Product A', 2019, 100),
    ('Product A', 2020, 150),
    ('Product A', 2021, 200),
    ('Product B', 2019, 50),
    ('Product B', 2020, 75),
    ('Product B', 2021, 100),
    ('Product C', 2019, 300),
    ('Product C', 2020, 350),
    ('Product C', 2021, 400),
    ('Product D', 2019, 200),
    ('Product D', 2020, 250),
    ('Product D', 2021, 300),
    ('Product E', 2019, 150),
    ('Product E', 2020, 175),
    ('Product E', 2021, 200),
    ('Product F', 2019, 75),
    ('Product F', 2020, 100),
    ('Product F', 2021, 125),
    ('Product G', 2019, 250),
    ('Product G', 2020, 300),
    ('Product G', 2021, 350),
	('Product A', 2019, 120);

--	the basic syntax for the PIVOT command 
--  is the following:
/*
	select ...
	from ...
	PIVOT (
	 aggregate_function(column to arrgregate)
	 for pivot column
	     in([value1],[value2],..., [valueN])
	) as piv

  The PIVOT clause rotates rows into columns
  
  Each distinct value will create a 
  separate column in the result set.
*/


select distinct SalesYR from Sales

select product, SalesYR, sum(Qty)
from Sales
group by product, SalesYR



CREATE TABLE Sales (
    Product VARCHAR(50),
    SalesYR INT,
    Qty INT
);

INSERT INTO Sales (Product, SalesYR, Qty)
VALUES
    ('Product A', 2019, 100),
    ('Product A', 2020, 150),
    ('Product A', 2021, 200),
    ('Product B', 2019, 50),
    ('Product B', 2020, 75),
    ('Product B', 2021, 100),
    ('Product C', 2019, 300),
    ('Product C', 2020, 350),
    ('Product C', 2021, 400),
    ('Product D', 2019, 200),
    ('Product D', 2020, 250),
    ('Product D', 2021, 300),
    ('Product E', 2019, 150),
    ('Product E', 2020, 175),
    ('Product E', 2021, 200),
    ('Product F', 2019, 75),
    ('Product F', 2020, 100),
    ('Product F', 2021, 125),
    ('Product G', 2019, 250),
    ('Product G', 2020, 300),
    ('Product G', 2021, 350),
	('Product A', 2019, 120);

select Product, [2019],[2020],[2021]
from (
	select product, SalesYR, Qty
	from Sales
	) as SourceData
	PIVOT	
	(					
	  sum(Qty)
	  FOR SalesYR IN ([2019], [2020], [2021])
	) AS results

