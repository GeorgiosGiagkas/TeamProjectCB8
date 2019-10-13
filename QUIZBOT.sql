create database QUIZBOT character set utf8 collate utf8_general_ci;
use QUIZBOT;

create table role(
role_id int auto_increment,
role_name varchar(30) not null unique,
primary key(role_id)
);

create table user(
user_id int auto_increment,
user_nickname varchar(15) not null unique,
user_password varchar(60) not null,
user_email varchar(60) not null,
role_id int  not null,
primary key(user_id),
foreign key(role_id) references role(role_id) on delete cascade on update restrict
);


create table category(
category_id int auto_increment,
category_name varchar(30) not null unique,
category_image blob not null,
primary key(category_id)
);

create table question(
question_id int auto_increment,
question_content text not null ,
category_id int not null,
primary key(question_id),
foreign key(category_id) references category(category_id) on delete cascade on update restrict
);

create table answer(
answer_id int auto_increment,
answer_content text not null,
primary key(answer_id)
);

create table question_answer(
question_id int,
answer_id int,
question_answer_correct bit,
primary key(question_id, answer_id),
foreign key(question_id) references question(question_id) on delete cascade on update restrict,
foreign key(answer_id) references answer(answer_id) on delete cascade on update restrict
);

create table user_question(
user_id int not null,
question_id int not null,
user_question_success bit not null,
user_question_timespamp timestamp not null,
foreign key(user_id) references user(user_id) on delete cascade on update restrict,
foreign key(question_id) references question(question_id) on delete cascade on update restrict
);


create table user_highscore(
user_id int,
category_id int,
highscore int,
primary key(user_id,category_id),
foreign key(user_id) references user(user_id),
foreign key(category_id) references category(category_id)
);


create table avatar(
avatar_id int auto_increment,
avatar_name varchar(20) not null,
avatar_cost decimal(4,2)  not null,
avatar_image blob not null,
primary key(avatar_id)
);

create table user_avatar(
user_id int not null,
avatar_id int not null,
foreign key(user_id) references user(user_id) on delete cascade on update restrict,
foreign key(avatar_id) references avatar(avatar_id) on delete cascade on update restrict
);


-- drop database quizz_mock;

 