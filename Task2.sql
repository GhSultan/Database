CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY IDENTITY(1,1),
    DepartmentName VARCHAR(100) NOT NULL
);

INSERT INTO Departments VALUES 
('Information Technology'),
('Human Resources'),
('Sales');


CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY IDENTITY(1,1),
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    BirthDate DATE,
    PhoneNumber VARCHAR(15),
    NationalID VARCHAR(20),
    Nationality VARCHAR(50),
    MaritalStatus VARCHAR(20),
    PersonalPhoto VARCHAR(255),
    EntryDate DATE,
    Password VARCHAR(255) NOT NULL,
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

INSERT INTO Employees VALUES 
('ghofran', 'sultan', '1990-05-15', '0791234567', '123456789', 'Jordan', 'Married', 'ghofran_doe.jpg', '2015-01-10', 'password123', 1),
('Jane', 'Smith', '1992-08-22', '0789876543', '987654321', 'UAE', 'Single', 'ghofran_smith.jpg', '2018-03-12', 'password456', 2),
('Emily', 'Davis', '1988-11-30', '0776543210', '112233445', 'USA', 'Married', 'emily_davis.jpg', '2012-09-01', 'password789', 3);


CREATE TABLE Tasks (
    TaskID INT PRIMARY KEY IDENTITY(1,1),
    TaskTitle VARCHAR(100) NOT NULL,
    StartDate DATE,
    DueDate DATE,
    TaskDescription TEXT,
    ImportanceLevel VARCHAR(20),
    AssignedEmployeeID INT,
    FOREIGN KEY (AssignedEmployeeID) REFERENCES Employees(EmployeeID)
);

INSERT INTO Tasks VALUES 
('Monthly Report Preparation', '2024-10-01', '2024-10-10', 'Prepare the company’s monthly performance report.', 'High', 1),
('Client Contract Review', '2024-10-05', '2024-10-12', 'Review and audit the new client contracts.', 'Medium', 2),
('Sales Data Analysis', '2024-10-07', '2024-10-15', 'Analyze the sales data for the last quarter.', 'Low', 3);

CREATE TABLE Feedback (
    FeedbackID INT PRIMARY KEY IDENTITY(1,1),
    SenderName VARCHAR(100),
    SenderEmail VARCHAR(100),
    Message TEXT,
    ReceivedDate DATE
);
INSERT INTO Feedback VALUES 
('Michael', 'michael@example.com', 'I would like to know more about your services.', '2024-10-15'),
('Sarah', 'sarah@example.com', 'Do you offer discounts for large companies?', '2024-10-16');
