Use Court

--DDL

create table Lawyer(
Id_Lawyer int primary key,
Name_Lawyer varchar( 50 ) not null,
city varchar( 50 ) not null,
street varchar( 50 ) not null,
apartment int not null
)

create table Lawyer_Phone
(
Id_Lawyer int,
Phone varchar(15) not null,
FOREIGN KEY (Id_Lawyer) REFERENCES Lawyer(Id_Lawyer),
CONSTRAINT PK_Lawyer_Phone PRIMARY KEY (Id_Lawyer,Phone)
)

create table Defendant(
Id_Defendant int primary key,
Name_Defendant varchar( 50 ) not null,
Birth_Date date not null,
city varchar( 50 ) not null,
street varchar( 50 ) not null,
apartment int not null
)

create table Defedant_Phone
(
Id_Defedant int,
phone varchar(15) not null,
FOREIGN KEY (Id_Defedant) REFERENCES Defendant(Id_Defendant),
CONSTRAINT PK_Defedant_Phone PRIMARY KEY (Id_Defedant,Phone)
)

create table Court_Room
(
Room_Name varchar( 50 ) primary key,
Capacity int not null,
Room_Location varchar( 50 ) not null
)

create table Judge
(
Id_Judge int primary key,
Name_Judge varchar(50) not null,
Salary int,
Birth_Date date not null,
Apartment int not null,
Street varchar(50) not null,
City varchar(50) not null,
)

Create table Judge_Phone
(
Id_Judge int ,
Phone varchar(15),
FOREIGN KEY (Id_Judge) REFERENCES Judge(Id_Judge),
CONSTRAINT PK_Person PRIMARY KEY (Id_Judge,Phone)
)

create table [Case](
Id_case int primary key,
Type_case varchar( 50 ) not null,
Decision varchar( 50 ) not null,
Description_case varchar( 100 ) not null,
Case_Date date default getdate(),
Id_Judge int,
FOREIGN KEY (Id_Judge) REFERENCES Judge(Id_Judge)
)

create table Court_Clerk
(
Id_Court_Clerk int primary key,
Cname varchar(30) not null,
Salary int,
Birth_Date date not null,
Apartment int not null,
Street int not null,
City varchar(30) not null
)

Create table CourtClerk_Phone
(
Id_Court_Clerk int,
Clerk_Phone varchar(15),
FOREIGN KEY (Id_Court_Clerk ) REFERENCES Court_Clerk (Id_Court_Clerk ),
CONSTRAINT PK_CourtClerk_Phone PRIMARY KEY (Id_Court_Clerk,Clerk_Phone)
)

create table Plaintiff
(
Id_Plaintiff int primary key,
Name_Plaintiff varchar(50) not null,
Birth_Date date not null,
Apartment int not null,
Street varchar(50) not null,
City varchar(50) not null,
) 

Create table Plaintiff_Phone
(
Id_Plaintiff int,
Phone varchar(15),
FOREIGN KEY (Id_Plaintiff) REFERENCES Plaintiff(Id_Plaintiff),
CONSTRAINT PK_Plaintiff_Phone PRIMARY KEY (Id_Plaintiff,Phone)
)

create table Lawyer_Case_Plaintiff
(
Id_Lawyer int,
Id_Plaintiff int,
Id_Case int,
CONSTRAINT PK_Lawyer_Case_Plaintiff PRIMARY KEY (Id_Lawyer,Id_Plaintiff),
FOREIGN KEY (Id_Case) REFERENCES [Case](Id_case),
FOREIGN KEY (Id_Lawyer) REFERENCES Lawyer(Id_Lawyer),
FOREIGN KEY (Id_Plaintiff) REFERENCES Plaintiff(Id_Plaintiff)
)
 
create table Lawyer_Case_Defendant
(
Id_Lawyer int,
Id_Defedant int,
Id_Case int,
CONSTRAINT PK_Lawyer_Case_Plaintiff_ PRIMARY KEY (Id_Lawyer,Id_Defedant),
FOREIGN KEY (Id_Case) REFERENCES [Case](Id_case),
FOREIGN KEY (Id_Lawyer) REFERENCES Lawyer(Id_Lawyer),
FOREIGN KEY (Id_Defedant) REFERENCES Defendant(Id_Defendant)
)

create table [Session]
(
Session_Number int primary key,
Session_Date date default getdate(),
Session_Time time not null,
Id_Court_Clerk int,
Room_Name varchar( 50 ),
FOREIGN KEY (Id_Court_Clerk) REFERENCES Court_Clerk(Id_Court_Clerk),
FOREIGN KEY (Room_Name) REFERENCES Court_Room(Room_Name),
)

