use car_rooms;
select person.person_first_name,person.person_second_name,information_about_buying.buy_date 
from  person join employees on person.person_id= employees.person_id 
			 join information_about_buying on information_about_buying.employee_id= employees.employee_id
where information_about_buying.buy_date='2009-02-11 18:59:59'; 

select person.person_first_name,person.person_second_name,employee_position.employee_position,client.client_phone_number,city.city 
from  person join employees on person.person_id= employees.person_id 
			 join employee_position on employee_position.employee_id= employees.employee_id
             join city on city.city_id=person.city_id,
      person join client on person.person_id= client.person_id
    
where information_about_buying.buy_date='2009-02-11 18:59:59'; 