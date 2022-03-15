create table organization(organization_id integer, organization_name varchar(50), manager_id integer, parent_organization_id integer);

insert into organization values(1, "Commercial & Support", 101, 7);
insert into organization values(2, "Quality", 49, 11);
insert into organization values(3, "IT", 35, 1);
insert into organization values(4, "Finance", 3, 1);
insert into organization values(5, "HR", 2, 1);
insert into organization values(6, "Training", 5, 11);
insert into organization values(7, "Board of Directors", 1, null);
insert into organization values(8, "Development", 19, 3);
insert into organization values(9, "H&S", 67, 11);
insert into organization values(10, "Operations", 31, 3);
insert into organization values(11, "Management Systems", 94, 7);
insert into organization values(12, "Environment", 89, 11);
insert into organization values(13, "Noticing & Planning", 74, 1);
insert into organization values(14, "Procurement & Tendering", 55, 1);
insert into organization values(15, "Operations Division", 62, 7);
insert into organization values(16, "Highway Division", 47, 15);
insert into organization values(17, "Water", 78, 20);
insert into organization values(18, "Street Lighting", 12, 20);
insert into organization values(19, "PFI Lighting Division", 65, 15);
insert into organization values(20, "Infrastructure Division", 23, 15);
insert into organization values(21, "Substation Works", 43, 20);
insert into organization values(22, "Capital Area", 77, 23);
insert into organization values(23, "Major Projects Division", 81, 15);
insert into organization values(24, "Western Area", 87, 23);
insert into organization values(25, "Southern Area", 10, 23);

/*
    Present the organization hierarchy in human-readable format.
    The result set should include each organization level as a column (only names).
        i.e. level1, level2 ...
*/

select
  o1.organization_name as level1,
  o2.organization_name as level2,
  o3.organization_name as level3,
  o4.organization_name as level4
from organization o1
left join organization o2 on o2.parent_organization_id = o1.organization_id
left join organization o3 on o3.parent_organization_id = o2.organization_id
left join organization o4 on o3.parent_organization_id = o3.organization_id
where o1.parent_organization_id is null;
