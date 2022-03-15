create table emp(firstname varchar(20), lastname varchar(20),  unit integer);
insert into emp values('James', 'Barry', 1);
insert into emp values('James', 'Barry', 3);
insert into emp values('James', 'Barry', 1);
insert into emp values('Mohan', 'Kumar', 2);
insert into emp values('Raj', 'Gupta', 3);
insert into emp values('Raj', 'Gupta', 4);

create table unit(unitname varchar(20), country varchar(20), unitid integer);
insert into unit values ('HR', 'UK', 1);
insert into unit values ('R&D', 'USA', 2);
insert into unit values ('Sales', 'India', 3);
insert into unit values ('R&D', 'India', 4);

/*
    List employees who have worked in two different units.
    The result set should include:
        first name of the employee
        last name of the employee
        unit name
*/

--Start here
select
  e1.firstname,
  e1.lastname,
  (select unitname from unit where unitid = e1.unit) as unitname
from (
  -- get each placement in a unit only once
  select distinct e2.* from emp e2
) as e1
group by e1.firstname, e1.lastname
having count(e1.firstname & e1.lastname) = 2;