create table Case_Session(
Case_Id int,
Session_Number int,
CONSTRAINT PK_Case_Session PRIMARY KEY (Case_Id,Session_Number),
FOREIGN KEY (Case_Id) REFERENCES [Case](Id_case),
FOREIGN KEY (Session_Number) REFERENCES [Session](Session_Number)
)

--DML

-- Inserting 10 Lawyers
INSERT INTO Lawyer (Id_Lawyer, Name_Lawyer, city, street, apartment)
VALUES
    (101, 'Ahmed Salah', 'Cairo', 'Nile Street', 101),
    (102, 'Fatma Mahmoud', 'Giza', 'Pyramids Avenue', 202),
    (103, 'Mohamed Ali', 'Luxor', 'Sphinx Street', 303),
    (104, 'Nourhan Hassan', 'Aswan', 'Pharaohs Road', 404),
    (105, 'Youssef Ibrahim', 'Alexandria', 'Lotus Lane', 505),
    (106, 'Aya Hesham', 'Hurghada', 'Karnak Street', 606),
    (107, 'Omar Ahmed', 'Sharm El Sheikh', 'Nefertiti Avenue', 707),
    (108, 'Nadia Mohamed', 'Dahab', 'Cleopatra Road', 808),
    (109, 'Ali Mansour', 'Suez', 'Papyrus Lane', 909),
    (110, 'Salma Samir', 'Marsa Alam', 'Anubis Street', 1010);

-- Inserting 10 Lawyer Phones 
INSERT INTO Lawyer_Phone (Id_Lawyer, Phone)
VALUES
    (101, '012345678901'),
    (102, '012456789012'),
    (103, '010567890123'),
    (104, '011678901234'),
    (105, '015589012345'),
    (106, '011890123456'),
    (107, '012901234567'),
    (108, '010012345678'),
    (109, '015523456789'),
    (110,'010123456789');

-- Inserting 10 Defendants
INSERT INTO Defendant (Id_Defendant, Name_Defendant, Birth_Date, city, street, apartment)
VALUES
    (1, 'Ahmed Ali', '1998-07-24', 'Qena', 'Al-Mansheya Street', 69),
    (2, 'Karim Gamal', '1990-11-12', 'Alexandria', 'wengat Street', 34),
    (3, 'Mohamed Tamer', '1985-10-10', 'Luxor', 'TV Street', 89),
    (4, 'Aya Ahmed', '1994-04-25', 'Aswan', 'Al-tamen Street', 67),
    (5, 'Youssef Omar', '1985-03-24', 'Sohag', 'mahta Street', 55),
    (6, 'Abdo Ibrahim', '1990-11-05', 'Hurghada', 'Karnak Street', 61),
    (7, 'seif Mohamed', '1985-02-15', 'Alexandria', 'wengat Street', 98),
    (8, 'Ali sameh', '1989-06-20', 'Qena', 'El-sekka Street', 80),
    (9, 'Omar sayed', '1993-03-12', 'Suez', 'Papyrus Lane', 68),
    (10, 'Ahmed Khaled', '1987-09-08', ' Assiut ', 'Sphinx Street', 23);

-- Inserting 10 Defendant Phones
INSERT INTO Defedant_Phone (Id_Defedant, phone)
VALUES
    (1, '011234567896'),
    (2, '012345673245'),
    (3, '015556719319'),
    (4, '011116732911'),
    (5, '012345621842'),
    (6, '015512381932'),
    (7, '012383740849'),
    (8, '011239847292'),
    (9, '010292373929'),
    (10, '012345220193');

-- Inserting 10 Plaintiffs 
INSERT INTO Plaintiff (Id_Plaintiff, Name_Plaintiff, Birth_Date, Apartment, Street, City)
VALUES
    (201, 'Ahmed mohammed', '1999-05-20', 301, 'Nile Street', 'Cairo'),
    (202, 'ali Mahmoud', '1992-05-15', 101, 'Pyramids Avenue', 'Giza'),
    (203, 'waleed Ali', '1988-11-10', 548, 'Sphinx Street', 'Luxor'),
    (204, 'Nourhan hanna', '1994-01-25', 661, 'Pharaohs Road', 'Aswan'),
    (205, 'Youssef ahmed', '1986-06-30', 547, 'Lotus Lane', 'Alexandria'),
    (206, 'Aya hassan', '1991-10-09', 698, 'Karnak Street', 'Hurghada'),
    (207, 'kareem Ali', '1985-02-25', 338, 'Nefertiti Avenue', 'Sharm El Sheikh'),
    (208, 'Nada Mahmoud', '1979-06-20', 864, 'Cleopatra Road', 'Dahab'),
    (209, 'Ali Hassan', '1993-08-12', 875, 'Papyrus Lane', 'Suez'),
    (210, 'Salma hassan', '1987-10-08', 69, 'Anubis Street', 'Marsa Alam');

