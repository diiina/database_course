drop table if exists mydate;

create table mydate (
  currentdate date
);

insert into mydate values ('2018-09-07');

with
t1 as (
  select count(distinct users.user_id) as AMOUNT_OF_UNIQUE_USERS_PAID_FOR_THE_DAY
  from users join payments on users.user_id = payments.user_id
  where payment_dttm > (select currentdate from mydate) and payment_dttm < date_add((select currentdate from mydate), interval 1 day)),
t2 as (
  select count(distinct users.user_id) as DAU
  from users left join sessions on users.user_id = sessions.user_id
  where begin_dttm > (select currentdate from mydate) and begin_dttm < date_add((select currentdate from mydate), interval 1 day)
)
select t1.AMOUNT_OF_UNIQUE_USERS_PAID_FOR_THE_DAY / t2.DAU from t1, t2;

drop table if exists mydate;



