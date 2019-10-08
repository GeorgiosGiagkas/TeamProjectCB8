create database quizz_mock character set utf8 collate utf8_general_ci;
use quizz_mock;

create table user(
user_id int auto_increment,
username varchar(30) not null unique,
password varchar(60) not null,
email varchar(60) not null,
primary key(user_id)
);

create table role(
role_id int auto_increment,
role_name varchar(30) not null unique,
primary key(role_id)
);

create table user_role(
user_id int,
role_id int,
primary key(user_id,role_id),
foreign key(user_id) references user(user_id),
foreign key(role_id) references role(role_id)
);


create table category(
category_id int auto_increment,
category_title varchar(60) not null,
primary key(category_id)
);

create table question(
question_id int auto_increment,
question_title text not null,
category_id int,
primary key(question_id),
foreign key(category_id) references category(category_id)
);

create table answer(
answer_id int auto_increment,
answer_title text not null,
primary key(answer_id)
);

create table question_answer(
question_id int,
answer_id int,
correct bit,
primary key(question_id, answer_id),
foreign key(question_id) references question(question_id),
foreign key(answer_id) references answer(answer_id)
);

create table score(
user_id int,
category_id int,
points int,
primary key(user_id,category_id),
foreign key(user_id) references user(user_id),
foreign key(category_id) references category(category_id)
);

drop database quizz_mock;

 