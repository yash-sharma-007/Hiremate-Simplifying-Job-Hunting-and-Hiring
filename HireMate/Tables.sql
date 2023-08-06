create database mysql;
use mysql;
select database();

drop table if exists emp;
create table emp (
    name varchar(255),
    email varchar(255) primary key,
    address varchar(255),
    num bigint,
    age int,
    clg varchar(255),
    branch varchar(255),
    year int,
    skills varchar(255),
    title varchar(255),
    cname varchar(255),
    username varchar(255),
    password varchar(255),
    status varchar(255) default 'Not Applied',
);

drop table if exists inter;
CREATE TABLE inter (
    title varchar(255),
    salary int,
    city varchar(255),
    edu varchar(255),
    exp int,
    req varchar(255),
    cname varchar(255),
    username varchar(255) PRIMARY KEY,
    password varchar(255)
);