-- Inserting Plaintiff Phones 
INSERT INTO Plaintiff_Phone (Id_Plaintiff, Phone)
VALUES
    (201, '012345678901'),
    (202, '011456789012'),
    (203, '010567890123'),
    (204, '012678901234'),
    (205, '015789012345'),
    (206, '015890123456'),
    (207, '011901234567'),
    (208, '012012345678'),
    (209, '010123456789'),
    (210, '010123456779');

-- Inserting 10 Judges
INSERT INTO Judge (Id_Judge, Name_Judge, Salary, Birth_Date, Apartment, Street, City)
VALUES
    (301, 'Ahmed ibrahim', 63000, '1975-05-20', 101, 'Nile Street', 'Cairo'),
    (302, 'Fatma Mahmoud', 62000, '1978-08-15', 202, 'Pyramids Avenue', 'Giza'),
    (303, 'Mohamed ahmed', 66000, '1980-12-10', 303, 'Sphinx Street', 'Luxor'),
    (304, 'Nourhan abdo', 69000, '1973-04-25', 404, 'Pharaohs Road', 'Aswan'),
    (305, 'khaled Mohamed', 64000, '1977-07-30', 505, 'Lotus Lane', 'Alexandria');

INSERT INTO Judge (Id_Judge, Name_Judge, Salary, Birth_Date, Apartment, Street, City)
VALUES
    (306, 'Ahmed Kamal', 61000, '1980-05-20', 11, 'Al-Moez Street', 'Cairo'),
    (307, 'Hala Ahmed', 60000, '1979-08-15', 24, 'Al-Dokki Street', 'Giza'),
    (308, 'Ali Ahmed', 63000, '1980-12-10', 37, 'Al-Mansheya Street', 'Qena'),
    (309, 'Mostafa abdo', 65000, '1975-04-25', 41, 'Pharaohs Road', 'Aswan'),
    (310, 'Hossam Mohamed', 64000, '1977-07-30', 56, 'Papyrus Lane', 'Port Said');

-- Inserting 10 Judge Phones 
INSERT INTO Judge_Phone (Id_Judge, Phone)
VALUES
    (301, '012345678901'),
    (302, '011456789012'),
    (303, '010567890123'),
    (304, '015678901234'),
    (305, '011789012345');

INSERT INTO Judge_Phone (Id_Judge, Phone)
VALUES
    (306, '012394857202'),
    (307, '011554171524'),
    (308, '010234135785'),
    (309, '015556244325'),
    (310, '011334726392');

-- Inserting 5 Court Room
INSERT INTO Court_Room (Room_Name, Capacity, Room_Location)
VALUES
    ('Room A', 50, 'First Floor'),
    ('Room B', 40, 'Second Floor'),
    ('Room C', 60, 'Third Floor'),
    ('Room D', 45, 'Fourth Floor'),
    ('Room E', 55, 'Fifth Floor');
-- Inserting 5 Courtrooms
INSERT INTO Court_Room (Room_Name, Capacity, Room_Location)
VALUES
    ('Room 101', 50, 'Ground Floor'),
    ('Room 102', 40, 'Ground Floor'),
    ('Room 103', 60, 'Ground Floor'),
    ('Room 104', 45, 'First Floor'),
    ('Room 105', 55, 'First Floor');

-- Inserting 10 Cases
INSERT INTO [Case] (Id_case, Type_case, Decision, Description_case, Case_Date, Id_Judge)
VALUES
    (1001, 'Civil', 'Pending', 'Property Dispute', '2024-01-01', 301),
    (1002, 'Criminal', 'Closed', 'Robbery', '2024-02-01', 302),
    (1003, 'Family', 'Ongoing', 'Child Custody', '2024-03-01', 303),
    (1004, 'Civil', 'Closed', 'Contract Breach', '2024-04-01', 304),
    (1005, 'Criminal', 'Pending', 'Assault', '2024-05-01', 305),
    (1006, 'Family', 'Ongoing', 'Divorce', '2024-06-01', 301),
    (1007, 'Civil', 'Closed', 'Landlord-Tenant Dispute', '2024-07-01', 302),
    (1008, 'Criminal', 'Closed', 'Drug Possession', '2024-08-01', 303),
    (1009, 'Family', 'Pending', 'Adoption', '2024-09-01', 304),
    (1010, 'Civil', 'Ongoing', 'Personal Injury', '2024-10-01', 305);

