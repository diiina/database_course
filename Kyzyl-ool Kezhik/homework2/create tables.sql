create table payments
(
  payment_id   int auto_increment,
  user_id      int       not null,
  payment_sum  double    not null,
  payment_dttm timestamp not null,
  constraint payments_payment_id_uindex
    unique (payment_id),
  constraint payments_users_user_id_fk
    foreign key (user_id) references `some database`.users (user_id)
);

alter table payments
  add primary key (payment_id);

create table sessions
(
  session_id int auto_increment,
  user_id    int       not null,
  begin_dttm timestamp not null,
  end_dttm   timestamp not null,
  constraint sessions_session_id_uindex
    unique (session_id),
  constraint sessions_users_user_id_fk
    foreign key (user_id) references `some database`.users (user_id)
);

alter table sessions
  add primary key (session_id);

create table users
(
  user_id  int auto_increment,
  login    varchar(20) not null,
  reg_dttm timestamp   not null,
  constraint users_login_uindex
    unique (login),
  constraint users_user_id_uindex
    unique (user_id)
);

alter table users
  add primary key (user_id);

