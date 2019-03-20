create table if not exists online_kino.Movies (
  movie_id serial primary key,
  movie_name varchar(200) not null,
  movie_price int not null
);
create table if not exists online_kino.Actors (
  actor_id serial primary key ,
  actor_name varchar(100) not null,
  actor_surname varchar(100) not null

);
create table if not exists online_kino.Users (
  user_id serial primary key,
  user_name varchar(200) not null
);
create table if not exists online_kino.Comments (
  comment_id serial primary key,
  movie_id integer not null REFERENCES online_kino.Movies(movie_id),
  user_id integer not null references online_kino.Users(user_id),
  comment_text text not null,
  comment_date timestamp not null default current_timestamp

);
create table if not exists online_kino.Payment_methods (
  payment_method_id serial primary key,
  payment_method varchar(100) not null
);
create table if not exists online_kino.Payments (
  payment_id serial primary key,
  payment_method_id integer not null references online_kino.Payment_methods(payment_method_id),
  payment_date timestamp not null default current_timestamp,
  movie_id integer not null references online_kino.Movies(movie_id),
  user_id integer not null references online_kino.Users(user_id)

);
create table if not exists online_kino.Actor_in_Movie (
  movie_id integer not null references online_kino.Movies(movie_id),
  actor_id integer not null references online_kino.Users(user_id)
);

