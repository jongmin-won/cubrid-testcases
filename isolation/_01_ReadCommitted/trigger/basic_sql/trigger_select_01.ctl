/*
Test Case: select in trigger & insert,update,delete,select
Priority: 1
Reference case:
Author: Lily

Test Point:
when trigger is called, insert statement is executed
there is primary key on table;

NUM_CLIENTS = 4
C1: insert into tt1 to fire a trigger to select table hi; 
C2: insert into hi;
C3: delete from hi;
C4: update from hi; 
*/

MC: setup NUM_CLIENTS = 4;
C1: set transaction lock timeout INFINITE;
C1: set transaction isolation level read committed;
C2: set transaction lock timeout INFINITE;
C2: set transaction isolation level read committed;
C3: set transaction lock timeout INFINITE;
C3: set transaction isolation level read committed;
C4: set transaction lock timeout INFINITE;
C4: set transaction isolation level read committed;

/* preparation */
C1: DROP TABLE IF EXISTS tt1;
C1: DROP TABLE IF EXISTS hi;
C1: CREATE TABLE hi( id INT PRIMARY KEY, col VARCHAR(10));
C1: INSERT INTO hi values(1,'111'),(2,'222'),(3,'333');
C1: CREATE TRIGGER trg_insert BEFORE INSERT ON hi IF 4 < (SELECT COUNT(*) FROM hi) EXECUTE REJECT;
C1: commit work;

/* test case */
C1: INSERT INTO hi VALUES(4,'done');
C2: INSERT INTO hi VALUES(5,'test');
C3: DELETE FROM hi WHERE id=3;
C4: UPDATE hi SET id=id+10 WHERE col='222';
C1: INSERT INTO hi VALUES(6,'done');
C1: commit work;
MC: wait until C1 ready;
C2: commit work;
MC: wait until C2 ready;
C3: commit work;
MC: wait until C3 ready;
MC: sleep 1;
C4: select * from hi order by id;
C4: INSERT INTO hi VALUES(8,'REJECt');
C4: SELECT COUNT(*) FROM hi;
MC: wait until C4 ready;
C4: commit work;
MC: wait until C4 ready;

C1: SELECT * FROM hi order by 1,2;

C4: quit;
C3: quit;
C2: quit;
C1: quit;
