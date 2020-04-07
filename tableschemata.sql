emp 

create table employees (   
emp_no int not null,
birth_date date not null, 
file_name VARCHAR not null,
last_name VARCHAR not null,
gender VARCHAR not null,
hire_date date not null,
primary key (emp_no)
);


d

create table departments ( 
dept_no varchar not null,
dept_name varchar not null,
primary key (dept_no)
);



dm

create table dept_mng (
dept_no varchar not null,
emp_no int not null,
from_date date not null,
to_date date not null,
foreign key (emp_no) references employees (emp_no),
foreign key (dept_no) references departments (dept_no)
);


de

create table dept_emp ( 
emp_no int not null,
dept_no varchar not null,
from_date date not null,
to_date date not null,
foreign key (emp_no) references employees (emp_no),
foreign key (dept_no) references departments (dept_no),
primary key (emp_no, dept_no)
);

sal

create table salaries ( 
emp_no int not null,
salary int not null,
from_date date not null,
to_date date not null,
foreign key (emp_no) references employees (emp_no),
primary key (emp_no, from_date)
);

titles

create table titles ( 
emp_no int not null,
title VARCHAR not null,
from_date date not null,
to_date date not null,
foreign key (emp_no) references employees (emp_no),
primary key (emp_no, title, from_date)
);



	

