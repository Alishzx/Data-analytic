CREATE DATABASE family;
USE family;

CREATE TABLE family_mem (
    member_id int not null auto_increment primary key,
    status VARCHAR(10) NOT NULL,
    member_name varchar (30) NOT NULL,
    birthdate DATE NOT NULL
);

CREATE TABLE payments (
    payment_id int not null auto_increment primary key,
    good_name varchar (40) not null,
    amount DECIMAL(10,2) NOT NULL,
    date date not null
);

CREATE TABLE fam_fr (
    friend_id int not null auto_increment primary key,
    friend_name VARCHAR(30) NOT NULL,
    member_name varchar (30) not null,
    friend_age int not null
);

