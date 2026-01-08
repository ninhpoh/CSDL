DROP DATABASE if exists hakathon;
create database hakathon;
use hakathon;

-- bảng Department
create table department (
	dept_id varchar(5) primary key,
    dept_name varchar(100) not null unique,
    location varchar(100) not null,
    manager_name varchar(50) not null
);

insert into department () values
('D01','IT','Floor 5','Nguyen Van A'),
('D02','HR','Floor 2','Tran Thi Binh'),
('D03','Sales','Floor 1','Le Van Cuong'),
('D04','Marketing','Floor 3','Pham Dinh Duong'),
('D05','Finance','Floor 4','Hoang Van Tu');

-- bảng Employee
create table employee (
	emp_id varchar(5) primary key,
    emp_name varchar(50) not null,
    dob date not null,
	email varchar(100) not null unique,
	phone varchar(100) not null unique,
    dept_id varchar(5) not null,
    foreign key (dept_id) REFERENCES department(dept_id)
);

insert into employee (emp_id, emp_name, dob, email,phone,dept_id) values
('E001','Nguyen Van Tuan','1990-01-01','tuan@mail.com','0901234567','D01'),
('E002','Tran Thi Lan','1995-05-05','lan@mail.com','0902345678','D02'),
('E003','Le Minh Khoi','1992-10-10','khoi@mail.com','0903456789','D01'),
('E004','Pham Hoang Nam','1998-12-12','nam@mail.com','0904567890','D03'),
('E005','Vu Minh Ha','1990-07-07','ha@mail.com','0905678901','D01');

-- bảng Project
create table project (
	project_id varchar(5) primary key,
    project_name varchar(20) not null unique,
    start_date date not null,
    end_date date not null,
    budget decimal(10,2) not null
);

insert into project () values 
('P001','Website Redesign','2025-01-01','2025-06-01','50000'),
('P002','Mobile App Dev','2025-02-01','2025-08-01','80000'),
('P003','HR System','2025-03-01','2025-09-01','30000'),
('P004','Marketing Campaign','2025-04-01','2025-05-01','10000'),
('P005','AI Research','2025-05-01','2025-12-31','100000');

-- bảng Assignment
create table assignment(
	assignment_id int primary key AUTO_INCREMENT,
    emp_id varchar(5) not null,
    project_id varchar(5) not null,
    role varchar(20) not null,
    hours_worker int not null,
	foreign key (emp_id) REFERENCES employee(emp_id),
	foreign key (project_id) REFERENCES project(project_id)
);

insert into assignment (emp_id,project_id, role, hours_worker) values
('E001','P001','Developer','150'),
('E003','P001','Tester','100'),
('E001','P002','Tech Lead','200'),
('E005','P005','Data Scientist','180'),
('E004','P004','Content Creator','50');

-- Phan 2: Truy vấn dữ liệu cơ bản
UPDATE department
SET location = 'Floor 10'
WHERE dept_id  = 'C001';

UPDATE project
SET end_date = end_date + '0000-01-00'
WHERE project_id  = 'P005';

DELETE FROM assignment
WHERE hours_worker = 0 or role = 'intern';

select e.emp_id, e.emp_name, e.email
from employee e
where e.dept_id = 'D01';

select p.project_name, p.start_date, p.budget
from project p
where p.project_name like '%system%';

select p.project_id, p.project_name, p.budget
from project p
order by p.budget desc;

select * from employee e
order by e.dob
limit 3;

select p.project_id, p.project_name
from project p
limit 3
offset 1;

-- PHẦN 3: Truy vấn dữ liệu nâng cao
select a.assignment_id, e.emp_name, p.project_name
from assignment a
join employee e on e.emp_id = a.emp_id
join project p on p.project_id = a.project_id;

select d.dept_id, d.dept_name, e.emp_name
from department d
join employee e on e.dept_id = d.dept_id;

select p.project_name, sum(a.hours_worker) as total_hours
from assignment a
join project p on p.project_id = a.project_id
group by p.project_name;

