use vk;
select * from users;
select * from messages
where to_user_id=315;

select firstname, lastname from users where id =(
select from_user_id from messages where to_user_id =348 group by from_user_id order by count(from_user_id) desc limit 1);

select count(*)
from likes where user_id in (select user_id from profiles where timestampdiff(year,birtday,now())<10);

select gender,
case gender
when 'f' then 'female'
when 'm' then 'male'
end more_likes,
count(*)
from profiles where user_id in (select user_id from likes)
group by gender
having count(*)>1
limit 1;