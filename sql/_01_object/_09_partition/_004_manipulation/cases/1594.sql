--create range partition table with timestamp data type and one partition having maxvalue,then insert data to this table,then delete several records whose separated value less than maxvalue

create table range_test(id int not null ,	
				test_time time,
				test_date date,
				test_timestamp timestamp,
                                primary key (id, test_timestamp))
		PARTITION BY RANGE (test_timestamp) (
		PARTITION p0 VALUES LESS THAN MAXVALUE
	);
	insert into range_test values(1,'06:00:00','2005-01-01','2005-01-01 09:00:00');
	insert into range_test values(2,'07:00:00','2005-06-01','2005-06-01 09:00:00');
	insert into range_test values(3,'08:00:00','2005-12-01','2005-12-01 09:00:00');
	insert into range_test values(8,NULL,NULL,NULL);
delete from range_test  where test_timestamp < '2006-01-01 09:00:00';
select * from range_test order by 1;


drop table range_test;
