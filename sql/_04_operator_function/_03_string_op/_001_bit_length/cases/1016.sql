--test bit_length with monetary as parameter
create class tb(
		col1 monetary
);

insert into tb values(10);

select bit_length(col1) from tb;

drop class tb;
