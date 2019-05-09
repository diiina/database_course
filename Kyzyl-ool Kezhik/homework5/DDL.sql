create schema if not exists tanchiki2 collate utf8mb4_general_ci;

create table if not exists file
(
	id int auto_increment
		primary key,
	path varchar(255) not null
);

create table if not exists Tank
(
	id int auto_increment
		primary key,
	hp int not null,
	speed int not null,
	brake int not null,
	mass int not null,
	texture_file_id int not null,
	name varchar(255) not null,
	price float not null,
	constraint Tank_file_id_fk
		foreign key (texture_file_id) references file (id)
);

create table if not exists bullet
(
	id int auto_increment
		primary key,
	texture_file_id int not null,
	damage float not null,
	name varchar(255) not null,
	price float not null,
	constraint bullet_file_id_fk
		foreign key (texture_file_id) references file (id)
);

create table if not exists armament
(
	id int auto_increment
		primary key,
	tank int not null,
	bullet int not null,
	constraint armament_Tank_id_fk
		foreign key (tank) references Tank (id),
	constraint armament_bullet_id_fk
		foreign key (bullet) references bullet (id)
);

create table if not exists map
(
	id int auto_increment
		primary key,
	texture_file_id int not null,
	content_file_id int not null,
	name varchar(255) not null,
	constraint map_file_id_fk
		foreign key (content_file_id) references file (id),
	constraint map_texture_id_fk
		foreign key (texture_file_id) references file (id)
);

create table if not exists player
(
	id int auto_increment
		primary key,
	nickname varchar(255) null,
	armament int null,
	score float default 0 not null,
	avatar_file_id int not null,
	coins float default 0 null,
	money float not null,
	constraint player_nickname_uindex
		unique (nickname),
	constraint player_nickname_uindex_2
		unique (nickname),
	constraint player_armament_id_fk
		foreign key (armament) references armament (id)
);

create table if not exists game
(
	id int auto_increment
		primary key,
	name varchar(255) not null,
	creator int not null,
	map int not null,
	constraint game_map_id_fk
		foreign key (map) references map (id),
	constraint game_player_id_fk
		foreign key (creator) references player (id)
);

create table if not exists participant
(
	id int auto_increment
		primary key,
	game int not null,
	player int not null,
	constraint participant_game_id_fk
		foreign key (game) references game (id),
	constraint participant_player_id_fk
		foreign key (player) references player (id)
);

create table if not exists payment
(
	id int auto_increment
		primary key,
	sum float not null,
	dttm timestamp default CURRENT_TIMESTAMP not null,
	player int not null,
	constraint payment_player_id_fk
		foreign key (player) references player (id)
);

create index player_file_id_fk
	on player (avatar_file_id);

create table if not exists room
(
	id int auto_increment
		primary key
);