-- Inserting 10 Lawyer-Case-Plaintiff
INSERT INTO Lawyer_Case_Plaintiff (Id_Lawyer, Id_Plaintiff, Id_Case)
VALUES
    (101,201, 1001),
    (102, 202, 1002),
    (103, 203, 1003),
    (104, 204, 1004),
    (105, 205, 1005),
    (106, 206, 1006),
    (107, 207, 1007),
    (108, 208, 1008),
    (109, 209, 1009),
    (110, 210, 1010);

-- Inserting 10 Lawyer-Case-Defendant 
INSERT INTO Lawyer_Case_Defendant (Id_Lawyer, Id_Defedant, Id_Case)
VALUES
    (101,1, 1001),
    (102, 2, 1002),
    (103, 3, 1003),
    (104, 4, 1004),
    (105, 5, 1005),
    (106, 6, 1006),
    (107, 7, 1007),
    (108, 8, 1008),
    (109, 9, 1009),
    (110, 10, 1010);
	
-- Inserting 10 Court Cracks 
INSERT INTO Court_Clerk (Id_Court_Clerk, Cname, Salary, Birth_Date, Apartment, Street, City)
VALUES
    (501, 'Ahmed Ali', 5000 , '1979-05-20', 5, 1, 'Cairo'),
    (502, 'Reem Mohamed', 5500, '1971-08-15', 25, 1, 'Giza'),
    (503, 'Gamal Ahmed', 7000, '1970-12-10', 33, 3, 'Luxor'),
    (504, 'Ibrahim karim', 6500, '1973-04-25', 45, 9, 'Aswan'),
    (505, 'Omar Fawzy', 4000, '1980-12-10', 85, 45, 'Qena');

INSERT INTO Court_Clerk (Id_Court_Clerk, Cname, Salary, Birth_Date, Apartment, Street, City)
VALUES
    (506, 'Ali Gamal', 4000 , '1990-05-20', 56, 9, 'Cairo'),
    (507, 'Ahmed Mohamed', 5500, '1971-08-15', 29, 15, 'Giza'),
    (508, 'Tamer hathem', 7000, '1970-12-10', 31, 10, 'Luxor'),
    (509, 'Mohamed Ibrahim', 6500, '1973-04-25', 42, 14, 'Aswan'),
    (510, 'Omar Samey', 4000, '1980-09-10', 89, 31, 'Qena');

-- Inserting 10 Court Crack Phones 
INSERT INTO CourtClerk_Phone (Id_Court_Clerk, Clerk_Phone)
VALUES
    (501, '01158909132'),
    (502, '01157230356'),
    (503, '01123456789'),
    (504, '01023416373'),
    (505, '01151514239');

INSERT INTO CourtClerk_Phone (Id_Court_Clerk, Clerk_Phone)
VALUES
    (506, '01175849275'),
    (507, '01556318393'),
    (508, '01147291742'),
    (509, '01234913847'),
    (510, '01234823948');

-- Inserting 14 Session
INSERT INTO [Session] (Session_Number, Session_Date , Session_Time, Id_Court_Clerk, Room_Name)
VALUES 
(2001, '2022-05-23' , '10:00:00' , 501 , 'Room A'),
(2002, '2022-08-20' , '11:30:00' , 502 , 'Room B'),
(2003, '2023-06-18' , '13:00:00' , 503 , 'Room C'),
(2004, '2020-11-27' , '14:30:00' , 504 , 'Room D'),
(2005, '2021-03-09' , '16:00:00' , 505 , 'Room E');

INSERT INTO [Session] (Session_Number , Session_Time, Id_Court_Clerk, Room_Name)
VALUES 
(2006, '10:30:00', 501 , 'Room 101'),
(2007, '12:30:00', 502 , 'Room 102');

INSERT INTO [Session] (Session_Number , Session_Time, Room_Name)
VALUES 
(2008, '16:35:00', 'Room 101'),
(2009, '10:40:00', 'Room 102');

INSERT INTO [Session] (Session_Number , Session_Time, Room_Name)
VALUES 
(2010, '11:40:00', 'Room A');

INSERT INTO [Session] (Session_Number , Session_Time, Room_Name)
VALUES 
(2011, '19:40:00', 'Room E'),
(2012, '09:05:00', 'Room 105');

