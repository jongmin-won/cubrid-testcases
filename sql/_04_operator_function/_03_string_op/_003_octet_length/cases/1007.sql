--test octet_length with int as parameter
create class tb(
		col1 int
);

insert into tb values(22);

select octet_length(col1) from tb;
 
drop class tb;
