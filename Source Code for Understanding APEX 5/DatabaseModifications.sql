-- Modifications to the database used in the book.
-- Run this file as a script in APEX to execute all statements,
-- or cut and paste an individual statement into the SQL command tool.


-- From chapter 1

alter table EMP
add OffSite char(1);


update EMP 
set OffSite = 'N';

update EMP 
set OffSite = 'Y' 
where EName in ('SCOTT', 'ALLEN', 'WARD', 'TURNER');


-- From chapter 7

create table EMPLOG(Request varchar2(20), 
                    UserName varchar2(20),
                    RequestDate Date);


-- From chapter 8

alter table EMP
   add constraint ValidName 
   check (EName is not null);

alter table EMP
   add constraint ValidSalary 
   check (Sal > 0);


-- From chapter 12

create table USERS (UserName varchar2(12), Password varchar2(1000),
                    IsAdministrator char(1));

insert into USERS (UserName, Password, IsAdministrator)
values ('ADMIN', 
        apex_util.get_hash(apex_t_varchar2('ADMIN','1234'), null), 
        'Y');

insert into USERS (UserName, Password, IsAdministrator)
values ('GUEST', 
        apex_util.get_hash(apex_t_varchar2('GUEST',null), null), 
        'N');



