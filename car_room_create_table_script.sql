DROP DATABASE car_rooms;
create database car_rooms;
use car_rooms;

create table action(action_id int primary key auto_increment,
action varchar(45));
create table car_status(car_status_id int primary key auto_increment,
status varchar(45));
create table car_type(car_type_id int primary key auto_increment,
type varchar(45));
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
CREATE TABLE car (
    car_id INT PRIMARY KEY AUTO_INCREMENT,
    car_model VARCHAR(45),
    car_price DECIMAL(10 , 2 ),
    car_release_date_id INT,
    car_color_id INT,
    car_type_id INT,
    car_status_id INT,
    CONSTRAINT fk_car_type_id FOREIGN KEY (car_type_id)
        REFERENCES car_type (car_type_id),
    CONSTRAINT fk_car_status_id FOREIGN KEY (car_status_id)
        REFERENCES car_status (car_status_id),
    CONSTRAINT fk_car_color_id FOREIGN KEY (car_color_id)
        REFERENCES car_color (car_color_id),
    CONSTRAINT fk_car_release_date_id FOREIGN KEY (car_release_date_id)
        REFERENCES car_release_date (car_release_date_id)
);
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

      
      