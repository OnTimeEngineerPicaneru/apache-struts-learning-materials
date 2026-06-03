# 13. JDBC ConnectionPool編

## 目的

JDBC接続を毎回生成せず、ConnectionPoolを利用して性能と安定性を高める方法を学びます。

## なぜConnectionPoolが必要か

DB接続の生成は高コストです。リクエストごとに `DriverManager.getConnection()` を呼び出す設計では、アクセス増加時に性能低下や接続枯渇が発生します。

ConnectionPoolを使うと、事前に確保した接続を再利用できます。

## 基本構成

```text
Action
  ↓
Service
  ↓
Repository
  ↓
DataSource
  ↓
ConnectionPool
  ↓
Database
```

## 実務での推奨

- `DriverManager` を直接使わない
- `DataSource` を利用する
- コネクションは必ず `close()` する
- `close()` は物理切断ではなくプールへの返却になる
- 最大接続数、タイムアウト、アイドル接続数を設定する

## TomcatのDataSource設定例

`context.xml` の例です。

```xml
<Resource name="jdbc/appDb"
          auth="Container"
          type="javax.sql.DataSource"
          maxTotal="20"
          maxIdle="10"
          maxWaitMillis="10000"
          username="app_user"
          password="password"
          driverClassName="org.postgresql.Driver"
          url="jdbc:postgresql://localhost:5432/app_db" />
```

## Repositoryでの利用例

```java
public class UserRepository {

    private final DataSource dataSource;

    public UserRepository(DataSource dataSource) {
        this.dataSource = dataSource;
    }

    public List<User> findAll() throws SQLException {
        String sql = "select id, name, email from users order by id";
        List<User> users = new ArrayList<>();

        try (Connection con = dataSource.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                User user = new User();
                user.setId(rs.getInt("id"));
                user.setName(rs.getString("name"));
                user.setEmail(rs.getString("email"));
                users.add(user);
            }
        }
        return users;
    }
}
```

## 注意点

- `Connection` をフィールドに持たない
- `Connection` を使い回さない
- `try-with-resources` で必ず返却する
- トランザクション境界をService層で検討する
- プールサイズはDB側の最大接続数と合わせて設計する

## 演習

1. DataSourceを使うRepositoryに書き換える
2. TomcatのResource設定を作成する
3. 最大接続数を変更し、設定値の意味を説明する
4. `try-with-resources` を使わない場合の問題点を説明する
