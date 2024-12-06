-- Create Departments table.
CREATE TABLE departments (
    dept_no VARCHAR(10) PRIMARY KEY,
    dept_name VARCHAR(30) NOT NULL
);

-- View our table.
select * from departments;

-- Create Titles table.
CREATE TABLE Titles (
    title_id VARCHAR(10) PRIMARY KEY,
    title VARCHAR(50) NOT NULL
);

-- View our second table.
select * from Titles;

-- Create Employees table.
CREATE TABLE Employees (
    emp_no INT PRIMARY KEY,            
	emp_title_id VARCHAR(10),          
    birth_date DATE NOT NULL,           
    first_name VARCHAR(30) NOT NULL,    
    last_name VARCHAR(30) NOT NULL,     
    sex CHAR(1), 
    hire_date DATE NOT NULL,            
    FOREIGN KEY (emp_title_id) REFERENCES Titles(title_id)
);

-- View our third table.
select * from Employees;

-- Create Dept_Emp table.
CREATE TABLE Dept_Emp (
    emp_no INT,                        
    dept_no VARCHAR(10),               
    PRIMARY KEY (emp_no, dept_no),    
    FOREIGN KEY (emp_no) REFERENCES Employees(emp_no),
    FOREIGN KEY (dept_no) REFERENCES Departments(dept_no)
);

-- View our fourth table.
select * from Dept_Emp;

-- Create Dept_Manager table.
CREATE TABLE Dept_Manager (
    dept_no VARCHAR(10),            
    emp_no INT,                       
    PRIMARY KEY (dept_no, emp_no),    
    FOREIGN KEY (dept_no) REFERENCES Departments(dept_no),
    FOREIGN KEY (emp_no) REFERENCES Employees(emp_no)
);

-- View our fifth table.
select * from Dept_Manager;

-- Create Salaries table.
CREATE TABLE Salaries (
    emp_no INT PRIMARY KEY,             
    salary INT NOT NULL,               
    FOREIGN KEY (emp_no) REFERENCES Employees(emp_no)
);

-- View our sixth table.
select * from Salaries;


