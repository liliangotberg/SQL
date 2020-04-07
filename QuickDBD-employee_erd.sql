-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/aZ7mB5
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).

SET XACT_ABORT ON

BEGIN TRANSACTION QUICKDBD

CREATE TABLE [Employees] (
    [emp_no] INTEGER  NOT NULL ,
    [birth_date] VARCHAR(30)  NOT NULL ,
    [file_name] VARCHAR  NOT NULL ,
    [last_name] VARCHAR  NOT NULL ,
    [gender] VARCHAR  NOT NULL ,
    [hire_date] VARCHAR(30)  NOT NULL ,
    CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED (
        [emp_no] ASC
    )
)

CREATE TABLE [Salaries] (
    [emp_no] INTEGER  NOT NULL ,
    [salary] INTEGER  NOT NULL ,
    [from_date] VARCHAR(30)  NOT NULL ,
    [to_date] VARCHAR(30)  NOT NULL ,
    CONSTRAINT [PK_Salaries] PRIMARY KEY CLUSTERED (
        [emp_no] ASC
    )
)

CREATE TABLE [Titles] (
    [emp_no] INTEGER  NOT NULL ,
    [title] VARCHAR  NOT NULL ,
    [from_date] VARCHAR(30)  NOT NULL ,
    [to_date] VARCHAR(30)  NOT NULL ,
    CONSTRAINT [PK_Titles] PRIMARY KEY CLUSTERED (
        [emp_no] ASC
    )
)

CREATE TABLE [Dept_Mng] (
    [dept_no] INTEGER  NOT NULL ,
    [emp_no] INTEGER  NOT NULL ,
    [from_date] VARCHAR(30)  NOT NULL ,
    [to_date] VARCHAR(30)  NOT NULL ,
    CONSTRAINT [PK_Dept_Mng] PRIMARY KEY CLUSTERED (
        [emp_no] ASC
    )
)

CREATE TABLE [Dept_Emp] (
    [emp_no] INTEGER  NOT NULL ,
    [dept_no] INTEGER  NOT NULL ,
    [from_date] VARCHAR(30)  NOT NULL ,
    [to_date] VARCHAR(30)  NOT NULL ,
    CONSTRAINT [PK_Dept_Emp] PRIMARY KEY CLUSTERED (
        [emp_no] ASC
    )
)

CREATE TABLE [Departments] (
    [dept_no] INTEGER  NOT NULL ,
    [dept_name] VARCHAR  NOT NULL 
)

ALTER TABLE [Employees] WITH CHECK ADD CONSTRAINT [FK_Employees_emp_no] FOREIGN KEY([emp_no])
REFERENCES [Salaries] ([emp_no])

ALTER TABLE [Employees] CHECK CONSTRAINT [FK_Employees_emp_no]

ALTER TABLE [Salaries] WITH CHECK ADD CONSTRAINT [FK_Salaries_emp_no_from_date] FOREIGN KEY([emp_no], [from_date])
REFERENCES [Titles] ([emp_no], [from_date])

ALTER TABLE [Salaries] CHECK CONSTRAINT [FK_Salaries_emp_no_from_date]

ALTER TABLE [Salaries] WITH CHECK ADD CONSTRAINT [FK_Salaries_to_date] FOREIGN KEY([to_date])
REFERENCES [Dept_Emp] ([to_date])

ALTER TABLE [Salaries] CHECK CONSTRAINT [FK_Salaries_to_date]

ALTER TABLE [Titles] WITH CHECK ADD CONSTRAINT [FK_Titles_emp_no_from_date] FOREIGN KEY([emp_no], [from_date])
REFERENCES [Dept_Mng] ([emp_no], [from_date])

ALTER TABLE [Titles] CHECK CONSTRAINT [FK_Titles_emp_no_from_date]

ALTER TABLE [Titles] WITH CHECK ADD CONSTRAINT [FK_Titles_to_date] FOREIGN KEY([to_date])
REFERENCES [Salaries] ([to_date])

ALTER TABLE [Titles] CHECK CONSTRAINT [FK_Titles_to_date]

ALTER TABLE [Dept_Mng] WITH CHECK ADD CONSTRAINT [FK_Dept_Mng_dept_no_emp_no_from_date] FOREIGN KEY([dept_no], [emp_no], [from_date])
REFERENCES [Dept_Emp] ([dept_no], [emp_no], [from_date])

ALTER TABLE [Dept_Mng] CHECK CONSTRAINT [FK_Dept_Mng_dept_no_emp_no_from_date]

ALTER TABLE [Dept_Mng] WITH CHECK ADD CONSTRAINT [FK_Dept_Mng_to_date] FOREIGN KEY([to_date])
REFERENCES [Titles] ([to_date])

ALTER TABLE [Dept_Mng] CHECK CONSTRAINT [FK_Dept_Mng_to_date]

ALTER TABLE [Dept_Emp] WITH CHECK ADD CONSTRAINT [FK_Dept_Emp_from_date] FOREIGN KEY([from_date])
REFERENCES [Salaries] ([from_date])

ALTER TABLE [Dept_Emp] CHECK CONSTRAINT [FK_Dept_Emp_from_date]

ALTER TABLE [Dept_Emp] WITH CHECK ADD CONSTRAINT [FK_Dept_Emp_to_date] FOREIGN KEY([to_date])
REFERENCES [Dept_Mng] ([to_date])

ALTER TABLE [Dept_Emp] CHECK CONSTRAINT [FK_Dept_Emp_to_date]

ALTER TABLE [Departments] WITH CHECK ADD CONSTRAINT [FK_Departments_dept_no] FOREIGN KEY([dept_no])
REFERENCES [Dept_Mng] ([dept_no])

ALTER TABLE [Departments] CHECK CONSTRAINT [FK_Departments_dept_no]

COMMIT TRANSACTION QUICKDBD