using {hrSchema as hr} from '../db/schema';

annotate hr.Regions with @(
    UI.HeaderInfo : {
        TypeName      : 'Region',
        TypeNamePlural: 'Regions',
        Title         : { Value: Region_Name, Label: 'Region Name' },
        Description   : { Value: Region_Name, Label: 'Region Name' }
    },

    UI.LineItem : [
        { Value: Region_ID, Label: 'Region ID' },
        { Value: Region_Name, Label: 'Region Name' }
    ],

    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'regionDetailsFacet',
            Label : 'Region Details',
            Target: '@UI.FieldGroup#RegionDetails'
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'countriesFacet',
            Label : 'Countries',
            Target: 'countries/@UI.LineItem'  
        },
         {
            $Type : 'UI.ReferenceFacet',
            ID    : 'locationsFacet',
            Label : 'Locations',
            Target: 'hr.Locations/@UI.FieldGroup#LocationDetails'
        }
    ],

    UI.FieldGroup #RegionDetails : { Data: [
        { Value: Region_ID, Label: 'Region ID' },
        { Value: Region_Name, Label: 'Region Name' }
    ]}
);


annotate hr.Countries with @(
    UI.HeaderInfo : {
        TypeName      : 'Country',
        TypeNamePlural: 'Countries',
        Title         : { Value: Country_Name, Label: 'Country Name' },
        Description   : { Value: Country_Name, Label: 'Country Name' }
    },

    UI.LineItem : [
        { Value: Country_ID, Label: 'Country ID' },
        { Value: Country_Name, Label: 'Country Name' },
        { Value: Region_ID, Label: 'Region ID' }
    ],

    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Country Details',
            Target: '@UI.FieldGroup#CountryDetails'
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'locationsFacet',
            Label : 'Locations',
           Target: 'locations/@UI.LineItem'
        }
    ],

    UI.FieldGroup #CountryDetails : { Data: [
        { Value: Country_ID, Label: 'Country ID' },
        { Value: Country_Name, Label: 'Country Name' },
        { Value: Region_ID, Label: 'Region ID' }
    ]}
);

annotate hr.Locations with @(
    UI.HeaderInfo : {
        TypeName      : 'Location',
        TypeNamePlural: 'Locations',
        Title         : { Value: City, Label: 'City' },
        Description   : { Value: Street_Address, Label: 'Street Address' }
    },

    UI.LineItem : [
        { Value: Location_ID, Label: 'Location ID' },
        { Value: Street_Address, Label: 'Street Address' },
        { Value: Postal_Code, Label: 'Postal Code' },
        { Value: City, Label: 'City' },
        { Value: State_Province, Label: 'State Province' },
        { Value: Country_ID, Label: 'Country ID' }
    ],

    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'locationDetailsFacet',
            Label : 'Location Details',
            Target: '@UI.FieldGroup#LocationDetails'
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'departmentsFacet',
            Label : 'Departments',
            Target: 'departments/@UI.LineItem'  // Correct path to reference the 'departments' entity's LineItem
        }
    ],

    UI.FieldGroup #LocationDetails : { Data: [
        { Value: Location_ID, Label: 'Location ID' },
        { Value: Street_Address, Label: 'Street Address' },
        { Value: Postal_Code, Label: 'Postal Code' },
        { Value: City, Label: 'City' },
        { Value: State_Province, Label: 'State Province' },
        { Value: Country_ID, Label: 'Country ID' }
    ]}
);


annotate hr.Departments with @(

    UI.HeaderInfo : {
        TypeName      : 'Department',
        TypeNamePlural: 'Departments',
        Title         : { Value: Department_Name, Label: 'Department Name' },
        Description   : { Value: Department_Name, Label: 'Department Name' }
    },

    UI.LineItem : [
        { Value: Department_ID, Label: 'Department ID' },
        { Value: Department_Name, Label: 'Department Name' },
        { Value: Manager_ID, Label: 'Manager ID' },
        { Value: Location_ID, Label: 'Location ID' }
    ],

    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'departmentDetailsFacet',
            Label : 'Department Details',
            Target: '@UI.FieldGroup#DepartmentDetails'
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'employeesFacet',
            Label : 'Employees',
            Target: 'employees/@UI.LineItem'  // Correct path to reference the 'employees' entity's LineItem
        }
    ],

    UI.FieldGroup #DepartmentDetails : {Data: [
        { Value: Department_ID, Label: 'Department ID' },
        { Value: Department_Name, Label: 'Department Name' },
        { Value: Manager_ID, Label: 'Manager ID' },
        { Value: Location_ID, Label: 'Location ID' }
    ]}
);



