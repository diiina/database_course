drop table if exists mydate;

create table mydate (
  currentdate date
);

insert into mydate values ('2018-09-07');

select count(distinct users.user_id) as WAU
from users left join sessions on users.user_id = sessions.user_id
where begin_dttm > (select currentdate from mydate) and begin_dttm < date_add((select currentdate from mydate), interval 1 week);

drop table if exists mydate;