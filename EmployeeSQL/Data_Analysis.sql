-- 1.List the employee number, last name, first name, sex, and salary of each employee.
select e.emp_no,e.last_name,e.first_name,e.sex,s.salary 
from Employees e 
join salaries s on e.emp_no=s.emp_no;

-- 2.List the first name, last name, and hire date for the employees who were hired in 1986.
select first_name,last_name,hire_date 
from Employees 
where extract(year from hire_date)=1986;

-- 3.List the manager of each department along with their department number, department name, employee number, last name, and first name.
select d.dept_no,d.dept_name,dm.emp_no,e.last_name,e.first_name from departments d 
join Dept_Manager dm on d.dept_no=dm.dept_no
join Employees e on dm.emp_no=e.emp_no;

-- 4.List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
select de.dept_no,e.emp_no,e.last_name,e.first_name,
	(select dept_name from departments d where d.dept_no=de.dept_no) as dept_name 
from Employees e
inner join Dept_Emp de on e.emp_no=de.emp_no;

-- 5.List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
select first_name, last_name, sex
from Employees
where first_name = 'Hercules' and last_name like 'B%';


-- 6.List each employee in the Sales department, including their employee number, last name, and first name.
select e.emp_no, e.last_name, e.first_name
from Employees e
where e.emp_no in (
    select de.emp_no
    from Dept_Emp de
    join Departments d on de.dept_no = d.dept_no
    where d.dept_name = 'Sales'
);

-- 7.List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
select e.emp_no, e.last_name, e.first_name, d.dept_name
from Employees e
join Dept_Emp de on e.emp_no = de.emp_no
join Departments d on de.dept_no = d.dept_no
where d.dept_name in ('Sales', 'Development');

-- 8.List the frequency counts, in descending order, of all the employee last names.
select last_name, count(*) as frequency
from Employees
group by last_name
order by frequency desc, last_name;