annotate hr.Jobs with @(

    UI.HeaderInfo            : {
        TypeName      : 'Job',
        TypeNamePlural: 'Jobs',
        Title         : {
            Value: Job_Title,
            Label: 'Job Title'
        },
        Description   : {
            Value: Job_Title,
            Label: 'Job Title'
        }
    },

    UI.LineItem              : [
        {
            Value: Job_ID,
            Label: 'Job ID'
        },
        {
            Value: Job_Title,
            Label: 'Job Title'
        },
        {
            Value: Min_Salary,
            Label: 'Minimum Salary'
        },
        {
            Value: Max_Salary,
            Label: 'Maximum Salary'
        }
    ],

    UI.Facets                : [{
        $Type : 'UI.ReferenceFacet',
        ID    : 'jobDetailsFacet',
        Label : 'Job Details',
        Target: '@UI.FieldGroup#JobDetails'
    }],

    UI.FieldGroup #JobDetails: {Data: [
        {
            Value: Job_ID,
            Label: 'Job ID'
        },
        {
            Value: Job_Title,
            Label: 'Job Title'
        },
        {
            Value: Min_Salary,
            Label: 'Minimum Salary'
        },
        {
            Value: Max_Salary,
            Label: 'Maximum Salary'
        }
    ]}
);

annotate hr.Employees with @(

    UI.HeaderInfo : {
        TypeName      : 'Employee',
        TypeNamePlural: 'Employees',
        Title         : { Value: First_Name, Label: 'First Name' },
        Description   : { Value: Last_Name, Label: 'Last Name' }
    },

    UI.LineItem : [
        { Value: Employee_ID, Label: 'Employee ID' },
        { Value: First_Name, Label: 'First Name' },
        { Value: Last_Name, Label: 'Last Name' },
        { Value: Email, Label: 'Email' },
        { Value: Phone_Number, Label: 'Phone Number' },
        { Value: Hire_Date, Label: 'Hire Date' },
        { Value: Job_ID, Label: 'Job ID' },
        { Value: Salary, Label: 'Salary' },
        { Value: Commission_Pct, Label: 'Commission Percentage' },
        { Value: Manager_ID, Label: 'Manager ID' },
        { Value: Department_ID, Label: 'Department ID' }
    ],

    UI.Facets : [{
        $Type : 'UI.ReferenceFacet',
        ID    : 'employeeDetailsFacet',
        Label : 'Employee Details',
        Target: '@UI.FieldGroup#EmployeeDetails'
    }],

    UI.FieldGroup #EmployeeDetails : {Data: [
        { Value: Employee_ID, Label: 'Employee ID' },
        { Value: First_Name, Label: 'First Name' },
        { Value: Last_Name, Label: 'Last Name' },
        { Value: Email, Label: 'Email' },
        { Value: Phone_Number, Label: 'Phone Number' },
        { Value: Hire_Date, Label: 'Hire Date' },
        { Value: Job_ID, Label: 'Job ID' },
        { Value: Salary, Label: 'Salary' },
        { Value: Commission_Pct, Label: 'Commission Percentage' },
        { Value: Manager_ID, Label: 'Manager ID' },
        { Value: Department_ID, Label: 'Department ID' }
    ]}
);



annotate hr.Job_History with @(

    UI.HeaderInfo                   : {
        TypeName      : 'Job History',
        TypeNamePlural: 'Job Histories',
        Title         : {
            Value: Start_Date,
            Label: 'Start Date'
        },
        Description   : {
            Value: Job_ID,
            Label: 'Job ID'
        }
    },

    UI.LineItem                     : [
        {
            Value: Employee_ID,
            Label: 'Employee ID'
        },
        {
            Value: Start_Date,
            Label: 'Start Date'
        },
        {
            Value: End_Date,
            Label: 'End Date'
        },
        {
            Value: Job_ID,
            Label: 'Job ID'
        },
        {
            Value: Department_ID,
            Label: 'Department ID'
        }
    ],

    UI.Facets                       : [{
        $Type : 'UI.ReferenceFacet',
        ID    : 'jobHistoryDetailsFacet',
        Label : 'Job History Details',
        Target: '@UI.FieldGroup#JobHistoryDetails'
    }],

    UI.FieldGroup #JobHistoryDetails: {Data: [
        {
            Value: Employee_ID,
            Label: 'Employee ID'
        },
        {
            Value: Start_Date,
            Label: 'Start Date'
        },
        {
            Value: End_Date,
            Label: 'End Date'
        },
        {
            Value: Job_ID,
            Label: 'Job ID'
        },
        {
            Value: Department_ID,
            Label: 'Department ID'
        }
    ]}
);
