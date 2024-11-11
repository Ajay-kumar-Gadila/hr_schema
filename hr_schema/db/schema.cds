namespace hrSchema;

entity Regions {
  key Region_ID   : Integer;
      Region_Name : String(100);
      countries   : Association to many Countries
                      on countries.Region_ID = $self.Region_ID;
}

entity Countries {
  key Country_ID   : Integer;
      Country_Name : String(100);
      Region_ID    : Integer;
      region       : Association to Regions
                       on region.Region_ID = $self.Region_ID;
      locations    : Association to many Locations
                       on locations.Country_ID = $self.Country_ID;
}

entity Locations {
  key Location_ID    : Integer;
      Street_Address : String(100);
      Postal_Code    : String(20);
      City           : String(100);
      State_Province : String(100);
      Country_ID     : Integer;
      country        : Association to Countries
                         on country.Country_ID = $self.Country_ID;
      departments    : Association to many Departments
                         on departments.Location_ID = $self.Location_ID;
}

entity Departments {
  key Department_ID   : Integer;
      Department_Name : String(100);
      Manager_ID      : Integer;
      Location_ID     : Integer;
      location        : Association to Locations
                          on location.Location_ID = $self.Location_ID;
      employees       : Association to many Employees
                          on employees.Department_ID = $self.Department_ID;
}

entity Jobs {
  key Job_ID     : Integer;
      Job_Title  : String(100);
      Min_Salary : Decimal(15, 2);
      Max_Salary : Decimal(15, 2);
}

entity Employees {
  key Employee_ID    : Integer;
      First_Name     : String(50);
      Last_Name      : String(50);
      Email          : String(100);
      Phone_Number   : String(50);
      Hire_Date      : Date;
      Job_ID         : Integer;
      job            : Association to Jobs
                         on job.Job_ID = $self.Job_ID;
      Salary         : Decimal(15, 2);
      Commission_Pct : Decimal(5, 2);
      Manager_ID     : Integer;
      Department_ID  : Integer;
      department     : Association to Departments
                         on department.Department_ID = $self.Department_ID;
}


entity Job_History {
  key Employee_ID   : Integer;
  key Start_Date    : Date;
      End_Date      : Date;
      Job_ID        : Integer;
      job           : Association to Jobs
                        on job.Job_ID = $self.Job_ID;
      Department_ID : Integer;
      department    : Association to Departments
                        on department.Department_ID = $self.Department_ID;
}
