
CREATE TABLE Customer(
Customer_id int Primary Key,
FirstName VARCHAR(50) NOT NULL,            
LastName VARCHAR(50) NOT NULL,             
Email VARCHAR(100),                       
PhoneNumber VARCHAR(15) 
);

INSERT INTO Customer VALUES 
(1,'Jane', 'Smith', 'janesmith@example.com', '987654321'),
(2,'Ali', 'Hassan', 'alihassan@example.com', '654321987');

CREATE TABLE Orders(
Orders_id int Primary Key,
Name VARCHAR(50),
OrderDate DATE,

);

INSERT INTO Orders VALUES 
(3,'cloths', '2024-10-01'),
(6,'cloths3','2024-10-05');

CREATE TABLE Products(
Prodercts_id int Primary Key,
ProductName VARCHAR(100),                
Category VARCHAR(50),                     
Price DECIMAL(10, 2)

);

INSERT INTO Products VALUES 
(4,'Laptop', 'Electronics', 120.90),
(5,'Smartphone', 'Electronics', 800.0);

CREATE TABLE Employees (
    Employee_id int Primary Key, 
    FirstName VARCHAR(50),                    
    LastName VARCHAR(50),                    
    Position VARCHAR(50),                    
    Salary DECIMAL(10, 2)                     
);



INSERT INTO Employees VALUES 
(7,'Ahmed', 'Ali', 'Manager', 3000.00),
(8,'Fatima', 'Khan', 'Sales', 2000.00);


