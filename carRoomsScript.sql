drop database car_rooms; 
create database car_rooms;
use car_rooms;
create table action(action_id int primary key auto_increment,
action varchar(45));
create table car_color(car_color_id int primary key auto_increment,
car_color varchar(45));
create table car_release_date(car_release_date_id int primary key auto_increment,
car_release_year year(4));
create table city(city_id int primary key auto_increment,
city varchar(45));
create table address(address_id int primary key auto_increment,
address varchar(45),
city_id int,
constraint fk_address_city_id foreign key (city_id) references city (city_id));
create table employee_position(employee_position_id int primary key auto_increment,
employee_position varchar(45));
create table person(person_id int primary key auto_increment,
person_first_name varchar(45),
person_second_name varchar(45),
person_age varchar(45),
address_id int,
constraint fk_person_address_id foreign key (address_id) references address (address_id));