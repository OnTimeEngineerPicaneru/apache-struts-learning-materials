# 25. Docker + Struts開発環境

## 目的

Dockerを使い、Strutsアプリケーションの開発環境を再現性高く構築する方法を学びます。

## Dockerを使う理由

- 開発者ごとの環境差異を減らす
- TomcatやPostgreSQLを簡単に起動できる
- 教材環境を配布しやすい
- CI/CDと接続しやすい
- 本番に近い環境で検証できる

## 基本構成

```text
host
  ├── app container: Tomcat + Struts WAR
  └── db container: PostgreSQL
```

## docker-compose.yml例

```yaml
services:
  app:
    image: tomcat:10.1-jdk17
    ports:
      - "8080:8080"
    volumes:
      - ./sample-struts-app/target/sample-struts-app.war:/usr/local/tomcat/webapps/sample-struts-app.war
    depends_on:
      - db

  db:
    image: postgres:16
    environment:
      POSTGRES_DB: struts_db
      POSTGRES_USER: struts_user
      POSTGRES_PASSWORD: struts_pass
    ports:
      - "5432:5432"
```

## 起動手順

```bash
cd sample-struts-app
mvn clean package
cd ..
docker compose up -d
```

## 動作確認

```text
http://localhost:8080/sample-struts-app/hello
```

## 注意点

- WARをビルドしてからTomcatコンテナへ配置する
- DB接続先は `localhost` ではなくサービス名 `db` を使う
- パスワードを本番用と共用しない
- ボリュームでDBデータを永続化するか判断する

## 演習

1. TomcatとPostgreSQLをdocker composeで起動する
2. WARをTomcatコンテナへ配置する
3. DB接続先をDocker用に変更する
4. コンテナを削除してもDBデータを保持する設定を追加する
