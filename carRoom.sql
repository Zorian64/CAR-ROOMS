DROP database car_rooms;
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
create table client(client_id int primary key auto_increment,
client_phone_number varchar(13),
person_id int,
constraint fk_client_person_id foreign key (person_id) references person (person_id));
create table car_rooms(car_room_id int primary key auto_increment,
car_room_name varchar(45),
address_id int,
constraint fk_car_rooms_address_id foreign key (address_id) references address (address_id));
create table car(car_id int primary key auto_increment,
car_model varchar(45),
car_price decimal(10,2),
car_release_date_id int,
car_color_id int,
constraint fk_car_color_id foreign key (car_color_id) references car_color (car_color_id),
constraint fk_car_release_date_id foreign key (car_release_date_id) references car_release_date (car_release_date_id));
create table car_room_cars(car_room_cars_id int primary key auto_increment,
car_room_id int,
car_id int,
constraint fk_car_room_cars_car_room_id foreign key (car_room_id) references car_rooms (car_room_id),
constraint fk_car_room_cars_car_id foreign key (car_id) references car (car_id));
create table employees(employee_id int primary key auto_increment,
person_id int,
car_room_id int,
employee_position_id int,
constraint fk_employee_person_id foreign key (person_id) references person (person_id),
constraint fk_employee_car_room_id foreign key (car_room_id) references car_rooms (car_room_id),
constraint fk_employee_position_id foreign key (employee_position_id) references employee_position (employee_position_id));
create table information_about_buying(information_about_buying_id int primary key auto_increment,
car_id int,
employee_id int,
client_id int,
action_id int,
buy_date datetime,
constraint fk_information_about_buying_car_id foreign key (car_id) references car(car_id),
constraint fk_information_about_buying_employee_id foreign key (employee_id) references employees (employee_id),
constraint fk_information_about_buying_client_id foreign key (client_id) references client (client_id),
constraint fk_information_about_buying_action_id foreign key (action_id) references action (action_id));
insert into action(action)
values('bought for cash'),
      ('bought on credit'),
      ('made the order');
insert into car_color(car_color)
values('white'),
      ('black'),
      ('red'),
      ('green'),
      ('yellow'),
      ('blue');
insert into car_release_date(car_release_year)
values(1999),
      (2000),
      (2001),
      (2002),
      (2003),
      (2004),
      (2005),
      (2006),
      (2007),
      (2008),
      (2009),
      (2010),
      (2011),
      (2012),
      (2013),
      (2014),
      (2015);
insert into employee_position(employee_position)
values('Director'),
      ('Sales Manager'),
      ('Mechanics');
insert into city(city)
values('Lviv'),
      ('Kyiv'),
      ('Odessa'),
      ('Lugansk'),
      ('Donetsk');
insert into address(city_id,address)
values(1,'Shyroka 10'),
      (1,'Patona 3'),
      (1,'Vyhovskogo 10'),
      (1,'Lyubinska 35'),
      (1,'Zolota 73'),
      (1,'Antonovicha 100'),
      (1,'Gorodotska 257'),
      (1,'Valova 7'),
      (1,'Shevchenka 21'),
      (1,'Lychalivska 99'),
      (2,'Instytutska 9'),
      (2,'Khreschatyk 20'),
      (2,'Bankova 1'),
      (2,'Centralna 71'),
      (2,'Tsytadelna 2'),
      (3,'Promyslova 11'),
      (3,'Pekarska 91'),
      (3,'Morska 33'),
      (3,'Derebasivska 12'),
      (4,'Octyabrska 3'),
      (4,'Pushkina 5'),
      (4,'Parachutna 70'),
      (4,'Locomotivna 39'),
      (5,'Communards 17'),
      (5,'Petra 24');
insert into person(person_first_name,person_second_name,person_age,address_id)
values('Юра','Жеребух',21,1),
      ('Ростик','Чорий',25,2),
	  ('Оля','Флис',19,3),
      ('Максим','Артим',21,4),
      ('Настя','Друль',22,5),
      ('Юра','Байдала',21,6),
      ('Андрій','Проць',24,7),
      ('Юра','Пономарчук',26,8),
      ('Володимир','Мельничук',22,9),
      ('Юра','Жеребух',21,10),
      ('Олег','Зелінський',23,11),
      ('Олег','Волошин',27,12),
      ('Назар','Федорига',30,13),
      ('Роман','Жеребух',32,14),
      ('Микола','Прокіпчук',21,2),
      ('Оксана','Цибульська',18,1),
      ('Катя','Цибульська',21,1),
      ('Роксолана','Пономарчук',21,8),
      ('Зорян','Федорига',21,2),
      ('Юра','Лучків',21,15),
      ('Роман','Федорига',27,16),
      ('Роман','Гаврилюк',26,17),
      ('Анатолій','Ччасов',35,18),
      ('Юра','Антонов',28,19),
      ('Андрій','Федорига',55,3),
      ('Тарас','Цибульський',45,1),
      ('Роман','Проць',21,20),
      ('Богдан','Качмар',21,21),
      ('Юра','Качмар',21,22),
      ('Юра','Куриляк',21,23),
      ('Антон','Маслюков',29,24),
      ('Володимир','Пришляк',36,25),
      ('Володимир','Галай',40,2);
insert into client(person_id,client_phone_number)
values(1,'+380636589785'),
      (2,'+380630354514'),
      (3,'+380656500005'),
	  (4,'+380676222213'),
	  (5,'+380950521535'),
      (6,'+380506546545'),
      (7,'+380935303203'),
      (8,'+380985465546'),
      (9,'+380456364665'),
      (10,'+380636589755'),
      (11,'+380322408285');
insert into car_rooms(car_room_name,address_id)
values('BMW ROOM',1),
	  ('OPEL ROOM',11),
      ('VAZ ROOM',16),
      ('NISSAN ROOM',20),
      ('TOYOTA ROOM',24);
insert into car(car_model,car_price,car_release_date_id,car_color_id)
values('BMW',4500,2,2),
      ('OPEL',6200,10,1),
      ('VAZ',1200,3,5),
      ('NISSAN',20000,15,4),
      ('TOYOTA',24000,17,6);
insert into car_room_cars(car_room_id,car_id)
values(1,1),
      (2,2),
      (3,3),
      (4,4),
      (5,5);
insert into employees(person_id,car_room_id,employee_position_id)
values(12,1,1),
      (13,1,2),
      (14,1,3),
      (15,2,1),
      (16,2,2),
      (17,2,3),
      (18,3,1),
      (19,3,2),
      (20,3,3),
      (21,4,1),
      (22,4,2),
      (23,4,3),
      (24,5,1),
      (25,5,2),
      (26,5,3);
insert into information_about_buying(car_id,employee_id,action_id,client_id,buy_date)
values(1,2,1,1,'2015-01-05 12:59:59'),
      (1,5,2,2,'2014-07-06 13:59:59'),
      (2,8,2,3,'2013-06-07 14:59:59'),
      (3,11,2,4,'2012-05-08 15:59:59'),
      (4,14,2,5,'2011-04-09 16:59:59'),
      (5,5,3,6,'2010-03-10 17:59:59'),
      (1,2,3,7,'2009-02-11 18:59:59');
