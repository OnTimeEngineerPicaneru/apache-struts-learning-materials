drop table if exists operation_logs;
drop table if exists members;
drop table if exists users;

create table users (
    id serial primary key,
    login_id varchar(100) not null unique,
    password_hash varchar(255) not null,
    role varchar(30) not null,
    status varchar(20) not null default 'ACTIVE',
    created_at timestamp not null default current_timestamp,
    updated_at timestamp not null default current_timestamp
);

create table members (
    id serial primary key,
    name varchar(100) not null,
    email varchar(255) not null unique,
    phone varchar(30),
    status varchar(20) not null default 'ACTIVE',
    created_at timestamp not null default current_timestamp,
    updated_at timestamp not null default current_timestamp
);

create table operation_logs (
    id serial primary key,
    user_id int references users(id),
    operation_type varchar(100) not null,
    target_table varchar(100),
    target_id int,
    operated_at timestamp not null default current_timestamp
);

insert into users (login_id, password_hash, role) values
('admin', 'dummy-hash-for-learning', 'ADMIN');

insert into members (name, email, phone, status) values
('山田太郎', 'yamada@example.com', '090-1111-1111', 'ACTIVE'),
('佐藤花子', 'sato@example.com', '090-2222-2222', 'ACTIVE'),
('鈴木一郎', 'suzuki@example.com', '090-3333-3333', 'INACTIVE');
