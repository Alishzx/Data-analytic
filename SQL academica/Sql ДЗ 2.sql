create database University;
use  University;

create table Address
(
id int primary key not null auto_increment,
Country varchar(20) not null,
county varchar(20) not null,
City varchar(20) not null,
Street varchar(20) not null,
Number int not null
);

create table Person
(
id int primary key not null auto_increment,
Firstname varchar(20) not null,
Lastname varchar(20) not null,
Phonenumber varchar(20) not null unique,
Birthdate date not null,
Addressid int not null,
foreign key (Addressid) references Address(id)
);

create table Student
(
id int primary key not null auto_increment,
Personid int not null,
Description varchar(100) default " ",
foreign key (Personid) references Person(id)
);

create table Teacher
(
id int primary key not null auto_increment,
Position varchar(20) not null,
Personid int not null,
Foreign key(Personid) references Person(id) ON DELETE CASCADE
);

create table Course
(
id int primary key not null auto_increment,
Name varchar(20) not null,
Credits int not null,
Description varchar(100) default " ",
Teacherid int not null,
Foreign key (Teacherid) references Teacher(id) ON DELETE CASCADE
);
