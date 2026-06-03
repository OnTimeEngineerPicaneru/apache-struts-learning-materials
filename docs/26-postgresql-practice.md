# 26. PostgreSQL実践編

## 目的

StrutsアプリケーションからPostgreSQLを利用し、実務的なDB設計とSQL実装を学びます。

## PostgreSQLを使う理由

- 業務システムで利用実績が多い
- 標準SQLに比較的準拠している
- トランザクション機能が強い
- Dockerで扱いやすい

## 接続情報例

```text
host: localhost
port: 5432
database: struts_db
user: struts_user
password: struts_pass
```

## Maven依存関係

```xml
<dependency>
    <groupId>org.postgresql</groupId>
    <artifactId>postgresql</artifactId>
    <version>42.7.4</version>
</dependency>
```

## テーブル例

```sql
create table members (
    id serial primary key,
    name varchar(100) not null,
    email varchar(255) not null unique,
    phone varchar(30),
    status varchar(20) not null,
    created_at timestamp not null default current_timestamp,
    updated_at timestamp not null default current_timestamp
);
```

## Repository実装の注意

- PreparedStatementを使用する
- 文字列連結でSQLを作らない
- トランザクション境界を明確にする
- SQL例外をそのまま画面に出さない
- ConnectionPoolを利用する

## 検索SQL例

```sql
select id, name, email, phone, status
from members
where (:name is null or name like '%' || :name || '%')
order by id desc;
```

JDBCでは名前付きパラメータは標準では使えないため、`?` に置き換えます。

## インデックス設計

検索対象にはインデックスを検討します。

```sql
create index idx_members_email on members(email);
create index idx_members_status on members(status);
```

## 演習

1. membersテーブルを作成する
2. insert/select/update/deleteを実装する
3. emailに一意制約を追加する
4. 検索条件に応じたSQLを作成する
5. インデックスが必要なカラムを説明する
