using { hrSchema as hr } from '../db/schema';

service hrService {
    entity Regions as projection on hr.Regions order by Region_ID asc;
    entity Countries as projection on hr.Countries order by Country_Name asc;
    entity Locations as projection on hr.Locations;
    entity Departments as projection on hr.Departments;
    entity Jobs as projection on hr.Jobs;
    entity Employees as projection on hr.Employees;
    entity Job_History as projection on hr.Job_History;
}
