-- 1 employee number, last name, first name, gender, and salary.

select emp.emp_no, emp.last_name, emp.file_name, emp.gender, sal.salary
from employees as emp
left join salaries as sal
on (emp.emp_no = sal.emp_no)
order by emp.emp_no;

-- 2 List employees who were hired in 1986
select employees.last_name, employees.file_name
from employees
where hire_date between '1986-01-01' and '1986-12-31';

--3. List the manager of each department with the following information: 
--department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
select dm.dept_no,
 	departments.dept_name, 
 	dm.emp_no, 
 	emp.last_name, 
 	emp.file_name, 
 	dm.from_date, 
 	dm.to_date
 from dept_mng as dm
inner join departments 
on (dm.dept_no = departments.dept_no) 
inner join employees as emp
on ( dm.emp_no = emp.emp_no);
--order by emp.emp_no;

--4. List the department of each employee with the following information: employee number, last name, first name, and department name.
select departments.dept_name,
	emp.emp_no,
	emp.last_name, 
 	emp.file_name
from employees as emp
	full outer join dept_emp as de
		on (emp.emp_no = de.emp_no)
	full outer join departments 
		on (de.dept_no = departments.dept_no);
--order by emp.emp_no;

--5. List all employees whose first name is "Hercules" and last names begin with "B."
select emp.file_name, 
emp.last_name
from employees as emp
where emp.file_name = 'Hercules' and emp.last_name like 'B%';

--6 List all employees in the Sales department, including their employee number, last name, first name, and department name.
-- select emp.emp_no,
-- 	emp.last_name, 
--  	emp.file_name,
-- --	d.dept_name
-- from employees as emp
-- 	full outer join dept_emp as de
-- 		on (emp.emp_no = de.emp_no)
-- 	inner join departments as d
	
-- 		on (de.dept_no = d.dept_no)
-- where d.dept_name = 'Sales'
-- order by emp.emp_no;

SELECT  emp.emp_no,
        emp.last_name,
        emp.file_name,
        d.dept_name
FROM employees AS emp
    FULL OUTER JOIN dept_emp AS de
        ON (emp.emp_no = de.emp_no)
    FULL outer JOIN departments AS d
	on (de.emp_no - de.emp_no)
WHERE d.dept_name = 'Sales'
ORDER BY emp.emp_no;


--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
-- select emp.emp_no,
-- 	emp.last_name, 
--  	emp.file_name,
-- --	d.dept_name
-- from employees as emp
-- 	full outer join dept_emp as de
-- 		on (emp.emp_no = de.emp_no)
-- 	inner join departments as d
	
-- 		on (de.dept_no = d.dept_no)
-- where d.dept_name = 'Sales' and 'Development'
-- order by emp.emp_no;

SELECT  emp.emp_no,
        emp.last_name,
        emp.file_name,
        d.dept_name
FROM employees AS emp
    FULL OUTER JOIN dept_emp AS de
        ON (emp.emp_no = de.emp_no)
    FULL outer JOIN departments AS d 
	on (de.dept_no = d.dept_no)
WHERE d.dept_name = 'Sales' and 'Development'
ORDER BY emp.emp_no;

--8.  In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

Select last_name, count (*)
from employees
group by last_name
order by count (8) desc


select *
from departments
