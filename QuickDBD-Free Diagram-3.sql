-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/Pm6PZ4
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).

CREATE TABLE "employees" (
    "employee" int   NOT NULL,
    "first_name" string   NOT NULL,
    "last_name" string   NOT NULL,
    "gender" string   NOT NULL,
    "birth_date" date   NOT NULL,
    "hire_date" date   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "employee"
     )
);

CREATE TABLE "departments" (
    "dept_no" int   NOT NULL,
    "dept_name" string   NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "dept_emp" (
    "employee" int   NOT NULL,
    "dept_no" int   NOT NULL,
    "start_date" date   NOT NULL,
    "end_date" date   NOT NULL
);

CREATE TABLE "dept_manager" (
    "employee" int   NOT NULL,
    "dept_no" int   NOT NULL,
    "from_date" date   NOT NULL,
    "to_date" date   NOT NULL
);

CREATE TABLE "salary" (
    "employee" int   NOT NULL,
    "salary" int   NOT NULL,
    "from_date" date   NOT NULL,
    "to_date" date   NOT NULL
);

CREATE TABLE "title" (
    "employee" int   NOT NULL,
    "title" string   NOT NULL,
    "from_date" date   NOT NULL,
    "to_date" date   NOT NULL
);

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_employee" FOREIGN KEY("employee")
REFERENCES "employees" ("employee");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_employee" FOREIGN KEY("employee")
REFERENCES "employees" ("employee");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "salary" ADD CONSTRAINT "fk_salary_employee" FOREIGN KEY("employee")
REFERENCES "employees" ("employee");

ALTER TABLE "title" ADD CONSTRAINT "fk_title_employee" FOREIGN KEY("employee")
REFERENCES "employees" ("employee");

CREATE INDEX "idx_employees_first_name"
ON "employees" ("first_name");

CREATE INDEX "idx_employees_last_name"
ON "employees" ("last_name");

