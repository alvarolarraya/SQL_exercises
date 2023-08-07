/* Supuesto: Admisión en las universidades */

create table College
( cName    	varchar2(8),
  state  	varchar2(2),
  enrollment   	number(5),
constraint pk_College primary key (cName)
);

create table Student
( sID    	number(3),
  sName  	varchar2(10),
  GPA       number(2,1),
  sizeHS    number(4),
  constraint pk_Student primary key (sID)
);

create table Apply
( sID    	number(3),
  cName    	varchar2(8),
  major  	varchar2(15),
  decision   varchar2(1),
constraint pk_Apply primary key (sID,cName,major),
constraint fk_Student foreign key (sID) references Student (sID),
constraint fk_College foreign key (cName) references College (cName),
constraint ch_decision check (decision in('Y','N'))
);

INSERT INTO College VALUES('Stanford', 'CA', 15000);
INSERT INTO College VALUES('Berkeley', 'CA', 36000);
INSERT INTO College VALUES('MIT', 'MA', 10000);
INSERT INTO College VALUES('Cornell', 'NY', 21000);

INSERT INTO Student VALUES(123, 'Amy', 3.9, 1000);
INSERT INTO Student VALUES(234, 'Bob', 3.6, 1500);
INSERT INTO Student VALUES(345, 'Craig', 3.5, 500);
INSERT INTO Student VALUES(456, 'Doris', 3.9, 1000);
INSERT INTO Student VALUES(567, 'Edward', 2.9, 2000);
INSERT INTO Student VALUES(678, 'Fay', 3.8, 200);
INSERT INTO Student VALUES(789, 'Gary', 3.4, 800);
INSERT INTO Student VALUES(987, 'Helen', 3.7, 800);
INSERT INTO Student VALUES(876, 'Irene', 3.9, 400);
INSERT INTO Student VALUES(765, 'Jay', 2.9, 1500);
INSERT INTO Student VALUES(654, 'Amy', 3.9, 1000);
INSERT INTO Student VALUES(543, 'Craig', 3.4, 2000);

INSERT INTO Apply VALUES(123, 'Stanford', 'CS', 'Y');
INSERT INTO Apply VALUES(123, 'Stanford', 'EE', 'N');
INSERT INTO Apply VALUES(123, 'Berkeley', 'CS', 'Y');
INSERT INTO Apply VALUES(123, 'Cornell', 'EE', 'Y');
INSERT INTO Apply VALUES(234, 'Berkeley', 'biology', 'N');
INSERT INTO Apply VALUES(345, 'MIT', 'bioengineering', 'Y');
INSERT INTO Apply VALUES(345, 'Cornell', 'bioengineering', 'N');
INSERT INTO Apply VALUES(345, 'Cornell', 'CS', 'Y');
INSERT INTO Apply VALUES(345, 'Cornell', 'EE', 'N');
INSERT INTO Apply VALUES(678, 'Stanford', 'history', 'Y');
INSERT INTO Apply VALUES(987, 'Stanford', 'CS', 'Y');
INSERT INTO Apply VALUES(987, 'Berkeley', 'CS', 'Y');
INSERT INTO Apply VALUES(876, 'Stanford', 'CS', 'N');
INSERT INTO Apply VALUES(876, 'MIT', 'biology', 'Y');
INSERT INTO Apply VALUES(876, 'MIT', 'marine biology', 'N');
INSERT INTO Apply VALUES(765, 'Stanford', 'history', 'Y');
INSERT INTO Apply VALUES(765, 'Cornell', 'history', 'N');
INSERT INTO Apply VALUES(765, 'Cornell', 'psychology', 'Y');
INSERT INTO Apply VALUES(543, 'MIT', 'CS', 'N');

commit;