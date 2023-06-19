---------------------------
-----EXAMPLE #1
---------------------------

drop table #item
drop table #merge_items

create table #item
(
item_id int not null primary key,
item_desc varchar(10) not null,
qty int not null
)

insert into #item(item_id, item_desc, qty)
values
(1,'product1',50),
(2,'product2',50)

create table #merge_items
(
item_id int not null primary key,
item_desc varchar(10) not null,
qty int not null
)

insert into #merge_items(item_id, item_desc, qty)
values
(1,'product1',75),
(2,'product2',75)


select * from #item
select * from #merge_items


merge into #item as target
using #merge_items as source
on  (target.item_id = source.item_id)

--when a record exist in both sets
when matched then
	update set target.qty = source.qty

--record not in #item table, only in #merge_items
when not matched by target then
	insert (item_id, item_desc, qty)
	values(source.item_id, 
			source.item_desc, source.qty)

--only when record is in the merge_items	
when not matched by source then
	delete;

select * from #item


--------------------
---EXAMPLE 2
--------------------

drop table #item
drop table #merge_items

create table #item
(
item_id int not null primary key,
item_desc varchar(10) not null,
qty int not null
)

insert into #item(item_id, item_desc, qty)
values
(1,'product1',50),
(4,'product4',50);


create table #merge_items
(
item_id int not null primary key,
item_desc varchar(10) not null,
qty int not null
)

insert into #merge_items(item_id, item_desc, qty)
values
(1,'product1',75),
(2,'product1',75),
(3,'product1',75),
(4,'product2',75)


select * from #item
select * from #merge_items

target = orig
source = working

merge into #item as target
using #merge_items as source
on  (target.item_id = source.item_id)

--when a record exist in both sets
when matched then
	update set target.qty = source.qty

--record not in #item table, only in #merge_items
when not matched by target then
	insert (item_id, item_desc, qty)
	values(source.item_id, source.item_desc, source.qty)

--only when record is in the merge_items	
when not matched by source then
	delete;

select * from #item


--------------------
---EXAMPLE 3
--------------------
drop table #item
drop table #merge_items

create table #item
(
item_id int not null primary key,
item_desc varchar(10) not null,
qty int not null
)

insert into #item(item_id, item_desc, qty)
values
(1,'product1',100),
(2,'product1',100),
(3,'product1',100),
(4,'product2',100)


create table #merge_items
(
item_id int not null primary key,
item_desc varchar(10) not null,
qty int not null
)

insert into #merge_items(item_id, item_desc, qty)
values
(1,'product1',75)



select * from #item
select * from #merge_items

target = orig
source = working

merge into #item as target
using #merge_items as source
on  (target.item_id = source.item_id)

--when a record exist in both sets
when matched then
	update set target.qty = source.qty

--record not in #item table, only in #merge_items
when not matched by target then
	insert (item_id, item_desc, qty)
	values(source.item_id, source.item_desc, 
	source.qty)

--only when record is in the merge_items	
when not matched by source then
	delete;


select * from #item