INSERT INTO [Session] (Session_Number , Session_Time, Id_Court_Clerk)
VALUES 
(2013, '19:40:00', 507),
(2014, '09:05:00', 508);

update [Session]
set Id_Court_Clerk = 509
where Session_Number in( 2006 , 2007 )

update [Session]
set Room_Name = 'Room 104'
where Room_Name is NULL

-- Inserting 10 Case_Session
INSERT INTO Case_Session (Case_Id, Session_Number)
VALUES 
(1001, 2001),
(1002, 2002),
(1003, 2003),
(1004, 2004),
(1005, 2005),
(1001, 2002),
(1005, 2002),
(1001, 2004),
(1010, 2005),
(1009, 2002);


--DQL

--Select

select * from Judge

select * from Defendant

select * from Plaintiff

select City, Name_Plaintiff from Plaintiff

select Plaintiff.City, Plaintiff.Name_Plaintiff from Plaintiff

select distinct salary from Court_Clerk

--Select by condition

select * from [Case]
where [Case].Type_case = 'Civil'

select Cname , Salary from Court_Clerk
where Court_Clerk.Salary >= 5500 

select * from Plaintiff
where Plaintiff.Id_Plaintiff >= 204 and Plaintiff.Id_Plaintiff <= 209 order by Name_Plaintiff ASC

-- select by Join

select * from Lawyer 
inner join Lawyer_Phone
on Lawyer.Id_Lawyer = Lawyer_Phone.Id_Lawyer;

select * from [Session]
inner join Court_Clerk
on [Session].Id_Court_Clerk = Court_Clerk.Id_Court_Clerk

select * from [Session]
right join Court_Clerk 
on [Session].Id_Court_Clerk = Court_Clerk.Id_Court_Clerk

select * from [Session]
left join Court_Clerk
on [Session].Id_Court_Clerk = Court_Clerk.Id_Court_Clerk

select * from [Session]
full join Court_Clerk
on [Session].Id_Court_Clerk = Court_Clerk.Id_Court_Clerk

select * from Case_Session
inner join [Case]
on [Case].Id_case = Case_Session.Case_Id
inner join [Session]
on [Session].Session_Number = Case_Session.Session_Number;

select * from Lawyer_Case_Defendant
inner join Lawyer
on Lawyer.Id_Lawyer = Lawyer_Case_Defendant.Id_Lawyer
inner join [Case]
on [Case].Id_Case = Lawyer_Case_Defendant.Id_Case
inner join Defendant
on Defendant.Id_Defendant = Lawyer_Case_Defendant.Id_Defedant;

select Lawyer.Name_Lawyer, Defendant.Name_Defendant
from Lawyer
inner join Lawyer_Case_Defendant
on Lawyer.Id_Lawyer = Lawyer_Case_Defendant.Id_Lawyer
inner join Defendant
on Lawyer_Case_Defendant.Id_Defedant = Defendant.Id_Defendant
where Lawyer.Name_Lawyer = 'ahmed salah';

select Court_Clerk.Id_Court_Clerk, Court_Clerk.Cname, 
[Session].Session_Number, [Session].Room_Name, [Session].Session_Date, [Session].Session_Time
from Court_Clerk
inner join [Session]
on [Session].Id_Court_Clerk = Court_Clerk.Id_Court_Clerk
where Court_Clerk.Id_Court_Clerk = 509;

--Aggregate functions

select min( salary ) as MIN_Judge_Salary from Judge

select max( salary ) as MAX_Court_Clerk_Salary from Court_Clerk

select Avg( salary ) as AVG_Court_Clerk_Salary from Court_Clerk

select count( * ) as count_Lawyer from Lawyer

select sum( salary ) as Total_Judge_Salary from Judge

select count( Id_Court_Clerk ) as Number_of_sessions_that_have_court_clerk from [Session]

select count( * ) as All_Session from [Session]

select count( * ) as count_Court_Clerk from Court_Clerk
where Court_Clerk.Salary >= 5500

select city,count( * ) as count_city from Judge
group by City

select city , min( salary ) as MIN_Judge_Salary from Judge
group by city

select  city , count( * ) as Count_city , min( salary ) as MIN_Judge_Salary from Judge
group by city

select city,count( Id_Court_Clerk ) as count_city from Court_Clerk
where Court_Clerk.Salary >= 5500 group by City

select city,count( * ) as count_city from Court_Clerk
group by City
having sum( salary ) >= 12000

select city,count( Id_Judge ) as count_Judge from Judge
where Salary >= 63000 
group by City
having sum( salary ) >= 100000




