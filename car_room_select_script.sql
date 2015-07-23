select * from person where person_first_name='Юра';   
select car_id,employee_id,action_id,client_id,buy_date from information_about_buying ;     
select car_id,car_price
from car
where car_price>10000
group by car_id;
select * from client
where person_id in(select person_id from person where person_age=21 )
group by client_id;