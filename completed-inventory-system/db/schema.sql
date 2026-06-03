drop table if exists operation_logs;
drop table if exists stock_movements;
drop table if exists stocks;
drop table if exists warehouses;
drop table if exists products;
drop table if exists users;

create table users (
    id serial primary key,
    login_id varchar(100) not null unique,
    role varchar(30) not null
);

create table products (
    id serial primary key,
    code varchar(50) not null unique,
    name varchar(200) not null,
    status varchar(20) not null default 'ACTIVE'
);

create table warehouses (
    id serial primary key,
    code varchar(50) not null unique,
    name varchar(200) not null,
    address varchar(500)
);

create table stocks (
    id serial primary key,
    product_id int not null references products(id),
    warehouse_id int not null references warehouses(id),
    quantity int not null check (quantity >= 0),
    version int not null default 0,
    unique(product_id, warehouse_id)
);

create table stock_movements (
    id serial primary key,
    product_id int not null references products(id),
    from_warehouse_id int references warehouses(id),
    to_warehouse_id int references warehouses(id),
    quantity int not null check (quantity > 0),
    movement_type varchar(30) not null,
    moved_at timestamp not null default current_timestamp
);

create table operation_logs (
    id serial primary key,
    user_id int references users(id),
    operation_type varchar(100) not null,
    operated_at timestamp not null default current_timestamp
);

insert into users (login_id, role) values ('admin', 'ADMIN');
insert into products (code, name) values ('P001', 'ノートPC'), ('P002', 'キーボード');
insert into warehouses (code, name, address) values ('W001', '東京倉庫', '東京都'), ('W002', '大阪倉庫', '大阪府');
insert into stocks (product_id, warehouse_id, quantity) values (1, 1, 10), (2, 1, 20), (1, 2, 5);
