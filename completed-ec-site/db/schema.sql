drop table if exists order_items;
drop table if exists orders;
drop table if exists products;
drop table if exists categories;
drop table if exists members;

create table members (
    id serial primary key,
    name varchar(100) not null,
    email varchar(255) not null unique,
    status varchar(20) not null default 'ACTIVE'
);

create table categories (
    id serial primary key,
    name varchar(100) not null
);

create table products (
    id serial primary key,
    category_id int references categories(id),
    name varchar(200) not null,
    description text,
    price int not null check (price >= 0),
    stock int not null check (stock >= 0),
    status varchar(20) not null default 'SALE'
);

create table orders (
    id serial primary key,
    member_id int references members(id),
    total_amount int not null,
    status varchar(30) not null default 'ORDERED',
    ordered_at timestamp not null default current_timestamp
);

create table order_items (
    id serial primary key,
    order_id int not null references orders(id),
    product_id int not null references products(id),
    quantity int not null check (quantity > 0),
    price int not null
);

insert into categories (name) values ('書籍'), ('PC周辺機器');
insert into products (category_id, name, description, price, stock) values
(1, 'Struts入門', 'Apache Struts学習用書籍', 3000, 10),
(2, '開発用キーボード', 'プログラミング向けキーボード', 12000, 5);
