--test bit_length with numeric as parameter
create class tb(
		col1 numeric
);

insert into tb values(10.10);

select bit_length(col1) from tb;

drop class tb;
