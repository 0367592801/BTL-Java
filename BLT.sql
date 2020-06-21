drop DATABASE Quanlydiemdanhchamcong
create DATABASE Quanlydiemdanhchamcong
GO
USE Quanlydiemdanhchamcong
GO

CREATE TABLE staff
(
	staff_id CHAR(4) NOT NULL PRIMARY KEY,
	salary_id CHAR(4) NOT NULL,
	staff_password CHAR(10) NOT NULL,
	staff_name NVARCHAR(15) NOT NULL,
	staff_age INT NOT NULL,
	staff_address NVARCHAR(50) NOT NULL,
	staff_sex nvarchar(5) not null,
	CONSTRAINT fk_salary_id FOREIGN KEY (salary_id) REFERENCES dbo.salary(salary_id)
)

CREATE TABLE project
(
	project_id CHAR(4) NOT NULL PRIMARY KEY,
	project_name NVARCHAR(20) NOT NULL,
	project_start DATETIME NOT NULL,
	project_finish DATETIME NOT NULL,
	project_status BIT NOT NULL
)
Create table award(
	project_id CHAR(4) NOT NULL,
	staff_id CHAR(4) NOT NULL,
	salary_award INT NOT NULL,
	primary key(project_id, staff_id),
	CONSTRAINT fk_project_id FOREIGN KEY (project_id) REFERENCES dbo.project(project_id),
	CONSTRAINT fk_staff_id1 FOREIGN KEY (staff_id) REFERENCES dbo.staff(staff_id)
)

CREATE TABLE attendance
(
	staff_id CHAR(4) NOT NULL,
	date DATETIME NOT NULL,
	time_in DATETIME NOT NULL,
	PRIMARY KEY(staff_id, date),
	CONSTRAINT fk_staff_id FOREIGN KEY (staff_id) REFERENCES dbo.staff(staff_id),
)

CREATE TABLE salary
(
	salary_id CHAR(4) NOT NULL,
	salary_base INT NOT NULL,
	Primary key(salary_id),
)

create table total_salary(
	staff_id CHAR(4) NOT NULL, 
	date Datetime not null, 
	total int not null,
	primary key(staff_id, date),
	CONSTRAINT fk_staff_id2 FOREIGN KEY (staff_id) REFERENCES dbo.staff(staff_id),
)

insert into project values
('PJ01', 'Website', '2010-01-02', '2010-02-02', 1),
('PJ02', 'App', '2011-01-02', '2011-02-02', 0),
('PJ03', 'Image', '2013-01-02', '2013-02-02', 0),
('PJ04', 'Video', '2012-01-02', '2013-02-02', 1),
('PJ05', 'Music', '2011-01-02', '2015-06-02', 0)

insert into salary values 
('SA01', 280000),
('SA02', 350000),
('SA03', 420000),
('SA04', 500000)
select * from salary
insert into staff values 
('NV01', 'SA01', 'NV01Pass', 'NamBeo1', 20, 'Ha Noi', 'nam'),
('NV02', 'SA02', 'NV02Pass', 'NamBeo2', 22, 'Hai Duong', 'nu'),
('NV03', 'SA03', 'NV03Pass', 'NamBeo3', 23, 'Vinh Phuc', 'nam'),
('NV04', 'SA01', 'NV04Pass', 'NamBeo4', 24, 'Hai Phong', 'nu'),
('NV05', 'SA04', 'NV05Pass', 'NamBeo5', 25, 'Binh Duong', 'nam')

insert into award values 
('PJ01', 'NV01', 2000000),
('PJ02', 'NV02', 3000000),
('PJ03', 'NV03', 4000000),
('PJ04', 'NV04', 5000000),
('PJ05', 'NV05', 5000000)

insert into attendance values 
('NV01', '2010-01-01', '08:00:00'),
('NV02', '2010-01-01', '07:59:00'),
('NV03', '2010-01-01', '09:00:00'),
('NV04', '2010-01-01', '08:30:00'),
('NV05', '2010-01-01', '08:00:00')

---- 
