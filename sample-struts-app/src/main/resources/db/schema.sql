drop table if exists members;

create table members (
    id serial primary key,
    name varchar(100) not null,
    email varchar(255) not null unique,
    phone varchar(30),
    status varchar(20) not null default 'ACTIVE',
    created_at timestamp not null default current_timestamp,
    updated_at timestamp not null default current_timestamp
);

insert into members (name, email, phone, status) values
('山田太郎', 'yamada@example.com', '090-1111-1111', 'ACTIVE'),
('佐藤花子', 'sato@example.com', '090-2222-2222', 'ACTIVE'),
('鈴木一郎', 'suzuki@example.com', '090-3333-3333', 'INACTIVE');

create index idx_members_email on members(email);
create index idx_members_status on members(status);
