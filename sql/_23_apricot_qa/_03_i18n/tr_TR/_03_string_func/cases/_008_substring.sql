--+ holdcas on;
set names utf8;
CREATE TABLE test_tr ( 
  id     int    NOT NULL, 
  name      VARCHAR(20) collate utf8_tr_cs_uca);
  
insert into test_tr values (1,'Gülen');
insert into test_tr values (2,null);

--test
select id, name, substring (name,1,2) from test_tr order by 1;
--test
select id, name, substring (name,0) from test_tr order by 1;
--test
select id, name, substring (name,-3) from test_tr order by 1;
--test
select id, name, substring (name,-3,2) from test_tr order by 1;
--test
select id, name, substring (name,null,2) from test_tr order by 1;
--test
select id, name, substring (name,-3,null) from test_tr order by 1;
drop table test_tr;

set names iso88591;
commit;
--+ holdcas off;
